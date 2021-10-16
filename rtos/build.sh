ROOT=$(pwd)/..
export RTT_EXEC_PATH=${ROOT}/toolchains/riscv64-unknown-elf/bin
export RTT_ROOT=$(pwd)/rt-thread
scons -C qemu-riscv64-virt
