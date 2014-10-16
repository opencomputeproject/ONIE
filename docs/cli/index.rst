.. Copyright (C) 2014 Curt Brune <curt@cumulusnetworks.com>
   SPDX-License-Identifier:     GPL-2.0

**********************
Command Line Reference
**********************

This guide documents the ONIE command line interface.

Except where noted all commands are available on all CPU
architectures.

.. _cli_onie_discovery_start:

``onie-discovery-start``
========================

SYNOPSIS
--------
``onie-discovery-start``

DESCRIPTION
-----------

If the ONIE installer discovery process is not currently running this
command will enable the discovery process.

See :ref:`installer_discovery` for more about the installer discovery
process.

SEE ALSO
--------

See :ref:`cli_onie_discovery_stop`.

.. _cli_onie_discovery_stop:

``onie-discovery-stop``
========================

SYNOPSIS
--------
``onie-discovery-stop``

DESCRIPTION
-----------

If the ONIE installer discovery process is currently running this
command will disable the discovery process.

See :ref:`installer_discovery` for more about the installer discovery
process.

SEE ALSO
--------

See :ref:`cli_onie_discovery_start`.

.. _cli_onie_nos_install:

``onie-nos-install``
========================

SYNOPSIS
--------
``onie-nos-install <image URL>``

DESCRIPTION
-----------

Download and execute an ONIE compatible network OS installer.
Supported URL types:

- http
- ftp
- tftp
- local file

If the ONIE installer discovery process is currently running this
command will also disable the discovery process.

See :ref:`installer_discovery` for more about the installer discovery
process.

EXAMPLES
--------

Here are samples of the accepted URL types::

  ONIE# onie-nos-install http://local-http-server/NOS-installer

  ONIE# onie-nos-install ftp://local-ftp-server/NOS-installer

  ONIE# onie-nos-install tftp://local-tftp-server/NOS-installer

  ONIE# onie-nos-install /path/to/local/file/NOS-installer


SEE ALSO
--------

See :ref:`cli_onie_self_update`.

.. _cli_onie_self_update:

``onie-self-update``
========================

SYNOPSIS
--------
``onie-self-update [-evh] <URL>``

DESCRIPTION
-----------

Download and execute an ONIE self-update installer.  An ONIE
self-update image will upgrade the ONIE software.  Supported URL
types:

- http
- ftp
- tftp
- local file

If the ONIE installer discovery process is currently running this
command will also disable the discovery process.

COMMAND LINE OPTIONS
--------------------

.. csv-table::
  :header: "Option", "Description"
  :widths: 1, 3
  :delim: |

  -h | Help.  Print a help message.
  -v | Be verbose.  Print what is happening.
  -e | x86 CPU architecture only. Embed ONIE in the hard disk. *Warning* -- This operation is destructive to the data on the hard disk.  This operation will reformat the hard disk and install ONIE.

On x86 systems use the ``-e`` flag to "embed" ONIE in the hard disk,
which will remove any existing GRUB configuration and OS.  If you only
want to update the ONIE kernel and initramfs, without disturbing the
installed NOS, do not use the ``-e`` option.

EXAMPLES
--------

Here are samples of the accepted URL types::

  ONIE# onie-self-update http://local-http-server/onie-updater

  ONIE# onie-self-update -e http://local-http-server/onie-updater

  ONIE# onie-self-update ftp://local-ftp-server/onie-updater

  ONIE# onie-self-update tftp://local-tftp-server/onie-updater

  ONIE# onie-self-update -e /path/to/local/file/onie-updater


SEE ALSO
--------

See :ref:`cli_onie_nos_install`.

.. _cli_onie_support:

``onie-support``
================

SYNOPSIS
--------
``onie-support <output_directory>``

DESCRIPTION
-----------

Create a tarball of *interesting* system information.  This could be
used by an installer to gather system info, saving it to document the
install.

EXAMPLES
--------

