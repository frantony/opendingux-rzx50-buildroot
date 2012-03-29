#############################################################
#
#
#
#############################################################
PROFADELUXE_SITE =
PROFADELUXE_SITE_METHOD =
PROFADELUXE_VERSION = 1.0
PROFADELUXE_SOURCE = profadeluxe-$(PROFADELUXE_VERSION).tar.gz
PROFADELUXE_DEPENDENCIES = sdl sdl_gfx sdl_sound sdl_mixer sdl_image

# dirty hack
PROFADELUXE_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/profadeluxe
PROFADELUXE_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/profadeluxe

define PROFADELUXE_BUILD_CMDS
	$(MAKE) CPP="$(TARGET_CXX)" CXXFLAGS="-DSMALL_GAME -DLINUX -I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS)" LIBS="" LDFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lSDL_image -lSDL_mixer -lSDL_gfx" -C "$(@D)" -f Makefile.linux
endef

define PROFADELUXE_INSTALL_TARGET_CMDS
	$(RM) -rf $(PROFADELUXE_LOCAL_DIR)
	mkdir -p $(PROFADELUXE_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/profanation $(PROFADELUXE_LOCAL_DIR)/profadeluxe.dge
	# fixme
	cp -a $(@D)/Data.small $(PROFADELUXE_LOCAL_DIR)/Data
	$(INSTALL) -D -m 0644 $(@D)/Leeme.txt $(PROFADELUXE_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(@D)/LICENSE $(PROFADELUXE_LOCAL_DIR)

	$(INSTALL) -D -m 0644 $(PROFADELUXE_PACKAGE_DIR)/profadeluxe.png $(PROFADELUXE_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(PROFADELUXE_PACKAGE_DIR)/profadeluxe-wrapper.dge $(PROFADELUXE_LOCAL_DIR)

	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(PROFADELUXE_PACKAGE_DIR)/profadeluxe.gmenu2x $(GMENU2X_GAMES_SECTION)/profadeluxe
endef

$(eval $(call GENTARGETS,package/dingux,profadeluxe))
