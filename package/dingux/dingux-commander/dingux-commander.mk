#############################################################
#
# Dingux Commander
#
#############################################################
DINGUX_COMMANDER_VERSION = 2.1-rzx50-20120216
DINGUX_COMMANDER_SITE = http://prizma.bmstu.ru/rzx50-storage/src
DINGUX_COMMANDER_SOURCE = dingux-commander-$(DINGUX_COMMANDER_VERSION).tar.gz
DINGUX_COMMANDER_DEPENDENCIES = sdl sdl_ttf sdl_image

# dirty hack
DINGUX_COMMANDER_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/dingux-commander
DINGUX_COMMANDER_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/dingux-commander

define DINGUX_COMMANDER_BUILD_CMDS
	$(MAKE) TARGET=dingux-commander CC="$(TARGET_CXX)" STRIP="$(TARGET_STRIP)" CFLAGS="-DDC_RES_PREFIX=\"\\\"res/\\\"\" -DPLATFORM_DINGOO -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" LFLAGS="-L$(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lSDL_ttf -lSDL_image" -C "$(@D)" -f makefile.dingoo
endef

define DINGUX_COMMANDER_INSTALL_TARGET_CMDS
	$(RM) -rf $(DINGUX_COMMANDER_LOCAL_DIR)
	mkdir -p $(DINGUX_COMMANDER_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/dingux-commander $(DINGUX_COMMANDER_LOCAL_DIR)/dingux-commander.dge
	$(INSTALL) -D -m 0644 $(DINGUX_COMMANDER_PACKAGE_DIR)/dingux-commander.png $(DINGUX_COMMANDER_LOCAL_DIR)
	cp -a $(@D)/res $(DINGUX_COMMANDER_LOCAL_DIR)

	mkdir -p $(GMENU2X_APPS_SECTION)
	$(INSTALL) -D -m 0644 $(DINGUX_COMMANDER_PACKAGE_DIR)/dingux-commander.gmenu2x $(GMENU2X_APPS_SECTION)/dingux-commander
endef

$(eval $(call GENTARGETS,package/dingux,dingux-commander))
