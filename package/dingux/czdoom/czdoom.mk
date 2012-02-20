#############################################################
#
# CZDoom
#
#############################################################
CZDOOM_VERSION =
CZDOOM_SITE =
CZDOOM_SOURCE = czdoom-src.tar.gz
CZDOOM_DEPENDENCIES = sdl sdl_mixer libpng

# dirty hack
CZDOOM_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/czdoom
CZDOOM_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/czdoom

define CZDOOM_BUILD_CMDS
	$(MAKE) RANLIB="$(TARGET_RANLIB)" CC="$(TARGET_CC)" CFLAGS="-I $(@D)/src -I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS)" LDFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS)" -C "$(@D)"
endef

define CZDOOM_INSTALL_TARGET_CMDS
	$(RM) -rf $(CZDOOM_LOCAL_DIR)
	mkdir -p $(CZDOOM_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/src/prboom $(CZDOOM_LOCAL_DIR)/czdoom.dge
	$(INSTALL) -D -m 0755 $(@D)/data/prboom.wad $(CZDOOM_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(CZDOOM_PACKAGE_DIR)/czdoom.png $(CZDOOM_LOCAL_DIR)
	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(CZDOOM_PACKAGE_DIR)/czdoom.gmenu2x $(GMENU2X_GAMES_SECTION)/czdoom
endef

$(eval $(call GENTARGETS,package/dingux,czdoom))
# fixme: configure --with-sdl-prefix=$(STAGING_DIR)/usr
#define CZDOOM_CONFIGURE_CMDS
#	(cd $(@D); chmod +x configure; rm -rf config.cache; \
#		$(TARGET_CONFIGURE_ARGS) \
#		$(TARGET_CONFIGURE_OPTS) \
#		CC="$(TARGET_CC)" \
#		CFLAGS="$(TARGET_CFLAGS)" \
#		./configure \
#		--without-net \
#		--disable-i386-asm \
#		--disable-gl \
#		--disable-sdltest \
#	)
#endef
#$(eval $(call AUTOTARGETS,package/dingux,czdoom))
