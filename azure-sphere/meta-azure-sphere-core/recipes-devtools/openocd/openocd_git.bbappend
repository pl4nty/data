FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
#inherit autotools pkgconfig
DEPENDS = "libusb1"

SRC_URI = "git://github.com/ntfreak/openocd;protocol=http;name=openocd \
           git://github.com/msteveb/jimtcl;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
           git://github.com/syntacore/libjaylink;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
           file://0001-MT3620-support.patch \
           file://0003-Disable-noisy-log-line.patch \
           file://mt3620-rdb-ftdi.cfg \
           file://mt3620-io0.cfg \
           file://mt3620-io1.cfg \
           "

# Master commit post 0.10.0
PV = "0.10.0+git${SRCPV}"
SRCREV_FORMAT = "openocd"
SRCREV_openocd = "5a79481d3b17c4134a43052cea9a7902bbf0accf"
SRCREV_jimtcl = "0aa0fb4e3a38d38a49de9eb585d93d63a370dcf6"
SRCREV_libjaylink = "4959f4e18a2bb0de21abe66bbfe403b56f599856"

# Already fixed in the master build we're picking up
CVE_CHECK_WHITELIST = " \
            CVE-2018-5704 \
            "


# OpenOCD requires to build in tree
B = "${S}"

# Disable some warnings that the code will trip over in GCC7+
CPPFLAGS_append = " -Wimplicit-fallthrough=0 -Wno-format-truncation -Wno-format-overflow -Wno-tautological-compare "


do_install_append() {
    # Add scripts for MT3620
    install -m 444 ${WORKDIR}/mt3620-rdb-ftdi.cfg ${D}${datadir}/openocd/scripts/
    install -m 444 ${WORKDIR}/mt3620-io0.cfg ${D}${datadir}/openocd/scripts/
    install -m 444 ${WORKDIR}/mt3620-io1.cfg ${D}${datadir}/openocd/scripts/
}

FILES_${PN}_append = " ${bindir}/*.exe"


DEPENDS_remove_class-nativesdk = "libusb-compat"

# --enable-ftdi enables the drivers derived from the ftdi driver
# but we dont use them, upstream doesnt provide a PACKAGECONFIG
# so we remove that here.
DEPENDS_remove_class-nativesdk = "libftdi"
EXTRA_OECONF_remove_class-nativesdk = "--enable-ftdi"

PACKAGECONFIG = "remote-bitbang"
