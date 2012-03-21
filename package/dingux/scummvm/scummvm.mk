#############################################################
#
# Script Creation Utility for Maniac Mansion Virtual Machine
#  a cross-platform interpreter for several point-and-click adventure engines
#
#############################################################
SCUMMVM_VERSION = 1.4.1
SCUMMVM_SOURCE = scummvm_$(SCUMMVM_VERSION).orig.tar.bz2
SCUMMVM_SITE = http://ftp.debian.org/debian/pool/main/s/scummvm/
SCUMMVM_DEPENDENCIES = sdl

# dirty hack
SCUMMVM_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/scummvm
SCUMMVM_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/scummvm
SCUMMVM_CONF_OPT += --with-sdl-prefix=$(STAGING_DIR)/usr --host=dingux
SCUMMVM_CONF_ENV += AR=$(TARGET_AR)

define SCUMMVM_INSTALL_TARGET_CMDS
	$(RM) -rf $(SCUMMVM_LOCAL_DIR)
	mkdir -p $(SCUMMVM_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/scummvm $(SCUMMVM_LOCAL_DIR)/scummvm.dge
	$(INSTALL) -D -m 0755 $(SCUMMVM_PACKAGE_DIR)/scummvm-wrapper.dge $(SCUMMVM_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(SCUMMVM_PACKAGE_DIR)/scummvm.png $(SCUMMVM_LOCAL_DIR)

	mkdir -p $(GMENU2X_EMULATORS_SECTION)
	$(INSTALL) -D -m 0644 $(SCUMMVM_PACKAGE_DIR)/scummvm.gmenu2x $(GMENU2X_EMULATORS_SECTION)/scummvm
endef

$(eval $(call AUTOTARGETS,package/dingux,scummvm))
