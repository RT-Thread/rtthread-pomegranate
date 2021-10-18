# run u-boot in qemu

ROOT=$(pwd)/..

${ROOT}/qemu/qemu-6.1.0/build/riscv64-softmmu/qemu-system-riscv64 -nographic -smp 8 -machine virt -m 256M -kernel u-boot-2021.04/u-boot.bin
