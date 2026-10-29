#!/bin/bash
set -e

rm -rf ./build && mkdir ./build && cd build

export STAGING_DIR=/opt/sdk/ql_crosstools/ql-ol-extsdk-ag35cetdar01a07m4g_ocpu/ql-sysroots

SYSROOT="/opt/sdk/ql_crosstools/ql-ol-extsdk-ag35cetdar01a07m4g_ocpu/ql-sysroots"
CROSS_PREFIX="/opt/sdk/ql_crosstools/ql-ag35-1806e-gcc-8.4.0-glibc-v1-toolchain/bin/arm-openwrt-linux-gnueabi-"

../configure \
CC="${CROSS_PREFIX}gcc --sysroot=${SYSROOT}" \
CXX="${CROSS_PREFIX}g++ --sysroot=${SYSROOT}" \
AR=${CROSS_PREFIX}ar \
RANLIB=${CROSS_PREFIX}ranlib \
--host=arm-openwrt-linux-gnueabi \
--prefix=$(pwd)/install \

make -j$(nproc)
