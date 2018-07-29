MICRO
c X=0100 ACC=0101 R1=0110 R2=0111
c    BRA  BIN  CON I[2:0] I[5:3] I[8:6] A    B    DD  CS
c BOOTSTRAP
m00 xxxxx 000  xxx 111    000    011    xxxx 0011 xx  x111010111 SW+0->PC,MAR
m01 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c LOAD ,R $K
m02 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m03 xxxxx 000  xxx 111    000    011    xxxx 0100 XX  x110011101 MDR+0->X
m04 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m05 xxxxx 000  xxx 111    000    001    xxxx xxxx XX  xx11011101 MDR+0->NOP,MAR
m06 xxxxx 000  xxx 100    000    001    0100 xxxx XX  xx10011111 X+0->NOP
m07 xxxxx 000  xxx 111    000    011    xxxx xxxx XX  x010011101 MDR+0->BPORT
m08 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m09 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c STORE R, $K
m0a xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m0b xxxxx 000  xxx 111    000    011    xxxx 0100 XX  x110011101 MDR+0->X
m0c xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m0d xxxxx 000  xxx 111    000    001    xxxx xxxx XX  xx11011101 MDR+0->NOP,MAR
m0e xxxxx 000  xxx 100    000    001    0100 xxxx XX  xx10011111 X+0->NOP
m0f xxxxx 000  xxx 011    000    001    xxxx xxxx XX  x000011111 BPORT+0->NOP, MWE~
m10 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m11 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c ADD R1, $K
m12 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m13 xxxxx 000  xxx 111    000    011    xxxx 0100 XX  x110011101 MDR+0->X
m14 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m15 xxxxx 000  xxx 111    000    001    xxxx xxxx XX  xx11011101 MDR+0->NOP,MAR
m16 xxxxx 000  xxx 111    000    011    xxxx 0101 XX  x110011101 MDR+0->ACC
m17 xxxxx 000  xxx 100    000    001    0100 xxxx XX  xx10011111 X+0->NOP
m18 xxxxx 000  xxx 001    000    011    0101 xxxx XX  x010011111 ACC+BPORT->BPORT                                                            
m19 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m1a xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c SUB R1, $K
m1b xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m1c xxxxx 000  xxx 111    000    011    xxxx 0100 XX  x110011101 MDR+0->X
m1d xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m1e xxxxx 000  xxx 111    000    001    xxxx xxxx XX  xx11011101 MDR+0->NOP,MAR
m1f xxxxx 000  xxx 111    000    011    0000 0101 XX  x110011101 MDR+0->ACC
m20 xxxxx 000  xxx 100    000    001    0100 xxxx XX  xx10011111 X+0->NOP
m21 xxxxx 000  xxx 001    001    011    0101 xxxx XX  x010011111 BPORT-ACC->BPORT                                                            
m22 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m23 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c ADD R1, R2
m24 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m25 xxxxx 000  xxx 111    000    011    xxxx 0100 XX  x110011101 MDR+0->X
m26 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m27 xxxxx 000  xxx 111    000    001    xxxx xxxx XX  xx10011101 MDR+0->NOP
m28 xxxxx 000  xxx 011    000    000    xxxx xxxx XX  x010011111 BPORT+0->QREG
m29 xxxxx 000  xxx 010    000    011    xxxx 0101 XX  x110011111 QREG+0->ACC
m2a xxxxx 000  xxx 100    000    001    0100 xxxx XX  xx10011111 X+0->NOP
m2b xxxxx 000  xxx 011    000    000    xxxx xxxx XX  x010011111 BPORT+0->QREG
m2c xxxxx 000  xxx 000    000    011    0101 0101 XX  x110011111 ACC+QREG->ACC
m2d xxxxx 000  xxx 100    000    001    0100 xxxx XX  xx10011111 X+0->NOP
m2e xxxxx 000  xxx 100    000    011    0101 xxxx XX  x010011111 ACC+0->BPORT
m2f xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m30 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c SHL, R
m31 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m32 xxxxx 000  xxx 111    000    001    xxxx xxxx XX  xx10011101 MDR+0->NOP
m33 xxxxx 000  xxx 011    000    000    xxxx xxxx XX  x010011111 BPORT+0->QREG
m34 xxxxx 000  xxx 111    000    001    xxxx xxxx XX  xx10011101 MDR+0->NOP
m35 xxxxx 000  xxx 010    000    111    xxxx xxxx XX  0010011111 QREG+0->SRAMU, BPORT
m36 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m37 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c DEC R
m38 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m39 xxxxx 000  xxx 111    000    001    xxxx xxxx XX  xx10011101 MDR+0->NOP
m3a xxxxx 000  xxx 011    000    000    xxxx xxxx XX  x010011111 BPORT+0->QREG
m3b xxxxx 000  xxx 111    000    001    xxxx xxxx XX  xx10011101 MDR+0->NOP
m3c xxxxx 000  xxx 110    001    011    xxxx xxxx 01  X010011110 QREG-1->BPORT
m3d xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m3e xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c HALT
m3f xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
MAIN
m00 00 //load R1, $X
m01 06
m02 20//x
m03 00//load r2, $y
m04 07
m05 21 //y
m06 04 //add r1, r2
m07 06
m08 07
m09 03 //sub r1, $z
m0a 06
m0b 22 //z
m0c 06 //dec r1
m0d 06
m0e 05 //shl r1
m0f 06
m10 05 //shl r1
m11 06
m12 02 //add r2, $x
m13 07
m14 20 //x
m15 06 //dec r2
m16 07
m17 05 //shl r2
m18 07
m19 04 //add r1, r2
m1a 06
m1b 07
m1c 01 //store r1, $w
m1d 06
m1e 23 //w
m1f 07 //halt
m20 03 //x
m21 02 //y
m22 01 //z
m23 00 //w
MAPPER
m00 02
m01 0a
m02 12
m03 1b
m04 24
m05 31
m06 38
m07 3f