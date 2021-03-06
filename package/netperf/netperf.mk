#############################################################
#
# netperf
#
#############################################################

NETPERF_VERSION = 2.4.5
NETPERF_SITE = ftp://ftp.netperf.org/netperf
NETPERF_CONF_ENV = ac_cv_func_setpgrp_void=set
NETPERF_CONF_ENV += enable_slotlookup=none

define NETPERF_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/src/netperf \
		$(TARGET_DIR)/usr/bin/netperf
	$(INSTALL) -m 0755 $(@D)/src/netserver \
		$(TARGET_DIR)/usr/bin/netserver
endef

define NETPERF_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/netperf
	rm -f $(TARGET_DIR)/usr/bin/netserver
endef

$(eval $(call AUTOTARGETS,package,netperf))
