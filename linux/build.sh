#!/bin/bash

ROOT=$(pwd)/..
LINUX=linux-5.12.3
CPU=$(cat /proc/cpuinfo| grep "processor"| wc -l)
OUTPUT=${ROOT}/output

if [  -d ${ROOT}/linux/${LINUX}  ]
then
	echo "Clean up"
	rm -rf ${ROOT}/linux/${LINUX}
fi

if [  -d ${OUTPUT}/modules ]
then
	rm -rf ${OUTPUT}/modules
fi

if [  ! -d ${OUTPUT}/boot  ]
then
	mkdir -p ${OUTPUT}/boot
fi

tar xf ${ROOT}/tarball/${LINUX}.tar.xz -C .
cd ${LINUX}
for f in `ls ../patches/${LINUX}/*.patch`; do patch -p1 < $f; done
cp ../virt_riscv64_defconfig arch/riscv/configs
cp -a ../rtt arch/riscv/boot/dts
make ARCH=riscv virt_riscv64_defconfig
make ARCH=riscv ARCH=riscv CROSS_COMPILE=${ROOT}/toolchains/riscv64--glibc--bleeding-edge-2020.08-1/bin/riscv64-linux- -j${CPU} Image modules
cp arch/riscv/boot/Image ${OUTPUT}
make ARCH=riscv ARCH=riscv modules_install INSTALL_MOD_PATH=${OUTPUT}/modules

cd ${ROOT}/linux
dtc -I dts -O dtb -o rtt-riscv64-qemu.dtb rtt-riscv64-qemu.dts
cp rtt-riscv64-qemu.dtb ${OUTPUT}/boot
rm rtt-riscv64-qemu.dtb

echo "Finished build linux"
