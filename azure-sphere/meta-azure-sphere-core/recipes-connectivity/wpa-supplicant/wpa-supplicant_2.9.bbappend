#
# Azure Sphere specific WPA Supplicant tweaks
#

# Use local files
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# Override to exclude dbus since it's not supported on Azure Sphere
DEPENDS = "libnl az-sphere-cfgsto"

RRECOMMENDS_${PN} = "wpa-supplicant-cli"

PACKAGECONFIG ?= ""

# SSL config (use WolfSSL instead of pulling in OpenSSL)
PACKAGECONFIG = "wolfssl"
PACKAGECONFIG[wolfssl] = ",,wolfssl"

SYSTEMD_SERVICE_${PN}_append = " wpa_supplicant-nl80211@.service wpa_supplicant-wired@.service"

# Pull in patches
SRC_URI += "file://0001-wpa_ctrl_groups.patch \
            file://0003-allow-wpa-supplicant-to-skip-date-check.patch \
            file://0004-Add-a-new-mixed-autoscan-module-for-better-targeted-scans.patch \
            file://0006-azsphere-configuration-backend.patch \
            file://0007-Don-t-commit-the-temporary-config-if-there-was-an-er.patch \
            file://0008-Using-config-store-for-config-and-certs.patch \
            file://0009-consume-config-store-from-library.patch \
            file://0010-Return-NULL-when-retrieving-an-unset-string-key_mgmt.patch \
            file://0011-Added-consolidated-events-for-extended-network-error.patch \
            file://0012-Unload-CA-certs-on-connection-cleanup.patch \
            file://0013-Returning-number-of-read-parse-errors-with-STATUS-re.patch \
            file://0014-Use-Gen-Name-Object.patch \
            file://0015-wolfssl4.5-fix.patch \
            file://0016-remove-md4-support.patch \
            file://0017-remove-unused-cmds.patch \
            "

do_configure_prepend () {
    if echo "${PACKAGECONFIG}" | grep -qw "wolfssl"; then
        ssl=wolfssl
    fi
}

do_configure_append () {
    echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/.config

    # Use the AzureSphere configuration backend.
    echo "CONFIG_BACKEND = azsphere" >> wpa_supplicant/.config

    # Allow wolfSSL_CTX_load_verify_buffer to succeed even if the date on the
    # CA root certificate is invalid according to the device's clock.
    echo "CFLAGS +=\"-DCONFIG_AZSPHERE_DISABLE_TIME_CHECKS\"" >> wpa_supplicant/.config

    echo "DRV_CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/.config

	# Remove MD4 support
	echo "CFLAGS +=\"-DCONFIG_NO_MD4\"" >> wpa_supplicant/.config
	# Remove unused WPA CLI commands to save space
	echo "CFLAGS +=\"-DCONFIG_REMOVE_UNUSED_CMDS\"" >> wpa_supplicant/.config
}

do_install () {
    install -d ${D}${sbindir}
    install -m 755 wpa_supplicant/wpa_supplicant ${D}${sbindir}
    install -m 755 wpa_supplicant/wpa_cli        ${D}${sbindir}
}
