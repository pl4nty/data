FILESEXTRAPATHS_prepend := "${THISDIR}/gdb-cross-canadian:"

SRC_URI += "file://0001-Used-cached-reads-for-reading-code-locations-during-.patch \
    file://0002-Implement-local-solib-caching.patch \
    file://0003-Only-fetch-values-for-children-actually-requested.patch \
"

CANADIANEXTRAOS=""

# Enable ncurses text UI for GDB clients
PACKAGECONFIG_append = " tui"
# Windows SDK version doesn't have curses/ncurses
PACKAGECONFIG_remove_sdkmingw32 = " tui"

PACKAGECONFIG_remove = " python"
PACKAGECONFIG_remove = " readline"
DEPENDS_remove_sdkmingw32 = "nativesdk-python nativesdk-readline"

# Cleanup all versions of gdb build (poky and azure-sphere-core)
do_install_append_sdkmingw32() {
    rm ${D}/${bindir}/${TARGET_PREFIX}gdb-add-index*
}
