#!/bin/bash
# run linux in qemu

ROOT=$(pwd)/..
QEMU_RUNTIME=${ROOT}/output/qemu/bin/qemu-system-riscv64
if [  ! -f ${QEMU_RUNTIME}]
then
	echo "You have to build qemu first!!!"
	exit
fi

${QEMU_RUNTIME} -nographic -smp 2 -machine virt -m 512M -kernel linux-5.12.3/arch/riscv/boot/Image -drive file=r${ROOT}/output/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
