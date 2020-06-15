.section .text
.globl start

start:
# this is inserted to 0x800C3244
# Hack CScriptPickup::CScriptPickup to set x25c_amount/r27 = 0 if x258_type/r26 == 26/1A health refill
cmpwi r26, 0x1a
bne end
li r27, 0
end:
stw  r27, 0x25c(r19)
# Reset flags (since we did a compare)
cmplwi     r0,0xffff



