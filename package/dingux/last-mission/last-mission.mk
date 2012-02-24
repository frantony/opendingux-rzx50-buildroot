#############################################################
#
# The Last Mission
#
#############################################################
LAST_MISSION_SITE =
LAST_MISSION_SITE_METHOD =
LAST_MISSION_VERSION = 0.6
LAST_MISSION_SOURCE = last-mission-$(LAST_MISSION_VERSION).tar.gz
LAST_MISSION_DEPENDENCIES = sdl

# dirty hack
LAST_MISSION_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/last-mission
LAST_MISSION_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/last-mission

define LAST_MISSION_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" CFLAGS="-D__cdecl=\"\" -Os -D__DINGUX__ -std=c99 -fms-extensions -I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS)" LFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lm -lSDL" -C "$(@D)" -f mingw_dingoo_sdl.mak
endef

define LAST_MISSION_INSTALL_TARGET_CMDS
	$(RM) -rf $(LAST_MISSION_LOCAL_DIR)
	mkdir -p $(LAST_MISSION_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/mission_dingoosdl.exe $(LAST_MISSION_LOCAL_DIR)/last-mission.dge
	$(INSTALL) -D -m 0644 $(LAST_MISSION_PACKAGE_DIR)/last-mission.png $(LAST_MISSION_LOCAL_DIR)

	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(LAST_MISSION_PACKAGE_DIR)/last-mission.gmenu2x $(GMENU2X_GAMES_SECTION)/last-mission
endef

$(eval $(call GENTARGETS,package/dingux,last-mission))
