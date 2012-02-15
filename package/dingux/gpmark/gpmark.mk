#############################################################
#
# Dingux Commander
#
#############################################################
GPMARK_VERSION =
GPMARK_SITE =
GPMARK_SOURCE = GPmark004_source.tar.gz
GPMARK_DEPENDENCIES = sdl

# dirty hack
GPMARK_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/gpmark
GPMARK_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/gpmark

define GPMARK_BUILD_CMDS
	# Force -O3 -funroll-loops
	$(MAKE) BIN=gpmark CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" STRIP="$(TARGET_STRIP)" CXXFLAGS="-I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS) -O3 -funroll-loops" LIBS="-L$(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lstdc++ -lSDL" -C "$(@D)"
endef

define GPMARK_INSTALL_TARGET_CMDS
	$(RM) -rf $(GPMARK_LOCAL_DIR)
	mkdir -p $(GPMARK_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/gpmark $(GPMARK_LOCAL_DIR)/gpmark.dge
	$(INSTALL) -D -m 0644 $(@D)/bunnybig.3do $(GPMARK_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(@D)/draculf.bin $(GPMARK_LOCAL_DIR)
	mkdir $(GPMARK_LOCAL_DIR)/results
	$(INSTALL) -D -m 0644 $(GPMARK_PACKAGE_DIR)/gpmark.png $(GPMARK_LOCAL_DIR)

	mkdir -p $(GMENU2X_APPS_SECTION)
	$(INSTALL) -D -m 0644 $(GPMARK_PACKAGE_DIR)/gpmark.gmenu2x $(GMENU2X_APPS_SECTION)/gpmark
endef

$(eval $(call GENTARGETS,package/dingux,gpmark))
