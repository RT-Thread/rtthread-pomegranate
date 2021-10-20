# run rt-thread as a simple os

ROOT=$(pwd)/..

${ROOT}/qemu/qemu-6.1.0/build/riscv64-softmmu/qemu-system-riscv64 -nographic -smp 8 -machine virt -m 256M -kernel qemu-riscv64-virt/rtthread.bin
