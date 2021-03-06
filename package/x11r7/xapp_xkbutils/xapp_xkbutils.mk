################################################################################
#
# xapp_xkbutils -- X.Org xkbutils application
#
################################################################################

XAPP_XKBUTILS_VERSION = 1.0.2
XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
XAPP_XKBUTILS_AUTORECONF = NO
XAPP_XKBUTILS_DEPENDENCIES = xlib_libXaw xlib_libxkbfile

$(eval $(call AUTOTARGETS,package/x11r7,xapp_xkbutils))
