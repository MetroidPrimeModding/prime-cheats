#!/bin/bash

mkdir -p build

powerpc-eabi-as -mregnames -o build/moonjump.o moonjump.s
powerpc-eabi-ld -e 0 --oformat binary -o build/moonjump.bin build/moonjump.o
od -tx4 -v -w8 -An --endian=big build/moonjump.bin > build/moonjump.hex
