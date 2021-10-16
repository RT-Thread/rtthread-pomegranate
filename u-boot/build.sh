ROOT=$(pwd)/..
cd u-boot-2021.04
make qemu-riscv64_smode_defconfig
make ARCH=riscv CROSS_COMPILE=${ROOT}/toolchains/riscv64-linux/bin/riscv64-linux-
cd ..
