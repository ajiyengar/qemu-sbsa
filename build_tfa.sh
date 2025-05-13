#!/usr/bin/env bash

# TF-A
#make -C trusted-firmware-a \
#  CROSS_COMPILE=aarch64-none-elf- \
#  OPENSSL_DIR="${HOMEBREW_PREFIX}"/opt/openssl \
#  PLAT=qemu_sbsa \
#  DEBUG=1 \
#  all fip
#
#cp trusted-firmware-a/build/qemu_sbsa/debug/bl1.bin edk2-non-osi/Platform/Qemu/Sbsa/
#cp trusted-firmware-a/build/qemu_sbsa/debug/fip.bin edk2-non-osi/Platform/Qemu/Sbsa/

# UEFI
export PACKAGES_PATH=./edk2:./edk2-platforms:./edk2-non-osi
make -C edk2/BaseTools
. edk2/edksetup.sh

build -b DEBUG -a AARCH64 -t GCC5 -p edk2-platforms/Platform/Qemu/SbsaQemu/SbsaQemu.dsc
