#-------------------------------------------------------------------------------
#
#  Copyright (C) 2013-2014 Curt Brune <curt@cumulusnetworks.com>
#
#  SPDX-License-Identifier:     GPL-2.0
#
#-------------------------------------------------------------------------------
#
# This is a makefile fragment that defines the build of a particular
# toolchain using crosstool-NG.
#

# Note: To help debug problems with building a toolchain enable these
# options in $(XTOOLS_CONFIG)
#
#   CT_DEBUG_CT=y
#   CT_DEBUG_CT_SAVE_STEPS=y
#   CT_DEBUG_CT_SAVE_STEPS_GZIP=y
#

XTOOLS_CONFIG		= conf/crosstool/uClibc-$(UCLIBC_VERSION)/crosstool.$(ONIE_ARCH).config
XTOOLS_ROOT		= $(BUILDDIR)/x-tools
XTOOLS_VERSION		= $(ONIE_ARCH)-linux-$(LINUX_RELEASE)-uClibc-$(UCLIBC_VERSION)
XTOOLS_DIR		= $(XTOOLS_ROOT)/$(XTOOLS_VERSION)
XTOOLS_BUILD_DIR	= $(XTOOLS_DIR)/build
XTOOLS_INSTALL_DIR	= $(XTOOLS_DIR)/install
XTOOLS_DEBUG_ROOT	= $(XTOOLS_INSTALL_DIR)/$(TARGET)/$(TARGET)/debug-root
XTOOLS_STAMP_DIR	= $(XTOOLS_DIR)/stamp
XTOOLS_PREP_STAMP	= $(XTOOLS_STAMP_DIR)/xtools-prep
XTOOLS_BUILD_STAMP	= $(XTOOLS_STAMP_DIR)/xtools-build
XTOOLS_STAMP		= $(XTOOLS_PREP_STAMP) \
			  $(XTOOLS_BUILD_STAMP) 

export XTOOLS_INSTALL_DIR

PHONY += xtools xtools-prep xtools-config xtools-build xtools-clean xtools-distclean

xtools: $(XTOOLS_STAMP)

xtools-prep: $(XTOOLS_PREP_STAMP)
$(XTOOLS_PREP_STAMP): | $(KERNEL_DOWNLOAD_STAMP) $(UCLIBC_DOWNLOAD_STAMP)
	$(Q) rm -f $@ && eval $(PROFILE_STAMP)
	$(Q) echo "==== Preparing xtools for $(XTOOLS_VERSION) ===="
	$(Q) mkdir -p $(XTOOLS_BUILD_DIR) $(XTOOLS_INSTALL_DIR) $(XTOOLS_STAMP_DIR)
	$(Q) touch $@

$(XTOOLS_BUILD_DIR)/.config: $(XTOOLS_CONFIG) $(XTOOLS_PREP_STAMP)
	$(Q) echo "==== Copying $(XTOOLS_CONFIG) to $@ ===="
	$(Q) cp -v $< $@

xtools-config: $(XTOOLS_BUILD_DIR)/.config $(CROSSTOOL_NG_BUILD_STAMP)
	$(Q) cd $(XTOOLS_BUILD_DIR) && $(CROSSTOOL_NG_DIR)/ct-ng menuconfig

xtools-download: $(XTOOLS_BUILD_DIR)/.config $(CROSSTOOL_NG_BUILD_STAMP)
	$(Q) cd $(XTOOLS_BUILD_DIR) && $(CROSSTOOL_NG_DIR)/ct-ng build STOP=libc_check_config

xtools-build: $(XTOOLS_BUILD_STAMP)
$(XTOOLS_BUILD_STAMP): $(XTOOLS_BUILD_DIR)/.config $(CROSSTOOL_NG_BUILD_STAMP)
	$(Q) rm -f $@ && eval $(PROFILE_STAMP)
	$(Q) echo "====  Building xtools for $(XTOOLS_VERSION) ===="
	$(Q) cd $(XTOOLS_BUILD_DIR) && \
		$(CROSSTOOL_NG_DIR)/ct-ng build || (rm $(XTOOLS_BUILD_DIR)/.config.2 && false)
	$(Q) touch $@

xtools-clean:
	$(Q) ( [ -d $(XTOOLS_DIR) ] && chmod +w -R $(XTOOLS_DIR) ) || true
	$(Q) rm -rf $(XTOOLS_DIR) 
	$(Q) echo "=== Finished making $@ ==="

DIST_CLEAN += xtools-distclean
xtools-distclean:
	$(Q) ( [ -d $(XTOOLS_ROOT) ] && chmod +w -R $(XTOOLS_ROOT) ) || true
	$(Q) rm -rf $(XTOOLS_ROOT)
	$(Q) echo "=== Finished making $@ ==="

#-------------------------------------------------------------------------------
#
# Local Variables:
# mode: makefile-gmake
# End:
