.section .text
.globl start
start:

lis       r4, -0x7FA1
lwz       r4, 0x5088(r4)
rlwinm    r4, r4, 0, 31, 31
cmpwi     r4, 1
bne       end
lis       r4, 0x4150
stw       r4, 0x180(r30)
end:
lfs       f0, -0x5B54(r2)
nop