Here are examples of how to use this command::

  ONIE# mkdir /tmp/test
  ONIE# onie-support /tmp/test
  Success: Support tarball created: /tmp/test/onie-support.tar.bz2
  ONIE# tar tf /tmp/test/onie-support.tar.bz2

Examine the contents of the support tarball::

  ONIE:/ # tar tf /tmp/test/onie-support.tar.bz2 
  onie-support/
  onie-support/runtime-process.txt
  onie-support/runtime-set-env.txt
  onie-support/runtime-export-env.txt
  onie-support/kernel_cmdline.txt
  onie-support/log/
  onie-support/log/messages
  onie-support/log/onie.log

Use scp to copy the tarball to a remote host::

  ONIE:/ # scp /tmp/test/onie-support.tar.bz2 tester@monster-04:/tmp
   
  tester@monster-04's password: 
  onie-support.tar.bz2                          100% 1353     1.3KB/s   00:00    

.. _cli_onie_sysinfo:

``onie-sysinfo``
================

SYNOPSIS
--------
``onie-sysinfo [-sevimrpcfdat]``

DESCRIPTION
-----------

Display ONIE system information, including CPU architecture, ONIE
machine name, machine serial number, ONIE software version, eth0 MAC
address, etc.

COMMAND LINE OPTIONS
--------------------

.. csv-table::
  :header: "Option", "Description"
  :widths: 1, 3
  :delim: |

  -a | Dump all information
  -h | Help.  Print a help message.
  -s | Serial Number
  -e | Management Ethernet MAC address
  -v | ONIE version string
  -i | ONIE vendor ID.  Print the ONIE vendor's IANA enterprise number.
  -m | ONIE machine string
  -r | ONIE machine revision string
  -p | ONIE platform string.  This is the default.
  -c | ONIE CPU architecture
  -f | ONIE configuration version
  -d | ONIE build date
  -t | ONIE partition type

EXAMPLES
--------

Display the ONIE build date::

  ONIE:/ # onie-sysinfo -d
  2014-10-08T13:50-0700

Display the serial number::

  ONIE:/ # onie-sysinfo -s
  fake-serial-0123456789

Display all information::

  ONIE:/ # onie-sysinfo -a
  fake-serial-0123456789 00:04:9F:02:80:A4 2014.08-dirty 33118 fsl_p2020rdbpca 0 powerpc-fsl_p2020rdbpca-r0 powerpc 0 unknown 2014-10-08T13:50-0700


Deprecated Commands
===================

The command names listed here are deprecated.  They still exist, but
are simply symbolic links to the corresponding command listed above.

.. csv-table:: Deprecated CLI Command Names
  :header: "Old Command Name", "New Command Name"
  :widths: 1, 3
  :delim: |

  install_url | :ref:`cli_onie_nos_install`
  update_url | :ref:`cli_onie_self_update`
  support | :ref:`cli_onie_support`

x86 Architecture Specific Commands
==================================

The commands listed here only apply to x86 CPU machines.

.. _cli_onie_boot_mode:

``onie-boot-mode``
------------------

SYNOPSIS
````````
``onie-boot-mode [-hvql] [-o install|rescue|uninstall|update|embed|none]``

DESCRIPTION
```````````

Get or set the default GRUB boot entry.  The default is to show the
current default entry.

COMMAND LINE OPTIONS
````````````````````

.. csv-table::
  :header: "Option", "Description"
  :widths: 1, 3
  :delim: |

  -h | Help.  Print a help message.
  -v | Be verbose.  Print what is happening.
  -q | Be quiet.  No printing, except for errors.
  -l | List the current default entry.  This is the default.
  -o | Set the default GRUB boot entry to a particular "ONIE mode".

For the ``-o`` option the available ONIE mode settings are:

- install   -- ONIE OS installer mode
- rescue    -- ONIE rescue mode
- uninstall -- ONIE OS uninstall mode
- update    -- ONIE self update mode
- embed	    -- ONIE self update mode and embed ONIE
- none	    -- Use system default boot mode
