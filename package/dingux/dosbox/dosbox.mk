#############################################################
#
# DOSBOX Emulator
#
#############################################################
DOSBOX_SITE = http://ftp.debian.org/debian/pool/main/d/dosbox
DOSBOX_SITE_METHOD =
DOSBOX_VERSION = 0.74
DOSBOX_SOURCE = dosbox_$(DOSBOX_VERSION).orig.tar.gz
DOSBOX_DEPENDENCIES = sdl

# dirty hack
DOSBOX_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/dosbox
DOSBOX_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/dosbox

DOSBOX_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr

DOSBOX_CONF_ENV += CFLAGS="-DC_TARGETCPU=MIPSEL"

define DOSBOX_INSTALL_TARGET_CMDS
	$(RM) -rf $(DOSBOX_LOCAL_DIR)
	mkdir -p $(DOSBOX_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/src/dosbox $(DOSBOX_LOCAL_DIR)/dosbox.dge
	$(INSTALL) -D -m 0644 $(DOSBOX_PACKAGE_DIR)/dosbox.png $(DOSBOX_LOCAL_DIR)
	#$(INSTALL) -D -m 0755 $(DOSBOX_PACKAGE_DIR)/dosbox-wrapper.dge $(DOSBOX_LOCAL_DIR)

	#mkdir -p $(GMENU2X_EMULATORS_SECTION)
	#$(INSTALL) -D -m 0644 $(DOSBOX_PACKAGE_DIR)/dosbox.gmenu2x $(GMENU2X_EMULATORS_SECTION)/dosbox
endef

$(eval $(call AUTOTARGETS,package/dingux,dosbox))
