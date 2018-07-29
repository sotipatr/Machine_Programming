MICRO
c    BRA  BIN  CON I[2:0] I[5:3] I[8:6] A    B    DD  CS
c BOOTSTRAP
m00 xxxxx 000  xxx 111    000    011   xxxx 0011  xx  x111010111
m01 xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx

c LDA $K,X 
m02 xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC, MAR
m03 xxxxx 000  xxx 101    000    001  0100 xxxx 00 xx11011101 x+MDR->NOP, MAR
m04 xxxxx 000  xxx 111    000    011  xxxx 0101 00 xx10011101 MDR+0->ACC
m05 xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC, MAR
m06 xxxxx 000  xxx xxx    xxx    001  xxxx xxxx xx xx1000xxxx NEXT(PC)
c LDX #K
m07 xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC, MAR
m08 xxxxx 000  xxx 111    000    011  xxxx 0100 00 xx10011101 MDR+0->X  
m09 xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC, MAR
m0a xxxxx 000  xxx xxx    xxx    001  xxxx xxxx xx xx1000xxxx NEXT(PC)
c INX
m0b xxxxx 000  xxx 101    000    011  0100 0100 01 x110011110 x+1->x
m0c xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC, MAR
m0d xxxxx 000  xxx xxx    xxx    001  xxxx xxxx xx xx1000xxxx NEXT(PC)
c CMPX,#Y
m0e xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC, MAR
m0f xxxxx 000  xxx 101    001    001  0100 xxxx 00 xx10111101 MDR-X->NOP,MSTATUS
m10 xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC, MAR
m11 xxxxx 000  xxx xxx    xxx    001  xxxx xxxx xx xx1000xxxx NEXT(PC)
c STA $K,X
m12 xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC, MAR
m13 xxxxx 000  xxx 101    000    001  0100 xxxx 00 xx11011101 MDR+X->NOP,MAR
m14 xxxxx 000  xxx 100    000    001  0101 xxxx 00 xx00011111 ACC+0->NOP,MWE
m15 xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC,MAR
m16 xxxxx 000  xxx xxx    xxx    001  xxxx xxxx xx xx1000xxxx NEXT(PC)
c ADC $K,X
m17 xxxxx 000  xxx 101    000  011  0011 0011 01 x111011110 PC+1->PC, MAR
m18 xxxxx 000 xxx  101    000  001  0100 xxxx 00 xx11011101 MDR+X->NOP,MAR
m19 xxxxx 000 xxx  101    000  011  0101 0101 00 x110011001 ACC+MDR->ACC,CARRYE~
m1a xxxxx 000  xxx 101    000  011  0011 0011 01 x111011110 PC+1->PC, MAR
m1b xxxxx 000 xxx  xxx    xxx  001  xxxx xxxx xx xx1000xxxx NEXT(PC)
c CRC
m1c xxxxx 000  xxx 111    000  001  xxxx xxxx 00 xx10111110 0+0->NOP,MSTATUS
m1d xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC, MAR
m1e xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx NEXT(PC)
c BRNZ $K
m1f 00011 011  011 101 000 011 0011 0011 01 1111011110 PC+1->PC, MAR,BRZ
m20 xxxxx 000  xxx 111 000 011 xxxx 0011 00 x110011101 MDR+0->PC
m21 xxxxx 000  xxx 101 001 011 0011 0011 01 x110011110 PC-1->PC
m22 xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC, MAR
m23 xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx NEXT(PC)
c SHLA
m24 xxxxx 000 xxx 100  000  111  0101 0101 00 0110011111 ACC+0->SRAMU
m25 xxxxx 000  xxx 101    000    011  0011 0011 01 x111011110 PC+1->PC, MARR
m26 xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx NEXT(PC)
c HALT
m27 xxxxx 000  xxx xxx    xxx    001   xxxx xxxx  xx  xx1000xxxx NEXT(PC)
MAIN
m00 01 //LDX #k
m01 20
m02 00 //LDA $0, X
m03 00
m04 08 //SHLA
m05 06 //crc
m06 05 //adc $8, x
m07 08
m08 04 //sta $16, x
m09 10
m0a 02 //inx
m0b 03 //cmp &(z[0])+8
m0c 28
m0d 07 //brnz 02
m0e 02
m0f 09 //halt
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

m1a 00
m1b 00
m1c 00
m1d 00
m1e 00
m1f 00
m20 01 //z0

m21 02

m22 03

m23 04

m24 05

m25 06

m26 07

m27 08

m28 02 //y0

m29 03

m2a 04

m2b 05

m2c 06

m2d 07

m2e 08

m2f 09

m30 00

m31 00

m32 00

m33 00

m34 00

m35 00

m36 00
m37 00
MAPPER
m00 02
m01 07
m02 0b
m03 0e
m04 12
m05 17
m06 1c
m07 1f
m08 24
m09 27
