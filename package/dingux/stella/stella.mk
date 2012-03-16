#############################################################
#
# Dingux Write
#
#############################################################
STELLA_VERSION = 3.5.5
STELLA_SITE =
STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.gz
STELLA_DEPENDENCIES = sdl zlib libpng

# dirty hack
STELLA_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/stella
STELLA_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/stella

define STELLA_BUILD_CMDS
	touch $(@D)/config.mak
	$(MAKE) RM="rm -f" CAT=cat CP=cp ECHO=echo MKDIR="mkdir -p" CXX="$(TARGET_CXX)" LD="$(TARGET_CXX)" LIBS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL -lpng -lz" HAVE_GCC=1 HAVE_GCC3=1 INCLUDES="-I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS) -Isrc/emucore -Isrc/common -Isrc/gui -D_GNU_SOURCE=1 -D_REENTRANT -Isrc/unix -Isrc/debugger -Isrc/debugger/gui -Isrc/yacc -Isrc/cheat" DEFINES="-DSTRICTUNZIP -DWINDOWED_SUPPORT -DUNIX -DBSPF_UNIX -DHAVE_GETTIMEOFDAY -DHAVE_INTTYPES -DSOUND_SUPPORT -DDEBUGGER_SUPPORT -DSNAPSHOT_SUPPORT -DJOYSTICK_SUPPORT -DCHEATCODE_SUPPORT -DTHUMB_SUPPORT" MODULES="src/unix src/yacc src/cheat src/debugger src/debugger/gui src/emucore src/gui src/common" -C "$(@D)"
endef

define STELLA_INSTALL_TARGET_CMDS
	$(RM) -rf $(STELLA_LOCAL_DIR)
	mkdir -p $(STELLA_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/stella $(STELLA_LOCAL_DIR)/stella.dge
	$(INSTALL) -D -m 0644 $(STELLA_PACKAGE_DIR)/stella.png $(STELLA_LOCAL_DIR)

	mkdir -p $(GMENU2X_EMULATORS_SECTION)
	$(INSTALL) -D -m 0644 $(STELLA_PACKAGE_DIR)/stella.gmenu2x $(GMENU2X_EMULATORS_SECTION)/stella
endef

$(eval $(call GENTARGETS,package/dingux,stella))
