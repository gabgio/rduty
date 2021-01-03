#!/usr/bin/make -s

PACKAGE=rduty
VERSION=0.2.1

# install architecture-independent files
PREFIX=/usr/local
# system admin executables
SBINDIR=$(PREFIX)/sbin
# system admin executables
BINDIR=$(PREFIX)/bin
# object code libraries
LIBDIR=$(PREFIX)/lib
# read-only architecture-independent data
DATADIR=$(PREFIX)/share
# man documentation
MANDIR=$(PREFIX)/man

DIST=\
	AUTHORS			\
	COPYING			\
	ChangeLog		\
	Makefile		\
	README			\
	INSTALL			\
	src/rduty.py		\
	doc/rduty.1


## for more files import
##src/$(PACKAGE): src/$(PACKAGE).py
##	#@# sets the rduty import dir according to LIBDIR and installs the rduty script	
##	#@sed "s|os.curdir|os.curdir,'$(LIBDIR)\/$(PACKAGE)'|g" src/$(PACKAGE).py > src/$(PACKAGE)
##	#@echo "Type 'make install' to install $(PACKAGE)"

src/$(PACKAGE): src/$(PACKAGE).py
	@cp src/$(PACKAGE).py src/$(PACKAGE)
	@echo "Type 'make install' to install $(PACKAGE)"


	
all: src/$(PACKAGE)

clean:
	rm -f *~
	rm -f src/*~
	rm -f doc/*~
	rm -f src/*pyc
	rm -f src/$(PACKAGE)
	
distclean: clean
	rm -f $(PACKAGE)-$(VERSION).tar.*
	rm -f $(PACKAGE)-$(VERSION)*.deb
	rm -rf debian
	rm -rf .install_prefix
	
distgz: distclean
	mkdir $(PACKAGE)-$(VERSION)
	cp --recursive --parents $(DIST) $(PACKAGE)-$(VERSION)
	tar -zcvf $(PACKAGE)-$(VERSION).tar.gz $(PACKAGE)-$(VERSION)
	rm -r $(PACKAGE)-$(VERSION)
	
distbz2: distclean
	rm -f *~
	mkdir $(PACKAGE)-$(VERSION)
	cp --recursive --perents $(DIST) $(PACKAGE)-$(VERSION)
	tar -jcvf $(PACKAGE)-$(VERSION).tar.bz2 $(PACKAGE)-$(VERSION)
	rm -r $(PACKAGE)-$(VERSION)

deb: distclean
	mkdir -p debian
	$(MAKE) PREFIX=/usr MANDIR=/usr/share/man
	$(MAKE) PREFIX=`pwd`/debian/usr MANDIR=`pwd`/debian/usr/share/man install 
	
	mkdir -p debian/DEBIAN
	@echo "Package: $(PACKAGE)" > debian/DEBIAN/control
	@echo "Version: $(VERSION)-1" >> debian/DEBIAN/control
	@echo "Section: admin"  >> debian/DEBIAN/control
	@echo "Priority: optional"  >> debian/DEBIAN/control
	@echo "Architecture: all"  >> debian/DEBIAN/control
	@echo "Depends: python (>= 2.2)"  >> debian/DEBIAN/control
	@echo "Maintainer: Gabriele Giorgetti <gabriele_giorgetti@tin.it>"  >> debian/DEBIAN/control
	@echo "Description: Controls the speed and the voltage of CPUs."  >> debian/DEBIAN/control
	@echo "  This is a simple script written in Python which allows you to" >> debian/DEBIAN/control
	@echo "  change the clock speed and voltage of the CPUs. It can use the" >> debian/DEBIAN/control
	@echo "  Linux kernel sysfs interface (v2.5/v2.6), the CPUFreq 24 API" >> debian/DEBIAN/control
	@echo "  (/proc/sys/cpu..., v2.4), or the CPUFREQ_PROC. The use of the" >> debian/DEBIAN/control
	@echo "  sysfs interface is preferred since the other interfaces are" >> debian/DEBIAN/control
	@echo "  now deprecated and offer far less functionality. All you need" >> debian/DEBIAN/control
	@echo "  is a supported CPU and a kernel which has support for one of" >> debian/DEBIAN/control
	@echo "  the interfeces listed above. cpuspeedy is just a user space" >> debian/DEBIAN/control
	@echo "  program, so it will work on every processor supported by the" >> debian/DEBIAN/control
	@echo "  kernel's CPUFreq driver. Use it and you should save battery" >> debian/DEBIAN/control
	@echo "  consumption and reduce the temperature of your laptop." >> debian/DEBIAN/control 
		      
	dpkg-deb --build debian
	mv debian.deb $(PACKAGE)-$(VERSION)-1_all.deb
	rm -r debian

dist: distgz

install: src/$(PACKAGE)
	@# creates directories
	install --owner 0:0 -d $(BINDIR) 
	install --owner 0:0 -d $(LIBDIR)/$(PACKAGE) 
	install --owner 0:0 -d $(DATADIR)/doc/$(PACKAGE)
	install --owner 0:0 -d $(MANDIR)/man1
	
	#@# installs cpuspeedy modules
	#install --mode 0644 --owner 0:0  src/messages.py        $(LIBDIR)/$(PACKAGE)/  
	#install --mode 0644 --owner 0:0  src/errors.py          $(LIBDIR)/$(PACKAGE)/  
	#install --mode 0644 --owner 0:0  src/pycpufreq.py       $(LIBDIR)/$(PACKAGE)/  
	#install --mode 0644 --owner 0:0  src/pythermalzone.py   $(LIBDIR)/$(PACKAGE)/  
	#install --mode 0644 --owner 0:0  src/pycpufreq_api24.py $(LIBDIR)/$(PACKAGE)/
	#install --mode 0644 --owner 0:0  src/pycpufreq_proc.py  $(LIBDIR)/$(PACKAGE)/
	#install --mode 0644 --owner 0:0  src/pycpufreq_sysfs.py $(LIBDIR)/$(PACKAGE)/
	
	@# installs rduty
	install --mode 0755 --owner 0:0 src/$(PACKAGE) $(SBINDIR)/$(PACKAGE)
	
	@# installs cpuspeedy doc files
	install --mode 0644 --owner 0:0 AUTHORS    $(DATADIR)/doc/$(PACKAGE)/
	install --mode 0644 --owner 0:0 ChangeLog  $(DATADIR)/doc/$(PACKAGE)/
	install --mode 0644 --owner 0:0 COPYING    $(DATADIR)/doc/$(PACKAGE)/
	install --mode 0644 --owner 0:0 README     $(DATADIR)/doc/$(PACKAGE)/
	install --mode 0644 --owner 0:0 INSTALL     $(DATADIR)/doc/$(PACKAGE)/

	@# installs rduty man page
	install --mode 0644 --owner 0:0 doc/$(PACKAGE).1  $(MANDIR)/man1/
	gzip -f $(MANDIR)/man1/$(PACKAGE).1

	@# Write install prefix for the uninstall procedure
	@echo $(PREFIX) > .install_prefix

uninstall:
	if [ -f ".install_prefix" ]; \
	then \
		rm -rf $(shell cat .install_prefix)/lib/$(PACKAGE); \
		rm -rf $(shell cat .install_prefix)/share/doc/$(PACKAGE); \
		rm -f  $(shell cat .install_prefix)/sbin/$(PACKAGE); \
		rm -f  $(shell cat .install_prefix)/man/man1/$(PACKAGE).1.gz; \
		rm -f .install_prefix; \
	fi

