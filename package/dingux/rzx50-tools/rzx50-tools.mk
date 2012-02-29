#############################################################
#
# RZX50: tools for lcd, gpio etc.
#
#############################################################
RZX50_TOOLS_SITE =
RZX50_TOOLS_SITE_METHOD =
RZX50_TOOLS_VERSION = 20120317
RZX50_TOOLS_SOURCE = rzx50-tools-$(RZX50_TOOLS_VERSION).tar.gz
RZX50_TOOLS_DEPENDENCIES =

# very dirty hack: use make install
RZX50_TOOLS_PACKAGE_DIR = $(BASE_DIR)/../package/dingux/rzx50-tools

define RZX50_TOOLS_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" CFLAGS="-I $(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" LDFLAGS="-L $(STAGING_DIR)/usr/lib $(TARGET_LDFLAGS)" -C "$(@D)"
endef

define RZX50_TOOLS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/rzx50_lcd_mode $(TARGET_DIR)/usr/sbin
	$(INSTALL) -D -m 0755 $(@D)/findkey $(TARGET_DIR)/usr/sbin
	$(INSTALL) -D -m 0755 $(@D)/jz4750d_gpio_dump $(TARGET_DIR)/usr/sbin
endef

$(eval $(call GENTARGETS,package/dingux,rzx50-tools))
