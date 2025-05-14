#!/usr/bin/env bash

# Get the directory of the currently running script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Build TF-A
make -C trusted-firmware-a \
  CROSS_COMPILE=aarch64-none-elf- \
  OPENSSL_DIR="${HOMEBREW_PREFIX}"/opt/openssl \
  QCBOR_DIR="${SCRIPT_DIR}"/qcbor \
  PLAT=qemu_sbsa \
  DEBUG=1 \
  all fip

# Copy build artifacts to edk2-non-osi
cp trusted-firmware-a/build/qemu_sbsa/debug/bl1.bin edk2-non-osi/Platform/Qemu/Sbsa/
cp trusted-firmware-a/build/qemu_sbsa/debug/fip.bin edk2-non-osi/Platform/Qemu/Sbsa/
