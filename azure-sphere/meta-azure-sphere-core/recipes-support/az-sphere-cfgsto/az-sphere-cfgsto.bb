DESCRIPTION = "az-sphere-cfgsto"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=e74f78882cab57fd1cc4c5482b9a214a"

SRC_URI = " \
	git://github.com/Azure/azure-sphere-wpa-supplicant.git;protocol=https \
	file://CMakeLists.txt \
	"

SRCREV = "35ae592823ebe0d3061ede0606e3378195aff7d6"

S = "${WORKDIR}/git"

inherit pkgconfig cmake

BBCLASSEXTEND = "native nativesdk"

RDEPENDS_${PN}-dev = "${PN}-staticdev"

do_configure_prepend() {
	cp ${WORKDIR}/CMakeLists.txt ${WORKDIR}/git/CMakeLists.txt
}
