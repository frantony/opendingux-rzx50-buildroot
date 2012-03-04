#############################################################
#
# kexec-static
#
#############################################################
SKEXEC_VERSION = 2.0.1
SKEXEC_SOURCE = kexec-tools-$(SKEXEC_VERSION).tar.bz2
SKEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/horms/kexec-tools/

SKEXEC_CONF_OPT += --without-zlib

define SKEXEC_BUILD_CMDS
	$(MAKE) -C $(@D) LIBS="-static" build/sbin/kexec
endef

define SKEXEC_INSTALL_TARGET_CMDS
	mkdir -p $(DINGUX_LOCAL_DIR)/sbin
	$(INSTALL) -D -m 0755 $(@D)/build/sbin/kexec $(DINGUX_LOCAL_DIR)/sbin/kexec-static
endef

$(eval $(call AUTOTARGETS,package,skexec))
