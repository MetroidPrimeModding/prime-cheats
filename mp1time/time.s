.section .text
.globl start



start:
# this is inserted to 0x80026DB0


code:
# this is needed at the destination
addi r3, r3, 0x167

# 0x805a8c40 = g_GameState
lis r6, 0x805a
ori r6, r6, 0x8c40
lwz r6, 0(r6)

# cgamestate + 0xa0 = igt
lfd f0, 0xA0(r6) # f0 = igt

lis r6, 0x4270 # floating point 60
# 580 is our scratch that's overwritten further down in this method
stw r6, -8(r1)
lfs f1, -8(r1)
fmul f0, f0, f1
fctiwz f0, f0
stfd f0, -8(r1)
lwz r6, -4(r1)

# R6 is our frame count
# First, find seconds
li r7, 60
divw r5, r6, r7
# then how many frames those seconds are
mulli r7, r5, 60
# then subtract from r6
subf r6, r7, r6

# then minutes
li r7, 60
divw r4, r5, r7
# then how many seconds those minutes are
mulli r7, r4, 60
# then subtract that from r5
subf r5, r7, r5

# done!
# nop
.word 0x00000000
