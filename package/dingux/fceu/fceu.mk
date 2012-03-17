#############################################################
#
# FCE Ultra NES Emulator
#
#############################################################
FCEU_SITE = http://ftp.debian.org/debian/pool/main/f/fceu
FCEU_SITE_METHOD =
FCEU_VERSION = 0.98.12
FCEU_SOURCE = fceu_$(FCEU_VERSION).orig.tar.gz
FCEU_DEPENDENCIES = sdl

# dirty hack
FCEU_PACKAGE_DIR = $(DINGUX_PACKAGE_DIR)/fceu
FCEU_LOCAL_DIR = $(DINGUX_LOCAL_APPS_DIR)/fceu

FCEU_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr

define FCEU_INSTALL_TARGET_CMDS
	$(RM) -rf $(FCEU_LOCAL_DIR)
	mkdir -p $(FCEU_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/src/fceu $(FCEU_LOCAL_DIR)/fceu.dge
	$(INSTALL) -D -m 0644 $(FCEU_PACKAGE_DIR)/fceu.png $(FCEU_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(FCEU_PACKAGE_DIR)/fceu-wrapper.dge $(FCEU_LOCAL_DIR)

	mkdir -p $(GMENU2X_EMULATORS_SECTION)
	$(INSTALL) -D -m 0644 $(FCEU_PACKAGE_DIR)/fceu.gmenu2x $(GMENU2X_EMULATORS_SECTION)/fceu
endef

$(eval $(call AUTOTARGETS,package/dingux,fceu))
