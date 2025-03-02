SUMMARY = "wolfSSL Lightweight Embedded SSL/TLS Library"
DESCRIPTION = "wolfSSL, formerly CyaSSL, is a lightweight SSL library written \
               in C and optimized for embedded and RTOS environments. It can \
               be up to 20 times smaller than OpenSSL while still supporting \
               a full TLS client and server, up to TLS 1.3"
HOMEPAGE = "https://www.wolfssl.com/products/wolfssl"
BUGTRACKER = "https://github.com/wolfssl/wolfssl/issues"
SECTION = "libs"

LICENSE_az-sphere-core = "GPLv2"
LIC_FILES_CHKSUM_az-sphere-core = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRC_URI_az-sphere-core = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
SRCREV_az-sphere-core = "830de9a9fb99e30f9ac9caa0a7f7bba29c3b4863"

PROVIDES += "cyassl"
RPROVIDES_${PN} = "cyassl"

BASEVER = "5.5.3"
PV = "${BASEVER}+git${SRCPV}"

S = "${WORKDIR}/git"

inherit autotools

# We disable fastmath, sp-math and sp-math-all, we use default interger math because of size constraints.
# poly1305 and chacha are enabled to expose their respective wolfcrypt APIs.
# We disable sp-asm as it was disabled until wolfssl 4.8.1, although 5.5.3 enables it by default, we 
# disable it for size issues.
# We enable eccencrypt to expose ECC wolfcrypt APIs.

EXTRA_OECONF = "--enable-ecc \
    --enable-static \
    --enable-tlsx \
    --enable-supportedcurves \
    --disable-fastmath \
    --disable-sp-math \
    --disable-sp-math-all \
    --enable-ocspstapling \
    --enable-harden \
    --enable-secure-renegotiation \
    --enable-certgen \
    --enable-pkcs7 \
    --enable-indef \
    --enable-smallcache \
    --enable-pkcallbacks \
    --enable-cmac \
    --enable-keygen \
    --enable-poly1305 \
    --enable-chacha \
    --disable-oldtls \
    --disable-sha224 \
    --disable-errorqueue \
    --disable-examples \
    --enable-aesgcm=n8 \
    --disable-inline \
    --disable-asm \
    --enable-opensslextra=x509small \
    --enable-tls13 \
    --enable-des3 \ 
    --enable-atomicuser \
    --enable-crl \
    --enable-wpas=small \
    --disable-sp-asm \
    --enable-eccencrypt \
    "

BBCLASSEXTEND += "native nativesdk"
