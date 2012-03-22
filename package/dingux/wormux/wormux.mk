#############################################################
#
#
#
#############################################################
WORMUX_VERSION = 0.9.2.1
WORMUX_SOURCE = wormux-$(WORMUX_VERSION).tar.bz2
WORMUX_SITE =
WORMUX_DEPENDENCIES = sdl sdl_image sdl_mixer sdl_ttf sdl_gfx sdl_net libcurl libxml2 host-pkg-config

# dirty hack
WORMUX_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/wormux
WORMUX_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/wormux
WORMUX_CONF_OPT += --with-sdl-prefix=$(STAGING_DIR)/usr
WORMUX_CONF_OPT += --without-libintl
WORMUX_CONF_ENV += cxx_present=yes

define WORMUX_INSTALL_TARGET_CMDS
	$(RM) -rf $(WORMUX_LOCAL_DIR)
	mkdir -p $(WORMUX_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/src/wormux $(WORMUX_LOCAL_DIR)/wormux.dge
	$(INSTALL) -D -m 0755 $(WORMUX_PACKAGE_DIR)/wormux-wrapper.dge $(WORMUX_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(WORMUX_PACKAGE_DIR)/wormux.png $(WORMUX_LOCAL_DIR)

	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(WORMUX_PACKAGE_DIR)/wormux.gmenu2x $(GMENU2X_GAMES_SECTION)/wormux
endef

$(eval $(call AUTOTARGETS,package/dingux,wormux))
