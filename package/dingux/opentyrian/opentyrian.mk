#############################################################
#
#
#
#############################################################
OPENTYRIAN_SITE =
OPENTYRIAN_SITE_METHOD =
OPENTYRIAN_VERSION = hg1000
OPENTYRIAN_SOURCE = opentyrian-$(OPENTYRIAN_VERSION).tar.gz
OPENTYRIAN_DEPENDENCIES = sdl sdl_net

# dirty hack
OPENTYRIAN_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/opentyrian
OPENTYRIAN_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/opentyrian

define OPENTYRIAN_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" ALL_CFLAGS="-DTARGET_DINGUX -std=c99 -I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS)" ALL_LDFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS)" -C $(@D)
endef

define OPENTYRIAN_INSTALL_TARGET_CMDS
	$(RM) -rf $(OPENTYRIAN_LOCAL_DIR)
	mkdir -p $(OPENTYRIAN_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/opentyrian $(OPENTYRIAN_LOCAL_DIR)/opentyrian.dge
	$(INSTALL) -D -m 0644 $(OPENTYRIAN_PACKAGE_DIR)/opentyrian.png $(OPENTYRIAN_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(OPENTYRIAN_PACKAGE_DIR)/opentyrian-wrapper.dge $(OPENTYRIAN_LOCAL_DIR)

	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(OPENTYRIAN_PACKAGE_DIR)/opentyrian.gmenu2x $(GMENU2X_GAMES_SECTION)/opentyrian
endef

$(eval $(call GENTARGETS,package/dingux,opentyrian))
