#!/bin/bash

ROOT=$(pwd)
UBOOT="u-boot-2021.04"
LINUX="linux-5.12.3"
QEMU="qemu-6.1.0"

if [  ! -d "${ROOT}/tarball"  ]
then
	mkdir ${ROOT}/tarball
else
	rm ${ROOT}/tarball/*
fi

if [  ! -f "${ROOT}/tarball/${UBOOT}.tar.bz2"  ]
then
	echo "Downloading ${UBOOT}"
	wget -P ${ROOT}/tarball -c https://ftp.denx.de/pub/u-boot/${UBOOT}.tar.bz2
fi

if [  ! -f "${ROOT}/tarball/${LINUX}.tar.xz"  ]
then
	echo "Downloading ${LINUX}"
	wget -P ${ROOT}/tarball -c https://cdn.kernel.org/pub/linux/kernel/v5.x/${LINUX}.tar.xz
fi

if [  ! -f "${ROOT}/tarball/${QEMU}.tar.xz"  ]
then
	echo "Downloading ${QEMU}"
	wget -P ${ROOT}/tarball -c https://download.qemu.org/${QEMU}.tar.xz
fi

echo "Finish download"
