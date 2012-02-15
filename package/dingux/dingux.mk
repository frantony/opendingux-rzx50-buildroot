GMENU2X_SECTIONS = $(DINGUX_LOCAL_DIR)/home/.gmenu2x/sections
GMENU2X_APPS_SECTION = $(GMENU2X_SECTIONS)/applications
GMENU2X_EMULATORS_SECTION = $(GMENU2X_SECTIONS)/emulators
GMENU2X_GAMES_SECTION = $(GMENU2X_SECTIONS)/games

DINGUX_LOCAL_APPS_DIR = $(DINGUX_LOCAL_DIR)/apps
DINGUX_PACKAGE_DIR = $(BASE_DIR)/../package/dingux

include package/dingux/*/*.mk
