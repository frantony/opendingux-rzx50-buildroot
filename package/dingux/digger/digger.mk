#############################################################
#
#
#
#############################################################
DIGGER_SITE =
DIGGER_SITE_METHOD =
DIGGER_VERSION =
DIGGER_SOURCE = dingoo-digger-r8.tar.gz
DIGGER_DEPENDENCIES = sdl zlib

# dirty hack
DIGGER_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/digger
DIGGER_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/digger

define DIGGER_BUILD_CMDS
	$(MAKE) BIN_TARGET="digger.dge" CXX="$(TARGET_CXX)" C="$(TARGET_CC)" STD_OPTS="-c -D_SDL -DLINUX -I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS)" LD_OPTS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lz" -C "$(@D)/build/dingux"
endef

define DIGGER_INSTALL_TARGET_CMDS
	$(RM) -rf $(DIGGER_LOCAL_DIR)
	mkdir -p $(DIGGER_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/build/dingux/digger.dge $(DIGGER_LOCAL_DIR)/digger.dge
	$(INSTALL) -D -m 0644 $(DIGGER_PACKAGE_DIR)/digger.png $(DIGGER_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(DIGGER_PACKAGE_DIR)/digger-wrapper.dge $(DIGGER_LOCAL_DIR)

	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(DIGGER_PACKAGE_DIR)/digger.gmenu2x $(GMENU2X_GAMES_SECTION)/digger
endef

$(eval $(call GENTARGETS,package/dingux,digger))
