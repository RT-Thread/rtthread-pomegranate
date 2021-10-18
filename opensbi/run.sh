# run opensbi in qemu

ROOT=$(pwd)/..

${ROOT}/qemu/qemu-6.1.0/build/riscv64-softmmu/qemu-system-riscv64 -nographic -smp 2 -machine virt -m 256M -bios opensbi/build/platform/generic/firmware/fw_jump.bin
