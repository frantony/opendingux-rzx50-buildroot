#############################################################
#
#
#
#############################################################
GP2XPECTRUM_SITE =
GP2XPECTRUM_SITE_METHOD =
GP2XPECTRUM_VERSION =
GP2XPECTRUM_SOURCE = gp2xpectrum.tar.gz
GP2XPECTRUM_DEPENDENCIES = zlib

# dirty hack
GP2XPECTRUM_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/gp2xpectrum
GP2XPECTRUM_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/gp2xpectrum

define GP2XPECTRUM_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" CFLAGS="-I. -Icpu -Iincludes -UUSE_ZIP -DGP2X -DA320 -DSOUND_X128  -I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS)" LDFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lm" -f Makefile.a320 -C "$(@D)"
endef

define GP2XPECTRUM_INSTALL_TARGET_CMDS
	$(RM) -rf $(GP2XPECTRUM_LOCAL_DIR)
	mkdir -p $(GP2XPECTRUM_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/sp.dge $(GP2XPECTRUM_LOCAL_DIR)/gp2xpectrum.dge
	$(INSTALL) -D -m 0644 $(GP2XPECTRUM_PACKAGE_DIR)/gp2xpectrum.png $(GP2XPECTRUM_LOCAL_DIR)
	#$(INSTALL) -D -m 0755 $(GP2XPECTRUM_PACKAGE_DIR)/gp2xpectrum-wrapper.dge $(GP2XPECTRUM_LOCAL_DIR)

	#mkdir -p $(GMENU2X_EMULATORS_SECTION)
	#$(INSTALL) -D -m 0644 $(GP2XPECTRUM_PACKAGE_DIR)/gp2xpectrum.gmenu2x $(GMENU2X_EMULATORS_SECTION)/gp2xpectrum
endef

$(eval $(call GENTARGETS,package/dingux,gp2xpectrum))
