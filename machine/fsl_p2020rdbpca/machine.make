# Makefile fragment for FSL P2020RDB

#  Copyright (C) 2013 Curt Brune <curt@cumulusnetworks.com>
#
#  SPDX-License-Identifier:     GPL-2.0

ONIE_ARCH ?= powerpc-softfloat

VENDOR_REV ?= ONIE

# Translate hardware revision to ONIE hardware revision
ifeq ($(VENDOR_REV),ONIE)
  MACHINE_REV = 0
else
  $(warning Unknown VENDOR_REV '$(VENDOR_REV)' for MACHINE '$(MACHINE)')
  $(error Unknown VENDOR_REV)
endif

UBOOT_MACHINE = P2020RDB-PC_ONIE_$(MACHINE_REV)
KERNEL_DTB = p2020rdb.dtb

# Vendor ID -- IANA Private Enterprise Number:
# http://www.iana.org/assignments/enterprise-numbers
VENDOR_ID = 33118

# Set the desired kernel version.
LINUX_VERSION		= 4.1
LINUX_MINOR_VERSION	= 2

# Set the desired uClibc version
UCLIBC_VERSION = 0.9.33.2

# Include kexec-tools
KEXEC_ENABLE = yes

#-------------------------------------------------------------------------------
#
# Local Variables:
# mode: makefile-gmake
# End:
