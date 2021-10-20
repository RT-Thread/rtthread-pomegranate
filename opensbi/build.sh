#!/bin/bash

ROOT=$(pwd)/..
CPU=$(cat /proc/cpuinfo| grep "processor"| wc -l)
OUTPUT=${ROOT}/output/

if [  ! -d  ${OUTPUT}    ]
then
        mkdir -p ${OUTPUT}
fi

if [  -d ${ROOT}/opensbi/opensbi  ]
then
        echo "Clean up"
	cd ${ROOT}/opensbi/opensbi
	git clean -xdf
fi

cd ${ROOT}/opensbi/opensbi
git checkout v0.8
git am ../patches/*.patch
make CROSS_COMPILE=${ROOT}/toolchains/riscv64--glibc--bleeding-edge-2020.08-1/bin/riscv64-linux- PLATFORM=generic -j${CPU}

echo "Finished build opensbi"
cp build/platform/generic/firmware/fw_jump.bin ${OUTPUT}
cd ${ROOT}
