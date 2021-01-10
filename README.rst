
rduty: a simple and quick program to execute and automate remote commands.
==========================================================================================================

rduty is a Python script to easily and quickly run a command or multiple commands on remote and local 
hosts and devices via ssh (telnet is also supported). It is also able to automate repetitive tasks on 
many hosts using inventory files from Ansible, or simple .ini inventory files.

rduty is currently tested on Python3, it hasn't been tested yet on other
Python versions.


Installation
------------
The rduty package is installation is very simple, but there are some 
dependencies which you might have to install as well:

.. code-block:: console

  $ sudo pip install paramiko
  
.. code-block:: console

   $ make install

By default rduty will be installed with the '/usr/local' prefix. You can 
change this by passing 'PREFIX=the_prefix' to make:

.. code-block:: console

   $ make PREFIX=/usr install

When rduty is executed it will check for the needed dependencies and report
if anything is missing.


Usage
-----




Command line
~~~~~~~~~~~~

.. A DRY solution to avoid duplication of the `py2deb --help' text:
..
.. [[[cog
.. from humanfriendly.usage import inject_usage
.. inject_usage('py2deb.cli')
.. ]]]

**Usage:** `py2deb [OPTIONS] ...`

Convert Python packages to Debian packages according to the given
command line options (see below). The command line arguments are the
same as accepted by the "pip install" command because py2deb invokes
pip during the conversion process. This means you can name the
package(s) to convert on the command line but you can also use
"requirement files" if you prefer.

If you want to pass command line options to pip (e.g. because you want
to use a custom index URL or a requirements file) then you will need
to tell py2deb where the options for py2deb stop and the options for
pip begin. In such cases you can use the following syntax:

.. code-block:: sh

  $ py2deb -r /tmp -- -r requirements.txt

So the "--" marker separates the py2deb options from the pip options.

**Options:**

.. csv-table::
   :header: Option, Description
   :widths: 30, 70

   "``-S``, ``--script FILENAME``","Load jghjghjghj
     
   Can also be set using the environment variable ``$PY2DEB_CONFIG``."
   "``-r``, ``--repository=DIRECTORY``","Change the directory where \*.deb archives are stored. Defaults to
   the system wide temporary directory (which is usually /tmp). If
   this directory doesn't exist py2deb refuses to run.
   
   Can also be set using the environment variable ``$PY2DEB_REPOSITORY``."
   "``--use-system-package=PYTHON_PACKAGE_NAME,DEBIAN_PACKAGE_NAME``","Exclude a Python package (the name before the comma) from conversion and
   replace references to the Python package with a specific Debian package
   name. This allows you to use system packages for specific Python
   requirements."
   ``--name-prefix=PREFIX``,"Set the name prefix used during the name conversion from Python to
   Debian packages. Defaults to ""python"". The name prefix and package
   names are always delimited by a dash.
   
   Can also be set using the environment variable ``$PY2DEB_NAME_PREFIX``."
   ``--no-name-prefix=PYTHON_PACKAGE_NAME``,"Exclude a Python package from having the name prefix applied
   during the package name conversion. This is useful to avoid
   awkward repetitions."
   "``--rename=PYTHON_PACKAGE_NAME,DEBIAN_PACKAGE_NAME``","Override the package name conversion algorithm for the given pair
   of package names. Useful if you don't agree with the algorithm :-)"
   ``--install-prefix=DIRECTORY``,"Override the default system wide installation prefix. By setting
   this to anything other than ""/usr"" or ""/usr/local"" you change the
   way py2deb works. It will build packages with a file system layout
   similar to a Python virtual environment, except there will not be
   a Python executable: The packages are meant to be loaded by
   modifying Python's module search path. Refer to the documentation
   for details.
   
   Can also be set using the environment variable ``$PY2DEB_INSTALL_PREFIX``."
   "``--install-alternative=LINK,PATH``","Use Debian's ""update-alternatives"" system to add an executable
   that's installed in a custom installation prefix (see above) to
   the system wide executable search path. Refer to the documentation
   for details."
   ``--python-callback=EXPRESSION``,"Set a Python callback to be called during the conversion process. Refer to
   the documentation for details about the use of this feature and the syntax
   of ``EXPRESSION``.
   
   Can also be set using the environment variable ``$PY2DEB_CALLBACK``."
   ``--report-dependencies=FILENAME``,"Add the Debian relationships needed to depend on the converted
   package(s) to the given control file. If the control file already
   contains relationships the additional relationships will be added
   to the control file; they won't overwrite existing relationships."
   "``-y``, ``--yes``","Instruct pip-accel to automatically install build time dependencies
   where possible. Refer to the pip-accel documentation for details.
   
   Can also be set using the environment variable ``$PY2DEB_AUTO_INSTALL``."
   "``-v``, ``--version``",output version information and exit.
   "``-h``, ``--help``",show this help and exit.

.. [[[end]]]



Contact
-------

The latest version of py2deb is available on PyPI_ and GitHub_. The
documentation is hosted on `Read the Docs`_ and includes a changelog_. For
questions, bug reports, suggestions, etc. please create an issue on GitHub_.

License
-------

This software is licensed under the `GNU GPL2`_.

© 2020 Gabriele Giorgetti.
