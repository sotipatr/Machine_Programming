MICRO
c X=0100 ACC=0101 R1=0110 R2=0111 R3=1010 TEMP=1000 Y=1001
c    BRA  BIN  CON I[2:0] I[5:3] I[8:6] A    B    DD  CS
c BOOTSTRAP
m00 xxxxx 000  xxx 111    000    011    xxxx 0011 xx  x111010111 SW+0->PC,MAR
m01 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c LOAD ,R $K
m02 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m03 xxxxx 000  xxx 111    000    011    xxxx 0100 xx  x110011101 MDR+0->X
m04 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m05 xxxxx 000  xxx 100    000    001    0100 xxxx xx  xx1001x1xx X+0->NOP 
m06 xxxxx 000  xxx 111    000    011    xxxx xxxx xx  x010011101 MDR+0->BPORT
m07 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m08 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c VEM R1, R2, R3
m09 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m0a xxxxx 000  xxx 111    000    001    xxxx xxxx xx  xx10011101 MDR+0->NOP
m0b xxxxx 000  xxx 011    000    000    xxxx xxxx xx  x01001x1xx BPORT+0->QREG
m0c xxxxx 000  xxx 010    000    011    xxxx 0100 xx  x11001x1xx QREG+0->X
m0d xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m0e xxxxx 000  xxx 111    000    001    xxxx xxxx xx  xx10011101 MDR+0->NOP
m0f xxxxx 000  xxx 011    000    000    xxxx xxxx xx  x01001x1xx BPORT+0->QREG
m10 xxxxx 000  xxx 010    000    011    xxxx 1001 xx  x11001x1xx QREG+0->Y
m11 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m12 xxxxx 000  xxx 111    000    001    xxxx xxxx xx  xx10011101 MDR+0->NOP
m13 xxxxx 000  xxx 011    000    000    xxxx xxxx xx  x01001x1xx BPORT+0->QREG
m14 xxxxx 000  xxx 111    000    011    xxxx 1000 00  x110011110 0+0->TEMP
m15 00101 100  xxx xxx    xxx    000    xxxx xxxx xx  xx1001xxxx  JSR +5                                         
m16 00010 011  011 xxx    xxx    000    xxxx xxxx xx  xx1001xxxx BRZ +2
m17 11110 010  xxx xxx    xxx    000    xxxx xxxx xx  xx1001xxxx JUMP -2
m18 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m19 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c vector move
m1a xxxxx 000  xxx 100    000    001    0100 xxxx xx  xx1001x1xx X+0->NOP, MAR
m1b xxxxx 000  xxx 111    000    011    xxxx 0101 xx  x110011101 MDR+0->ACC
m1c xxxxx 000  xxx 100    000    001    1001 xxxx xx  xx1101x1xx Y+0->NOP, MAR
m1d xxxxx 000  xxx 100    000    001    0101 xxxx xx  xx0001x1xx ACC+0->NOP, ~MWE
m1e xxxxx 000  xxx 101    000    011    0100 0100 01  x110011110 X+1->X
m1f xxxxx 000  xxx 101    000    011    1001 1001 01  x110011110 Y+1->Y
m20 xxxxx 000  xxx 101    000    011    1000 1000 01  x110011110 TEMP+1->TEMP
m21 xxxxx 000  xxx 000    001    001    1000 xxxx xx  xx1011x1xx QREG-TEMP->NOP, MSTATUS
m22 xxxxx 110  xxx xxx    xxx    000    xxxx xxxx xx  xx1001xxxx RTS
c VEMINC R1, R2 
m23 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m24 xxxxx 000  xxx 111    000    001    xxxx xxxx xx  xx10011101 MDR+0->NOP
m25 xxxxx 000  xxx 011    000    000    xxxx xxxx xx  x01001x1xx BPORT+0->QREG
m26 xxxxx 000  xxx 010    000    011    xxxx 0100 xx  x11001x1xx QREG+0->X
m27 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m28 xxxxx 000  xxx 111    000    001    xxxx xxxx xx  xx10011101 MDR+0->NOP
m29 xxxxx 000  xxx 011    000    000    xxxx xxxx xx  x01001x1xx BPORT+0->QREG
m2a xxxxx 000  xxx 111    000    011    xxxx 1000 00  x110011110 0+0->TEMP
m2b 00101 100  xxx xxx    xxx    000    xxxx xxxx xx  xx1001xxxx JSR +5                                         
m2c 00010 011  011 xxx    xxx    000    xxxx xxxx xx  xx1001xxxx BRZ +2
m2d 11110 010  xxx xxx    xxx    000    xxxx xxxx xx  xx1001xxxx JUMP -2
m2e xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m2f xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c vector increase 
m30 xxxxx 000  xxx 100    000    001    0100 xxxx xx  xx1001x1xx X+0->NOP, MAR
m31 xxxxx 000  xxx 111    000    011    xxxx 1001 01  x110011110 0+1->Y
m32 xxxxx 000  xxx 101    000    001    1001 xxxx xx  xx00011101 MDR+Y->NOP, MWE
m33 xxxxx 000  xxx 101    000    011    0100 0100 01  x110011110 X+1->X
m34 xxxxx 000  xxx 101    000    011    1000 1000 01  x110011110 TEMP+1->TEMP
m35 xxxxx 000  xxx 000    001    001    1000 xxxx xx  xx1011x1xx QREG-TEMP->NOP, MSTATUS
m36 xxxxx 110  xxx xxx    xxx    000    xxxx xxxx xx  xx1001xxxx RTS
c HALT
m37 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)

MAIN
m00 00 //load R1, 00
m01 06
m02 00
m03 00 //load R2, X
m04 07
m05 11
m06 00 //load R3, 16(10hex)
m07 0a
m08 10
m09 01 //vem R1, R2, R3
m0a 06
m0b 07
m0c 0a
m0d 02 //veminc R2, R3
m0e 07
m0f 0a
m10 03 //halt
m11 00
m12 00
m13 00
m14 00
m15 00
m16 00
m17 00
m18 00
m19 00
m1a 00
m1b 00
m1c 00
m1d 00
m1e 00
m1f 00
m20 00
m21 00

MAPPER
m00 02
m01 09
m02 23
m03 37