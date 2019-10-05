#!/bin/bash

mkdir -p build



${DEVKITPPC}/bin/powerpc-eabi-as -mregnames -o build/time.o time.s
${DEVKITPPC}/bin/powerpc-eabi-ld -e 0 --oformat binary -o build/time.bin build/time.o
# gnu od lmao
god -tx4 -v -w8 -An --endian=big build/time.bin > build/time.hex

cat time.txt | sed -e 's|;.*||g' -e 's| *$||g' -e 's|^ *||g' > time.ini
