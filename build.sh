#!/bin/bash

# export PATH="/home/luckyzyx/toolchains/neutron-clang/bin:$PATH"
export PATH="/home/luckyzyx/toolchains/llvm-r399163b/clang-r383902b/bin:$PATH"

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

# make clean && make mrproper

# CONFIG_SECTION_MISMATCH_WARN_ONLY=y

echo > build_config.log
echo > build_kernel.log

make $args sm8350_defconfig | tee build_config.log

make $args | tee build_kernel.log


