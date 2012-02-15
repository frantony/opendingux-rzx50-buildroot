#############################################################
#
# Dingux Commander
#
#############################################################
HOTA_VERSION = 1.2.2
HOTA_SITE =
HOTA_SOURCE = heartalien-$(HOTA_VERSION).tar.gz
HOTA_DEPENDENCIES = sdl sdl_gfx sdl_ttf sdl_image sdl_mixer

# dirty hack
HOTA_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/hota
HOTA_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/hota

define HOTA_BUILD_CMDS
	$(MAKE) SDL_CFLAGS="" SDL_LIBS="" CC="$(TARGET_CC)" CFLAGS="-I$(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS) -DDINGUX" LIBS="-L$(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lSDL_image -lSDL_ttf -lSDLmain -lSDL_mixer" -C "$(@D)/src" -f Makefile.dingux
endef

define HOTA_INSTALL_TARGET_CMDS
	$(RM) -rf $(HOTA_LOCAL_DIR)
	mkdir -p $(HOTA_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/src/alien.dge $(HOTA_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(HOTA_PACKAGE_DIR)/hota.png $(HOTA_LOCAL_DIR)
endef

$(eval $(call GENTARGETS,package/dingux,hota))
