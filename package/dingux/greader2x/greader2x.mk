#############################################################
#
#
#
#############################################################
GREADER2X_SITE =
GREADER2X_SITE_METHOD =
GREADER2X_VERSION =
GREADER2X_SOURCE = greader2x_Dingux.tar.gz
GREADER2X_DEPENDENCIES = sdl sdl_gfx sdl_ttf sdl_image

# dirty hack
GREADER2X_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/greader2x
GREADER2X_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/greader2x

define GREADER2X_BUILD_CMDS
	$(MAKE) STRIP="$(TARGET_STRIP)" CXX="$(TARGET_CXX)" CXXFLAGS="-W -Wall -I $(STAGING_DIR)/usr/include/SDL -I $(STAGING_DIR)/usr/include $(TARGET_CXXFLAGS)" LIBS="" LDFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lSDL_image -lSDL_ttf -lSDLmain -lSDL_mixer" -C "$(@D)" -f makefile.dingux
endef

define GREADER2X_INSTALL_TARGET_CMDS
	$(RM) -rf $(GREADER2X_LOCAL_DIR)
	mkdir -p $(GREADER2X_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/Greader2x.dge $(GREADER2X_LOCAL_DIR)/greader2x.dge
	$(INSTALL) -D -m 0644 $(GREADER2X_PACKAGE_DIR)/greader2x.png $(GREADER2X_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(GREADER2X_PACKAGE_DIR)/Vera.ttf $(GREADER2X_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(GREADER2X_PACKAGE_DIR)/arial.ttf $(GREADER2X_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(GREADER2X_PACKAGE_DIR)/curls.ttf $(GREADER2X_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(GREADER2X_PACKAGE_DIR)/greader2x.cfg $(GREADER2X_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(@D)/Language\ files/english.lng $(GREADER2X_LOCAL_DIR)

	mkdir -p $(GMENU2X_APPS_SECTION)
	$(INSTALL) -D -m 0644 $(GREADER2X_PACKAGE_DIR)/greader2x.gmenu2x $(GMENU2X_APPS_SECTION)/greader2x
endef

$(eval $(call GENTARGETS,package/dingux,greader2x))
