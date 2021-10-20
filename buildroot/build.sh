#!/bin/bash

ROOT=$(pwd)/..
OUTPUT=${ROOT}/output/

if [  ! -d  ${OUTPUT}     ]
then
	mkdir -p ${OUTPUT}
fi

if [  -d rootfs ]
then
	echo "Clean up"
	rm -rf rootfs
fi

tar jxf rootfs.tmp.tbz

make_ext4fs -l 100M ${OUTPUT}/rootfs.ext4 rootfs

echo "Finished making root file system"
