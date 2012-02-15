#############################################################
#
# Dingux hello
#
#############################################################
HELLO_VERSION = 2.7
HELLO_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hello/
HELLO_SOURCE = hello_$(HELLO_VERSION).orig.tar.gz

HELLO_DEPENDENCIES =

# dirty hack
HELLO_PACKAGE_DIR = $(BASE_DIR)/../package/dingux/hello
HELLO_DINGUX_LOCAL_DIR = $(DINGUX_LOCAL_DIR)/apps/hello

define HELLO_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
endef

define HELLO_INSTALL_TARGET_CMDS
	$(RM) -rf $(HELLO_DINGUX_LOCAL_DIR)
	mkdir -p $(HELLO_DINGUX_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(@D)/src/hello $(HELLO_DINGUX_LOCAL_DIR)
	$(INSTALL) -D -m 0755 $(HELLO_PACKAGE_DIR)/hello.png $(HELLO_DINGUX_LOCAL_DIR)
endef

$(eval $(call AUTOTARGETS,package/dingux,hello))
