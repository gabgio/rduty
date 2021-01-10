
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

**Usage:** `rduty [HOST or INVENTORY] [COMMAND or SCRIPT] ...`

.. code-block:: sh

  $ rduty -H 192.168.0.10 -C "ls" 
  
.. code-block:: sh

  $ rduty -H 192.168.0.10,192.168.0.20,server.mydomain.local -C "uname -a" 

.. code-block:: sh

  $ rduty -I myinventory/servers.ini --script "/home/user/commands_list.txt" 

.. code-block:: sh

  $ rduty -I myinventory/servers.ini --script "/home/user/commands_list.txt" --dryrun


**Options:**

.. csv-table::
   :header: Option, Description
   :widths: 30, 70


   "``-H``, ``--script FILENAME``","Load jghjghjghj blah blhah"
   "``-I``, ``--inventory FILENAME``","inventory file"
   "``-S``, ``--script FILENAME``","Load jghjghjghj blah blhah"
   "``-C``, ``--command COMMAND``","command"
   "``-v``, ``--version``",output version information and exit.
   "``-h``, ``--help``",show this help and exit.

.. [[[end]]]


Command line
~~~~~~~~~~~~

**Usage:** `rduty [HOST or INVENTORY] [COMMAND or SCRIPT] ...`

.. code-block:: sh

$ ./rduty.py  -H 192.168.0.3 -C "uname" -p 22
Username: gabriele
Password: 
1. [192.168.0.3:22]
192.168.0.3 -> Connect
192.168.0.3 -> Executing command: uname
192.168.0.3 -> Getting output: 
-----------------------------------------------------------------------------------------------------------------------
Linux
-----------------------------------------------------------------------------------------------------------------------
.. [[[end]]]


Contact
-------

The latest version of rduty is available on GitHub_.
For questions, bug reports, suggestions, etc. please contact the author.

License
-------

This software is licensed under the `GNU GPL2`_.

© 2020 Gabriele Giorgetti.
