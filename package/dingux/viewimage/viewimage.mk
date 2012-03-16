#############################################################
#
#
#
#############################################################
VIEWIMAGE_SITE =
VIEWIMAGE_SITE_METHOD =
VIEWIMAGE_VERSION = 1.2.1
VIEWIMAGE_SOURCE = viewimage-$(VIEWIMAGE_VERSION).tar.gz
VIEWIMAGE_DEPENDENCIES = sdl

# dirty hack
VIEWIMAGE_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/viewimage
VIEWIMAGE_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/viewimage

define VIEWIMAGE_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" CFLAGS="-Os -I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS)" LDFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lSDL_gfx -lSDL_image -lSDL_ttf" -C "$(@D)"
endef

define VIEWIMAGE_INSTALL_TARGET_CMDS
	$(RM) -rf $(VIEWIMAGE_LOCAL_DIR)
	mkdir -p $(VIEWIMAGE_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/viewimage.dge $(VIEWIMAGE_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(VIEWIMAGE_PACKAGE_DIR)/viewimage.png $(VIEWIMAGE_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(VIEWIMAGE_PACKAGE_DIR)/viewimage-wrapper.dge $(VIEWIMAGE_LOCAL_DIR)

	mkdir -p $(GMENU2X_APPS_SECTION)
	$(INSTALL) -D -m 0644 $(VIEWIMAGE_PACKAGE_DIR)/viewimage.gmenu2x $(GMENU2X_APPS_SECTION)/viewimage
endef

$(eval $(call GENTARGETS,package/dingux,viewimage))
