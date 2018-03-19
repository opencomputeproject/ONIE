# Alpha Networks SNC60D0-488F

ONIE_ARCH ?= x86_64
SWITCH_ASIC_VENDOR = bcm
FIRMWARE_TYPE = auto

VENDOR_REV ?= 0

# Translate hardware revision to ONIE hardware revision
ifeq ($(VENDOR_REV),0)
  MACHINE_REV = 0
else
  $(warning Unknown VENDOR_REV '$(VENDOR_REV)' for MACHINE '$(MACHINE)')
  $(error Unknown VENDOR_REV)
endif

# The VENDOR_VERSION string is appended to the overal ONIE version
# string.  HW vendors can use this to appended their own versioning
# information to the base ONIE version string.
VENDOR_VERSION = .0.1

# Vendor ID -- IANA Private Enterprise Number:
# http://www.iana.org/assignments/enterprise-numbers
# Alpha Networks Inc.
VENDOR_ID = 31874

# Enable the i2ctools and the onie-syseeprom command for this platform
I2CTOOLS_ENABLE = yes

# Console parameters
CONSOLE_DEV = 0

# Enable UEFI support
UEFI_ENABLE = yes

# Set Linux kernel version
LINUX_VERSION		= 4.9
LINUX_MINOR_VERSION	= 80


#-------------------------------------------------------------------------------
#
# Local Variables:
# mode: makefile-gmake
# End:

