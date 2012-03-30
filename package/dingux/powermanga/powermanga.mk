#############################################################
#
# Powermanga is an arcade 2D shoot-em-up game
#
#############################################################
POWERMANGA_VERSION = 0.90
POWERMANGA_SITE = http://linux.tlk.fr/games/Powermanga/download/
POWERMANGA_SOURCE = powermanga-$(POWERMANGA_VERSION).tgz
POWERMANGA_DEPENDENCIES = sdl sdl_mixer

# dirty hack
POWERMANGA_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/powermanga
POWERMANGA_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/powermanga
POWERMANGA_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr --without-x

define POWERMANGA_DISABLE_XLIBS
	sed -i "s,XLIB_LIBS=.*$$,XLIB_LIBS=\"\"," $(@D)/configure
endef

POWERMANGA_PRE_CONFIGURE_HOOKS = POWERMANGA_DISABLE_XLIBS

define POWERMANGA_INSTALL_TARGET_CMDS
	$(RM) -rf $(POWERMANGA_LOCAL_DIR)
	mkdir -p $(POWERMANGA_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/powermanga $(POWERMANGA_LOCAL_DIR)/powermanga.dge
	$(INSTALL) -D -m 0755 $(POWERMANGA_PACKAGE_DIR)/powermanga-wrapper.dge $(POWERMANGA_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(POWERMANGA_PACKAGE_DIR)/powermanga.png $(POWERMANGA_LOCAL_DIR)
	# fixme
	cp -a $(@D)/data $(POWERMANGA_LOCAL_DIR)
	cp -a $(@D)/graphics $(POWERMANGA_LOCAL_DIR)
	cp -a $(@D)/order $(POWERMANGA_LOCAL_DIR)
	cp -a $(@D)/sounds $(POWERMANGA_LOCAL_DIR)
	cp -a $(@D)/texts $(POWERMANGA_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(@D)/AUTHORS $(POWERMANGA_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(@D)/README $(POWERMANGA_LOCAL_DIR)

	mkdir -p $(DINGUX_LOCAL_DIR)/home/.tlkgames
	$(INSTALL) -D -m 0644 $(POWERMANGA_PACKAGE_DIR)/powermanga.conf $(DINGUX_LOCAL_DIR)/home/.tlkgames/

	mkdir -p $(GMENU2X_GAMES_SECTION)
	$(INSTALL) -D -m 0644 $(POWERMANGA_PACKAGE_DIR)/powermanga.gmenu2x $(GMENU2X_GAMES_SECTION)/powermanga
endef

$(eval $(call AUTOTARGETS,package/dingux,powermanga))
