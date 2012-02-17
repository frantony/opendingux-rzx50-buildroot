#############################################################
#
# http://code.google.com/p/gnuboy/
#
#############################################################
GNUBOY_VERSION = svn
GNUBOY_SITE =
GNUBOY_SOURCE = gnuboy.svn.tar.gz
GNUBOY_DEPENDENCIES = sdl

# dirty hack
GNUBOY_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/gnuboy
GNUBOY_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/gnuboy

define GNUBOY_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" CFLAGS="-I $(STAGING_DIR)/usr/include/SDL $(TARGET_CXXFLAGS) -DGNUBOY_USE_BINARY_RTC_FILES -DGNUBOY_DISABLE_DEBUG_DISASSEMBLE -DGNUBOY_NO_MINIZIP" LDFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL" -C "$(@D)" -f Makefile.dingux
endef

define GNUBOY_INSTALL_TARGET_CMDS
	$(RM) -rf $(GNUBOY_LOCAL_DIR)
	mkdir -p $(GNUBOY_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/gnuboy_dingux.dge $(GNUBOY_LOCAL_DIR)/gnuboy.dge
	$(INSTALL) -D -m 0644 $(GNUBOY_PACKAGE_DIR)/gnuboy.png $(GNUBOY_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(GNUBOY_PACKAGE_DIR)/gnuboy.rc $(GNUBOY_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(GNUBOY_PACKAGE_DIR)/gnuboy-wrapper.dge $(GNUBOY_LOCAL_DIR)

	mkdir -p $(GMENU2X_EMULATORS_SECTION)
	$(INSTALL) -D -m 0644 $(GNUBOY_PACKAGE_DIR)/gnuboy.gmenu2x $(GMENU2X_EMULATORS_SECTION)/gnuboy
endef

$(eval $(call GENTARGETS,package/dingux,gnuboy))
