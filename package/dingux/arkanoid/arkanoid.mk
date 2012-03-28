#############################################################
#
#
#
#############################################################
ARKANOID_SITE =
ARKANOID_SITE_METHOD =
ARKANOID_VERSION = 1.1
ARKANOID_SOURCE = arkanoid-$(ARKANOID_VERSION).tar.gz
ARKANOID_DEPENDENCIES = sdl sdl_sound sdl_mixer sdl_image

# dirty hack
ARKANOID_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/arkanoid
ARKANOID_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/arkanoid

define ARKANOID_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" CFLAGS="-D_SDL -DLINUX -I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS)" LIBS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lSDL_image -lSDL_mixer" -C "$(@D)/src"
endef

define ARKANOID_INSTALL_TARGET_CMDS
	$(RM) -rf $(ARKANOID_LOCAL_DIR)
	mkdir -p $(ARKANOID_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/src/Arkanoid.dge $(ARKANOID_LOCAL_DIR)/arkanoid.dge
	# fixme
	cp -a $(@D)/gfx $(ARKANOID_LOCAL_DIR)
	cp -a $(@D)/snd $(ARKANOID_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(ARKANOID_PACKAGE_DIR)/arkanoid.png $(ARKANOID_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(ARKANOID_PACKAGE_DIR)/arkanoid-wrapper.dge $(ARKANOID_LOCAL_DIR)

	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(ARKANOID_PACKAGE_DIR)/arkanoid.gmenu2x $(GMENU2X_GAMES_SECTION)/arkanoid
endef

$(eval $(call GENTARGETS,package/dingux,arkanoid))
