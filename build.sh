#!/bin/bash

export PATH="/home/luckyzyx/toolchains/clang-r383902b/bin:$PATH"

# Compiler: Android (6877366 based on r383902b1)
# clang version 11.0.2 (https://android.googlesource.com/toolchain/llvm-project b397f81060ce6d701042b782172ed13bee898b79)

# sudo apt-get install gcc-aarch64-linux-gnu
# sudo apt-get install gcc-arm-linux-gnueabi

args="-j4 \
O=out \
ARCH=arm64 \
CC=clang \
CLANG_TRIPLE=aarch64-linux-gnu- \
CROSS_COMPILE=aarch64-linux-gnu- \
CROSS_COMPILE_COMPAT=arm-linux-gnueabi- \
LLVM=1 \
LLVM_IAS=1 "

# -j$(nproc --all)

# sudo make clean && sudo make mrproper

# CONFIG_SECTION_MISMATCH_WARN_ONLY=y

echo > build_config.log
echo > build_kernel.log

# make $args menuconfig

make $args sm8350_defconfig | tee build_config.log

make $args | tee build_kernel.log


