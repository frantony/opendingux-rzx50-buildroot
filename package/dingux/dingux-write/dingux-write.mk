#############################################################
#
# Dingux Write
#
#############################################################
DINGUX_WRITE_VERSION = 1.1.0
DINGUX_WRITE_SITE = http://prizma.bmstu.ru/rzx50-storage/src/
DINGUX_WRITE_SOURCE = dingux-write_$(DINGUX_WRITE_VERSION).tar.gz
DINGUX_WRITE_DEPENDENCIES = sdl sdl_image libpng zlib

# dirty hack
DINGUX_WRITE_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/dingux-write
DINGUX_WRITE_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/dingux-write

define DINGUX_WRITE_BUILD_CMDS
	$(MAKE) LIBS="" STRIP="$(TARGET_STRIP)" CC="$(TARGET_CC)" CFLAGS="-DMPU_JZ4740 -DNO_STDIO_REDIRECT -DDINGUX_MODE -DWRITE_VERSION='\"1.1.0\"' -I$(STAGING_DIR)/usr/include/SDL -I$(STAGING_DIR)/usr/include -g $(TARGET_CFLAGS)" LDFLAGS="-L$(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lSDL_image -lpng" CROSS_COMPILE="$(TARGET_CROSS)" -f Makefile-dingux -C "$(@D)/src"
endef

define DINGUX_WRITE_INSTALL_TARGET_CMDS
	$(RM) -rf $(DINGUX_WRITE_LOCAL_DIR)
	mkdir -p $(DINGUX_WRITE_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/src/dingux-write $(DINGUX_WRITE_LOCAL_DIR)/dingux-write.dge
	# Very dirty hack
	cp -a $(DINGUX_WRITE_PACKAGE_DIR)/files-rzx50/* $(DINGUX_WRITE_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(DINGUX_WRITE_PACKAGE_DIR)/dingux-write.png $(DINGUX_WRITE_LOCAL_DIR)
	#$(INSTALL) -D -m 0755 $(DINGUX_WRITE_PACKAGE_DIR)/dingux-write-wrapper.dge $(DINGUX_WRITE_LOCAL_DIR)

	mkdir -p $(GMENU2X_APPS_SECTION)
	$(INSTALL) -D -m 0644 $(DINGUX_WRITE_PACKAGE_DIR)/dingux-write.gmenu2x $(GMENU2X_APPS_SECTION)/dingux-write
endef

$(eval $(call GENTARGETS,package/dingux,dingux-write))
