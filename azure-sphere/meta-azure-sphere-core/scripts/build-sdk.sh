#!/bin/bash
#
# Build Azure Sphere Core SDK components
#

# Get script folder location
if [ -n "$BASH_SOURCE" ]; then
	SCRIPT_PATH="${BASH_SOURCE[0]}"
else
	echo "Warning: unsupported shell"
    exit 1
fi

# Set host machine for SDK
if [ "$1" == "--windows" ]; then
    SDKMACHINE=i686-mingw32
elif [ "$1" == "--linux" ]; then
    SDKMACHINE=x86_64
else
    echo "usage: build-sdk [--windows|--linux]"
    exit 1
fi

SELF_PATH=`readlink -f "${SCRIPT_PATH}"`
SCRIPT_ROOT=`dirname "${SELF_PATH}"`
POKY_ROOT=${SCRIPT_ROOT}/../../poky
TEMPLATE_DIR=${SCRIPT_ROOT}/../conf-templates/sdk
export SDKMACHINE
export BUILD_ROOT=`readlink -m "${SCRIPT_ROOT}/../../build/sdk"`
export CACHE_ROOT=`readlink -m "${SCRIPT_ROOT}/../../build/cache"`
export TMPDIR=${BUILD_ROOT}/out
export BB_ENV_EXTRAWHITE="TMPDIR CACHE_ROOT"

LOG_DIR=${BUILD_ROOT}

if [ ! -d "$BUILD_ROOT" ]; then
    mkdir -p $BUILD_ROOT
fi

TEMPLATECONF=${TEMPLATE_DIR} MACHINE=mt3620 source ${POKY_ROOT}/oe-init-build-env ${BUILD_ROOT} >>${LOG_DIR}/env-setup.log 2>&1

bitbake azure-sphere-core -c populate_sdk

