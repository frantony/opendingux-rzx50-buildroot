#############################################################
#
#
#
#############################################################
COLOR_LINES_SDL_SITE = http://nzeemin-opensrc.googlecode.com/svn/trunk/rzx50/ColorLinesSdl
COLOR_LINES_SDL_SITE_METHOD = svn
COLOR_LINES_SDL_VERSION = 55
#COLOR_LINES_SDL_SOURCE = color-lines-sdl-$(COLOR_LINES_SDL_VERSION)
COLOR_LINES_SDL_DEPENDENCIES = sdl

# dirty hack
COLOR_LINES_SDL_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/color-lines-sdl
COLOR_LINES_SDL_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/color-lines-sdl

define COLOR_LINES_SDL_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" CC_OPTS="-I $(STAGING_DIR)/usr/include/SDL $(TARGET_CXXFLAGS)" LDFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS)" -C "$(@D)/src"
endef

define COLOR_LINES_SDL_INSTALL_TARGET_CMDS
	$(RM) -rf $(COLOR_LINES_SDL_LOCAL_DIR)
	mkdir -p $(COLOR_LINES_SDL_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/src/ColorLinesSdl.dge $(COLOR_LINES_SDL_LOCAL_DIR)/color-lines-sdl.dge
	$(INSTALL) -D -m 0644 $(COLOR_LINES_SDL_PACKAGE_DIR)/color-lines-sdl.png $(COLOR_LINES_SDL_LOCAL_DIR)
	# fixme
	cp -a $(@D)/src/ColorLinesData $(COLOR_LINES_SDL_LOCAL_DIR)

	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(COLOR_LINES_SDL_PACKAGE_DIR)/color-lines-sdl.gmenu2x $(GMENU2X_GAMES_SECTION)/color-lines-sdl
endef

$(eval $(call GENTARGETS,package/dingux,color-lines-sdl))
