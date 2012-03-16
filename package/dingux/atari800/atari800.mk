#############################################################
#
# Atari 800 Emulator
#
#############################################################
ATARI800_VERSION = 2.2.1
ATARI800_SITE =
# hack: not original source tarball!
ATARI800_SOURCE = atari800-$(ATARI800_VERSION)-src.tar.gz
ATARI800_DEPENDENCIES = sdl libpng

# dirty hack
ATARI800_PACKAGE_DIR = $(BASE_DIR)/../package/dingux/atari800
ATARI800_DINGUX_LOCAL_DIR = $(DINGUX_LOCAL_DIR)/apps/atari800

ATARI800_CONF_OPT+=--target=sdl
ATARI800_CONF_OPT+=--with-sdl-prefix=$(STAGING_DIR)/usr
ATARI800_CONF_OPT+=--disable-ide

define ATARI800_INSTALL_TARGET_CMDS
	$(RM) -rf $(ATARI800_DINGUX_LOCAL_DIR)
	mkdir -p $(ATARI800_DINGUX_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/atari800 $(ATARI800_DINGUX_LOCAL_DIR)
	$(INSTALL) -D -m 0644 $(ATARI800_PACKAGE_DIR)/atari800.png $(ATARI800_DINGUX_LOCAL_DIR)
endef

$(eval $(call AUTOTARGETS,package/dingux,atari800))
