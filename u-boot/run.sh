# run u-boot in qemu

ROOT=$(pwd)/..

${ROOT}/qemu/qemu-6.1.0/build/riscv64-softmmu/qemu-system-riscv64 -nographic -machine virt -m 256M -kernel u-boot-2021.04/u-boot.bin
