#############################################################
#
# Dingux Write
#
#############################################################
SPOUT_VERSION =
SPOUT_SITE =
SPOUT_SOURCE = dingux-spout.tar.gz
SPOUT_DEPENDENCIES = sdl

# dirty hack
SPOUT_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/spout
SPOUT_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/spout
SPOUT_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr

define SPOUT_INSTALL_TARGET_CMDS
	$(RM) -rf $(SPOUT_LOCAL_DIR)
	mkdir -p $(SPOUT_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/spout $(SPOUT_LOCAL_DIR)/spout.dge
	$(INSTALL) -D -m 0755 $(SPOUT_PACKAGE_DIR)/spout-wrapper.dge $(SPOUT_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(SPOUT_PACKAGE_DIR)/spout.png $(SPOUT_LOCAL_DIR)

	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(SPOUT_PACKAGE_DIR)/spout.gmenu2x $(GMENU2X_GAMES_SECTION)/spout
endef

$(eval $(call AUTOTARGETS,package/dingux,spout))
