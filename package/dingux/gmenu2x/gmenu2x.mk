#############################################################
#
# gmenu2x for /usr/local/bin
#
#############################################################
GMENU2X_LOCAL_VERSION =
GMENU2X_LOCAL_SITE = git://projects.qi-hardware.com/gmenu2x.git
GMENU2X_LOCAL_DEPENDENCIES = sdl sdl_gfx libpng
GMENU2X_LOCAL_AUTORECONF = YES
GMENU2X_LOCAL_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr --enable-platform=dingux
GMENU2X_LOCAL_SOURCE = gmenu2x-local.tar.gz

define GMENU2X_LOCAL_INSTALL_TARGET_CMDS
	mkdir -p $(DINGUX_LOCAL_DIR)/bin
	$(INSTALL) -D -m 0755 $(@D)/src/gmenu2x $(DINGUX_LOCAL_DIR)/bin
endef

$(eval $(call AUTOTARGETS,package/dingux,gmenu2x-local))
