MICRO
c acc=05=0101, br=06=0110, lr=07=0111, sp=08=1000, TEMP=09=1001
c    BRA  BIN  CON I[2:0] I[5:3] I[8:6] A    B    DD  CS
c BOOTSTRAP
m00 xxxxx 000  xxx 111    000    011   xxxx 0011  xx  x111010111
m01 xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx
c LOADBR #K
m02 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m03 xxxxx 000  xxx 111    000    011    xxxx 0110 xx  x110011101 MDR+0->BR  
m04 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m05 xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx NEXT(PC)
c LOADSP #K
m06 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m07 00000 000  xxx 111    000    011    xxxx 1000 xx  x110011101 MDR+0->SP  
m08 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m09 xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx NEXT(PC)
c LOADLR #K
m0a xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m0b 00000 000  xxx 111    000    011    xxxx 0111 xx  x110011101 MDR+0->LR  
m0c xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m0d xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx NEXT(PC)
c PUSH $K
m0e xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m0f 00110 011  111 001    001    001    0111 1000 xx  xx10011111 LR-SP->NOP
m10 xxxxx 000  xxx 101    001    011    1000 1000 01  x110011110 SP-1->SP
m11 xxxxx 000  xxx 111    000    001    xxxx xxxx xx  xx11011101 MDR+0->NOP,MAR
m12 xxxxx 000  xxx 111    000    011    xxxx 0101 xx  x110011101 MDR+0->ACC
m13 xxxxx 000  xxx 100    000    001    1000 xxxx xx  xx11011111 SP+0->NOP,MAR
m14 xxxxx 000  xxx 100    000    001    0101 xxxx xx  xx00011111 ACC+0->NOP,MWE
m15 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m16 xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx NEXT(PC)
c POP $K
m17 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m18 xxxxx 000  xxx 101    000    011    0110 0101 01  x110011110 BR+1->ACC
m19 01000 011  111 001    001    001    0101 1000 xx  xx10011111 ACC-SP->NOP
m1a xxxxx 000  xxx 111    000    011    xxxx 0101 xx  x110011101 MDR+0->ACC
m1b xxxxx 000  xxx 100    000    001    1000 xxxx xx  xx11011111 SP+0->NOP,MAR=>MDR=8
m1c xxxxx 000  xxx 111    000    011    xxxx 1001 xx  x110011101 MDR+0->TEMP
m1d xxxxx 000  xxx 111    000    001    xxxx xxxx 00  xx00011110 0+0->nop, mwe
m1e xxxxx 000  xxx 100    000    001    0101 xxxx xx  xx11011111 ACC+0->NOP,MAR
m1f xxxxx 000  xxx 100    000    001    1001 xxxx xx  xx00011111 TEMP+0->NOP,MWE
m20 xxxxx 000  xxx 101    000    011    1000 1000 01  x110011110 SP+1->SP
m21 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m22 xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx NEXT(PC)
c ADD
m23 xxxxx 000  xxx 100    000    011    0110 0101 xx  x110011111 BR+0->ACC
m24 xxxxx 000  xxx 001    001    011    1000 0101 xx  x110011111 ACC-SP->ACC 
m25 01000 011  010 101    001    001    0101 xxxx 01  xx10111110 ACC-1->NOP,BRN(NEG) 
m26 xxxxx 000  xxx 100    000    001    1000 xxxx xx  xx11011111 SP+0->NOP,MAR
m27 xxxxx 000  xxx 111    000    011    xxxx 0101 xx  x110011101 MDR+0->ACC
m28 xxxxx 000  xxx 111    000    001    xxxx xxxx 00  xx00011110 0+0->nop, mwe
m29 xxxxx 000  xxx 101    000    011    1000 1000 01  x110011110 SP+1->SP
m2a xxxxx 000  xxx 100    000    001    1000 xxxx xx  xx11011111 SP+0->NOP,MAR
m2b xxxxx 000  xxx 101    000    011    0101 0101 xx  x110011101 MDR+ACC->ACC
m2c xxxxx 000  xxx 100    000    001    0101 xxxx xx  xx00011111 ACC+0->NOP,MWE
m2d xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m2e xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx NEXT(PC)
c SUB
m2f xxxxx 000  xxx 100    000    011    0110 0101 xx  x110011111 BR+0->ACC
m30 xxxxx 000  xxx 001    001    011    1000 0101 xx  x110011111 ACC-SP->ACC 
m31 01000 011  010 101    001    001    0101 xxxx 01  xx10111110 ACC-1->NOP,BRN(NEG) 
m32 xxxxx 000  xxx 100    000    001    1000 xxxx xx  xx11011111 SP+0->NOP,MAR
m33 xxxxx 000  xxx 111    000    011    xxxx 0101 xx  x110011101 MDR+0->ACC
m34 xxxxx 000  xxx 111    000    001    xxxx xxxx 00  xx00011110 0+0->nop, mwe
m35 xxxxx 000  xxx 101    000    011    1000 1000 01  x110011110 SP+1->SP
m36 xxxxx 000  xxx 100    000    001    1000 xxxx xx  xx11011111 SP+0->NOP,MAR
m37 xxxxx 000  xxx 101    001    011    0101 0101 xx  x110011101 ACC-MDR->ACC   
m38 xxxxx 000  xxx 100    000    001    0101 xxxx xx  xx00011111 ACC+0->NOP,MWE
m39 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m3a xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx NEXT(PC)
MAIN
m00 00 //LOADBR #K1
m01 27
m02 02 //LOADLR #K2
m03 20
m04 01 //LOADSP #K1+1
m05 28
m06 03 //PUSH Y
m07 1b
m08 03 //PUSH X
m09 1a
m0a 06 //SUB
m0b 03 //PUSH Z
m0c 1c
m0d 05 //ADD
m0e 04 //POP W
m0f 1d
m10 00
m11 00
m12 00
m13 00
m14 00
m15 00
m16 00
m17 00
m18 00
m19 00
m1a 10 //x
m1b 05 //y
m1c 02 //z
m1d 00 //w
m1e 00
m1f 00
m20 00 //LR
m21 00
m22 00
m23 00
m24 00
m25 00
m26 00
m27 00 //BR
m28 00 
MAPPER
m00 02
m01 06
m02 0a
m03 0e
m04 17
m05 23
m06 2f