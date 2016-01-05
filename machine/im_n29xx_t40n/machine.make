# Interface Masters Niagra 29XX Series
# CPU Module: Congatec conga-BAF/T40N
# CPU: AMD G-Series T40N

ONIE_ARCH ?= x86_64

ARCHDIR = $(MACHINEDIR)/arch

VENDOR_REV ?= ONIE

# Translate hardware revision to ONIE hardware revision
ifeq ($(VENDOR_REV),ONIE)
  MACHINE_REV = 0
else
  $(warning Unknown VENDOR_REV '$(VENDOR_REV)' for MACHINE '$(MACHINE)')
  $(error Unknown VENDOR_REV)
endif

# Vendor ID -- IANA Private Enterprise Number:
# http://www.iana.org/assignments/enterprise-numbers
# Interface Masters IANA number
VENDOR_ID = 30324

# Skip the i2ctools and the onie-syseeprom command for this platform
I2CTOOLS_ENABLE = no

# Default to msdos disk label for this platform
PARTITION_TYPE = msdos

# Set Linux kernel version
LINUX_VERSION		= 3.2
LINUX_MINOR_VERSION	= 69

# Specify uClibc version
UCLIBC_VERSION = 0.9.32.1

#-------------------------------------------------------------------------------
#
# Local Variables:
# mode: makefile-gmake
# End:
