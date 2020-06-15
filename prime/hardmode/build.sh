#!/bin/bash -xe

mkdir -p build

#export DEVKITPPC="/Users/pwootage/projects/riscv-test/prefix"

${DEVKITPPC}/bin/powerpc-eabi-as -mregnames -o build/hardmode.o hardmode.s
${DEVKITPPC}/bin/powerpc-eabi-ld -e 0 --oformat binary -o build/hardmode.bin build/hardmode.o
# gnu od lmao
hexdump build/hardmode.bin
god -tx4 -v -w8 -An --endian=big build/hardmode.bin > build/hardmode.hex

#cat time.txt | sed -e 's|;.*||g' -e 's| *$||g' -e 's|^ *||g' > time.ini
