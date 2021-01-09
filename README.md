


rduty

  A simple and easy to use program to control the speed and the 
  voltage of CPUs on the fly.



Overview

  This is a simple script written in Python which allows you to 
  change the clock speed and voltage of the CPUs. It can use the 
  Linux kernel sysfs interface (v2.5/v2.6), the CPUFreq 24 API 
  (/proc/sys/cpu..., v2.4), or the CPUFREQ_PROC (/proc/cpufreq). 
  The use of the sysfs interface is preferred since the other 
  interfaces are now deprecated and offer far less functionality. 
  All you need is a supported CPU and a kernel which has support 
  for one of the interfeces listed above. 
  cpuspeedy is just a user space program, so it will work on 
  every processor supported by the kernel's CPUFreq driver. 
  Use it and you should save battery consumption and reduce the 
  temperature of your laptop.



Software prerequisites

  A recent Python version (www.python.org). It should come with
  your Linux Distribution.



Download

  The latest version of cpuspeedy can be downloaded at:
  http://cpuspeedy.sourceforge.net
 


Installation

  become the superuser, then type:
  # make install

  By default rduty will be installed with the '/usr/local'
  prefix. You can change this by passing 'PREFIX=the_prefix' 
  to make. Eg:
  
  # make PREFIX=/usr install


 
Usage

  cpuspeedy has to be run as root.
  
  Examples:
  
  # cpuspeedy --help
  # cpuspeedy --freqs
  # cpuspeedy 800 Mhz
  # cpuspeedy 2.0 Ghz
  # cpuspeedy low
  
  Type 'man cpuspeedy' for more information
  


Copyright and author

  rduty was written by Gabriele Giorgetti and is free 
  software licensed under the GNU GPL.

  
 
Bugs
  
  Please send comments, whishes, bug reports, success reports,
  patches to Gabriele Giorgetti <g.giorgetti@gmail.com>

