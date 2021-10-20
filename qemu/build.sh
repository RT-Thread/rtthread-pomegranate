#!/bin/bash

ROOT=$(pwd)/..
QEMU="qemu-6.1.0"
CPU=$(cat /proc/cpuinfo| grep "processor"| wc -l)
OUTPUT=${ROOT}/output/qemu

if [  ! -d  ${OUTPUT}  ]
then
	mkdir -p ${OUTPUT}
else
	rm -rf ${OUTPUT}
fi

if [  -d ${ROOT}/qemu/${QEMU}   ]
then
	echo "Clean up"
	rm -rf ${ROOT}/qemu/${QEMU}
fi

tar xf ${ROOT}/tarball/${QEMU}.tar.xz -C .
cd ${QEMU}
for f in `ls ../patches/${QEMU}/*.patch`; do patch -p1 < $f; done
./configure --target-list=riscv32-softmmu,riscv64-softmmu --prefix=${OUTPUT}
make -j${CPU}
make install

echo "Finished building ${QEMU}"
cd ${ROOT}
