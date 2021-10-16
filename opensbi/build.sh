cd opensbi
ROOT=$(pwd)/../..
make CROSS_COMPILE=${ROOT}/toolchains/riscv64-unknown-elf/bin/riscv64-unknown-elf- PLATFORM=generic
cd ..
