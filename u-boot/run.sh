#!/bin/bash
# run u-boot in qemu

ROOT=$(pwd)/..
QEMU_RUNTIME=${ROOT}/output/qemu/bin/qemu-system-riscv64
if [  ! -f ${QEMU_RUNTIME}]
then
	echo "You have to build qemu first!!!"
	exit
fi

${QEMU_RUNTIME} -nographic -smp 8 -machine virt -m 256M -kernel u-boot-2021.04/u-boot.bin
