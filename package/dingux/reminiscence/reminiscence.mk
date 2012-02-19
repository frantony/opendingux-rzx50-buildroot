#############################################################
#
# Dingux Write
#
#############################################################
REMINISCENCE_VERSION = 0.2.1
REMINISCENCE_SITE = http://cyxdown.free.fr/reminiscence
REMINISCENCE_SOURCE = REminiscence-$(REMINISCENCE_VERSION).tar.bz2
REMINISCENCE_DEPENDENCIES = sdl zlib

# dirty hack
REMINISCENCE_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/reminiscence
REMINISCENCE_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/reminiscence

define REMINISCENCE_BUILD_CMDS
	$(MAKE) CXX="$(TARGET_CXX)" SDL_CFLAGS="" SDL_LIBS="" CXXFLAGS="-DBYPASS_PROTECTION -DUSE_ZLIB -MMD -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS)" LIBS="-L$(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lz" -C "$(@D)"
endef

define REMINISCENCE_INSTALL_TARGET_CMDS
	$(RM) -rf $(REMINISCENCE_LOCAL_DIR)
	mkdir -p $(REMINISCENCE_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/rs $(REMINISCENCE_LOCAL_DIR)/reminiscence.dge
	$(INSTALL) -D -m 0755 $(REMINISCENCE_PACKAGE_DIR)/reminiscence-wrapper.dge $(REMINISCENCE_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(REMINISCENCE_PACKAGE_DIR)/reminiscence.png $(REMINISCENCE_LOCAL_DIR)

	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(REMINISCENCE_PACKAGE_DIR)/reminiscence.gmenu2x $(GMENU2X_GAMES_SECTION)/reminiscence
endef

$(eval $(call GENTARGETS,package/dingux,reminiscence))
