#############################################################
#
# Unreal Speccy Portable(ZX-Spectrum emulator)
#
# http://code.google.com/p/unrealspeccyp/
#
#############################################################
UNREALSPECCYP_SITE =
UNREALSPECCYP_SITE_METHOD =
UNREALSPECCYP_VERSION =
UNREALSPECCYP_SOURCE = unrealspeccyp.tar.gz
UNREALSPECCYP_DEPENDENCIES = sdl

# dirty hack
UNREALSPECCYP_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/unrealspeccyp
UNREALSPECCYP_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/unrealspeccyp

define UNREALSPECCYP_BUILD_CMDS
	$(MAKE) C="$(TARGET_CC)" CXX="$(TARGET_CXX)" CFLAGS="-c -I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS)" CXXFLAGS="-c -I $(STAGING_DIR)/usr/include/SDL $(TARGET_CFLAGS) -fno-rtti -fno-threadsafe-statics -D_LINUX -DUSE_SDL -DSDL_KEYS_DINGOO" LFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS) -lSDL" -C "$(@D)/build/dingux/"
endef

define UNREALSPECCYP_INSTALL_TARGET_CMDS
	$(RM) -rf $(UNREALSPECCYP_LOCAL_DIR)
	mkdir -p $(UNREALSPECCYP_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/build/dingux/Release/unreal_speccy_portable $(UNREALSPECCYP_LOCAL_DIR)/unrealspeccyp.dge
	$(INSTALL) -D -m 0644 $(UNREALSPECCYP_PACKAGE_DIR)/unrealspeccyp.png $(UNREALSPECCYP_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(UNREALSPECCYP_PACKAGE_DIR)/unrealspeccyp-wrapper.dge $(UNREALSPECCYP_LOCAL_DIR)

	mkdir -p $(UNREALSPECCYP_LOCAL_DIR)/res/rom
	mkdir -p $(UNREALSPECCYP_LOCAL_DIR)/res/font
	$(INSTALL) -D -m 0755 $(@D)/res/font/spxtrm4f.fnt $(UNREALSPECCYP_LOCAL_DIR)/res/font
	$(INSTALL) -D -m 0755 $(@D)/res/rom/sos48.rom $(UNREALSPECCYP_LOCAL_DIR)/res/rom
	$(INSTALL) -D -m 0755 $(@D)/res/rom/dos513f.rom $(UNREALSPECCYP_LOCAL_DIR)/res/rom
	$(INSTALL) -D -m 0755 $(@D)/res/rom/service.rom $(UNREALSPECCYP_LOCAL_DIR)/res/rom
	$(INSTALL) -D -m 0755 $(@D)/res/rom/sos128.rom $(UNREALSPECCYP_LOCAL_DIR)/res/rom
	$(INSTALL) -D -m 0755 $(@D)/res/rom/test.rom $(UNREALSPECCYP_LOCAL_DIR)/res/rom

	mkdir -p $(GMENU2X_EMULATORS_SECTION)
	$(INSTALL) -D -m 0644 $(UNREALSPECCYP_PACKAGE_DIR)/unrealspeccyp.gmenu2x $(GMENU2X_EMULATORS_SECTION)/unrealspeccyp
endef

$(eval $(call GENTARGETS,package/dingux,unrealspeccyp))
