#!/bin/bash

ROOT=$(pwd)/..
UBOOT="u-boot-2021.04"
CPU=$(cat /proc/cpuinfo| grep "processor"| wc -l)
OUTPUT=${ROOT}/output

if [  ! -d  ${OUTPUT}   ]
then
	mkdir -p ${OUTPUT}
fi

if [  -d ${ROOT}/u-boot/${UBOOT}    ]
then
	echo "Clean up"
	rm -rf ${ROOT}/u-boot/${UBOOT}
fi

tar xf ${ROOT}/tarball/${UBOOT}.tar.bz2 -C .
cd ${UBOOT}
for f in `ls ../patches/${UBOOT}/*.patch`; do patch -p1 < $f; done
make qemu-riscv64_smode_defconfig
make ARCH=riscv CROSS_COMPILE=${ROOT}/toolchains/riscv64--glibc--bleeding-edge-2020.08-1/bin/riscv64-linux- -j${CPU}

cp ${ROOT}/u-boot/${UBOOT}/u-boot.bin ${OUTPUT}
echo "Finished build ${UBOOT}"
cd ${ROOT}
