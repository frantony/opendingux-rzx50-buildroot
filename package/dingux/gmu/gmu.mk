#############################################################
#
#
#
#############################################################
GMU_SITE =
GMU_SITE_METHOD =
GMU_VERSION = 0.8.0BETA1
GMU_SOURCE = gmu-$(GMU_VERSION).tar.gz
GMU_DEPENDENCIES = sdl sdl_gfx sdl_ttf sdl_image flac

# dirty hack
GMU_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/gmu
GMU_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/gmu

define GMU_BUILD_CMDS
	# FIXME: musepack disabled, mpg123 disabled
	$(MAKE) TARGET=dingux CC="$(TARGET_CC)" CFLAGS="-DFILE_HW_H=\"\\\"hw_dingux.h\\\"\" -I $(STAGING_DIR)/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT $(TARGET_CFLAGS)" SDL_LIB="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lpthread -lpng -ljpeg" -C "$(@D)" DECODERS_TO_BUILD="decoders/vorbis.so decoders/flac.so decoders/wavpack.so decoders/mikmod.so"
endef

define GMU_INSTALL_TARGET_CMDS
	$(RM) -rf $(GMU_LOCAL_DIR)
	mkdir -p $(GMU_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/gmu $(GMU_LOCAL_DIR)/gmu.dge
	$(INSTALL) -D -m 0644 $(@D)/gmu.png $(GMU_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(GMU_PACKAGE_DIR)/gmu-wrapper.dge $(GMU_LOCAL_DIR)

	mkdir -p $(GMENU2X_APPS_SECTION)
	$(INSTALL) -D -m 0644 $(GMU_PACKAGE_DIR)/gmu.gmenu2x $(GMENU2X_APPS_SECTION)/gmu
endef

$(eval $(call GENTARGETS,package/dingux,gmu))
