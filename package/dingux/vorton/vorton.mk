#############################################################
#
#
#
#############################################################
VORTON_SITE =
VORTON_SITE_METHOD =
VORTON_VERSION = beta2
VORTON_SOURCE = vorton-$(VORTON_VERSION).tar.gz
VORTON_DEPENDENCIES = sdl sdl_image sdl_mixer

# dirty hack
VORTON_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/vorton
VORTON_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/vorton

define VORTON_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" CFLAGS="-DDATA_PREFIX=\"\\\"data/\\\"\" -DFILE_SEPARATOR=\"\\\"/\\\"\" -DARGS -I $(@D)/src -I $(@D)/src/SDL_flic -I $(@D)/src/SFont -I $(STAGING_DIR)/usr/include/SDL -I $(@D)/src/filmat -I $(@D)/src/phase2 -Isrc/ML_Lib $(TARGET_CFLAGS)" LDFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lSDL_image -lSDL_mixer" -C $(@D) -f Makefile.linux
endef

define VORTON_INSTALL_TARGET_CMDS
	$(RM) -rf $(VORTON_LOCAL_DIR)
	mkdir -p $(VORTON_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/vorton $(VORTON_LOCAL_DIR)/vorton.dge
	$(INSTALL) -D -m 0644 $(VORTON_PACKAGE_DIR)/vorton.png $(VORTON_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(VORTON_PACKAGE_DIR)/vorton-wrapper.dge $(VORTON_LOCAL_DIR)

	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(VORTON_PACKAGE_DIR)/vorton.gmenu2x $(GMENU2X_GAMES_SECTION)/vorton

	# FIXME
	cp -a $(@D)/data $(VORTON_LOCAL_DIR)
endef

$(eval $(call GENTARGETS,package/dingux,vorton))
