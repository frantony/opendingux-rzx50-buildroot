#############################################################
#
# Wolf4D SDL
#
#############################################################
WOLF4D_SDL_VERSION = 1.7
WOLF4D_SDL_SITE =
WOLF4D_SDL_SOURCE = Wolf4SDL-$(WOLF4D_SDL_VERSION)-src.tar.gz
WOLF4D_SDL_DEPENDENCIES = sdl sdl_mixer

# dirty hack
WOLF4D_SDL_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/wolf4d-sdl
WOLF4D_SDL_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/wolf4d-sdl

define WOLF4D_SDL_BUILD_CMDS
	$(MAKE) Q="" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" CXXFLAGS="-I $(STAGING_DIR)/usr/include/SDL -DDEFAULT_SCREEN_HEIGHT=272 -DDEFAULT_SCREEN_WIDTH=480 $(TARGET_CXXFLAGS)" CFLAGS="-I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS)" LDFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lSDL_mixer" -C "$(@D)"
endef

define WOLF4D_SDL_INSTALL_TARGET_CMDS
	$(RM) -rf $(WOLF4D_SDL_LOCAL_DIR)
	mkdir -p $(WOLF4D_SDL_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/wolf3d $(WOLF4D_SDL_LOCAL_DIR)/wolf4d-sdl.dge
	$(INSTALL) -D -m 0755 $(WOLF4D_SDL_PACKAGE_DIR)/wolf4d-sdl.png $(WOLF4D_SDL_LOCAL_DIR)
	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(WOLF4D_SDL_PACKAGE_DIR)/wolf4d-sdl.gmenu2x $(GMENU2X_GAMES_SECTION)/wolf4d-sdl
endef

$(eval $(call GENTARGETS,package/dingux,wolf4d-sdl))
