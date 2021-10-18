ROOT=$(pwd)/..
cp virt_riscv64_defconfig linux-5.14/arch/riscv/configs
cd linux-5.14
make ARCH=riscv virt_riscv64_defconfig
make ARCH=riscv ARCH=riscv CROSS_COMPILE=${ROOT}/toolchains/riscv64-linux/bin/riscv64-linux- Image modules dtbs
cd ..
