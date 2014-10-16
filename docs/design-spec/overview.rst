.. Copyright (C) 2013 Curt Brune <curt@cumulusnetworks.com>
   Copyright (C) 2013 Pete Bratach <pete@cumulusnetworks.com>
   SPDX-License-Identifier:     GPL-2.0

********
Overview
********

The Open Network Install Environment (ONIE) is a small operating
system for bare metal network switches that provides an environment
for automated provisioning.

ONIE locates and executes a network operating system (NOS) vendor's
installation program.

An ONIE-enabled system consists of:

* An ONIE-capable hardware platform.
* An ONIE-enabled boot loader.
* An ONIE-capable Linux kernel.
* The ONIE discovery and execution application.
* An ONIE-capable operating system installer.

When an ONIE-enabled network switch boots for the first time, the boot
loader launches the kernel, which starts the ONIE discovery and
execution (ODE) application.

The ODE uses a number of methods (like local files, DHCP, IPv6
neighbors, mDNS/DNS-SD) to locate and download (via HTTP or TFTP) an
operating system installer.

Once the installer is found, the ODE executes the installer, which
then proceeds to provision the machine in an NOS-specific way.

Initial Boot
============

The first time the switch boots the following steps happen:

#. The boot loader launches the default OS, which is the ONIE kernel.
#. The ODE locates an NOS installer.
#. The ODE executes the NOS installer.
#. The NOS installer installs the operating system.
#. The NOS installer marks the boot environment to boot straight into the NOS.
#. The system reboots.

Subsequent Boots
================

On subsequent boots, the system boots straight into the installed NOS,
bypassing the ONIE kernel and ODE application. The start up sequence for 
subsequent boots is:

#. The boot loader launches the default OS, which is the NOS.
#. The NOS boots and executes.

.. _onie_fsm:

ONIE Finite State Machine
=========================

The following diagram illustrates the ONIE finite state machine.

.. figure:: onie-fsm.png
  :scale: 75
  :align: center
  :alt: ONIE Finite State Machine

Alertnate image formats: :download:`[PDF] <onie-fsm.pdf>` :download:`[SVG] <onie-fsm.svg>`

The states and transitions are thoroughly discussed in subsequent
sections.
