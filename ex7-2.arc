MICRO
c    BRA  BIN  CON I[2:0] I[5:3] I[8:6] A    B    DD  CS
c A=0101 B=0001 C=0010 D=0110 E=0111 H=1000 L=1001 PC=0011
c BOOTSTRAP
m00 xxxxx 000  xxx 111    000    011    xxxx 0011 xx  x111010111 SW+0->PC,MAR
m01 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c LDA ($K)
m02 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m03 xxxxx 000  xxx 111    000    001    xxxx xxxx 00  xx11011101 MDR+0->NOP,MAR
m04 xxxxx 000  xxx 111    000    011    xxxx 0101 00  x110011101 MDR+0->ACC
m05 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m06 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c STA $K
m07 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m08 xxxxx 000  xxx 111    000    001    xxxx xxxx 00  xx11011101 MDR+0->NOP,MAR
m09 xxxxx 000  xxx 100    000    001    0101 xxxx 00  xx0001x1xx ACC+0->NOP,MWE
m0a xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC,MAR
m0b xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c MVI R,#K
m0c xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m0d xxxxx 000  xxx 111    000    000    xxxx xxxx 00  x110011101 MDR+0->QREG
m0e xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m0f xxxxx 000  xxx 010    000    001    xxxx xxxx 00  x11001x1xx QREG+0->NOP
m10 xxxxx 000  xxx 111    000    011    xxxx xxxx 00  x010011101 MDR+0->BPORT
m11 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m12 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c MOV R1, R2
m13 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m14 xxxxx 000  xxx 111    000    011    xxxx 0001 00  x110011101 MDR+0->B
m15 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m16 xxxxx 000  xxx 111    000    001    xxxx xxxx 00  x110011101 MDR+0->NOP
m17 xxxxx 000  xxx 011    000    000    xxxx xxxx 00  x01001x1xx BPORT+0->QREG
m18 xxxxx 000  xxx 100    000    001    0001 xxxx 00  x11001x1xx B+0->NOP
m19 xxxxx 000  xxx 010    000    011    xxxx xxxx 00  x01001x1xx QREG+0->BPORT
m1a xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m1b xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c MOV R, M
m1c xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m1d xxxxx 000  xxx 111    000    000    xxxx xxxx 00  x110011101 MDR+0->QREG
m1e xxxxx 000  xxx 100    000    001    1001 xxxx 00  x11101x1xx L+0->NOP, MAR
m1f xxxxx 000  xxx 010    000    001    xxxx xxxx 00  x11001x1xx QREG+0->NOP
m20 xxxxx 000  xxx 111    000    011    xxxx xxxx 00  x010011101 MDR+0->BPORT
m21 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m22 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c MOV M, R
m23 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m24 xxxxx 000  xxx 111    000    000    0000 0000 00  x110011101 MDR+0->QREG
m25 xxxxx 000  xxx 100    000    001    1001 0000 00  x11101x1xx L+0->NOP, MAR
m26 xxxxx 000  xxx 010    000    001    0000 0000 00  x11001x1xx QREG+0->NOP
m27 xxxxx 000  xxx 011    000    001    0000 0000 00  x00001x1xx BPORT+0->NOP, MWE~
m28 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m29 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c INR R
m2a xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m2b xxxxx 000  xxx 111    000    001    xxxx xxxx 00  x110011101 MDR+0->NOP
m2c xxxxx 000  xxx 011    000    000    xxxx xxxx 00  x01001x1xx BPORT+0->QREG
m2d xxxxx 000  xxx 111    000    001    xxxx xxxx 00  x110011101 MDR+0->NOP
m2e xxxxx 000  xxx 110    000    011    xxxx xxxx 01  x010011110 QREG+1->BPORT
m2f xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m30 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c INX RP
m31 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m32 xxxxx 000  xxx 111    000    000    xxxx xxxx 00  x110011101 MDR+0->QREG
m33 xxxxx 000  xxx 111    000    011    0000 0101 01  x110011110 1+0->A
m34 xxxxx 000  xxx 010    000    001    xxxx xxxx 00  x11001x1xx QREG+0->NOP
m35 xxxxx 000  xxx 001    000    011    0101 xxxx 00  x01011x1xx A+BPORT->BPORT, MSTATUS
m36 xxxxx 000  xxx 110    001    000    xxxx xxxx 01  x110011110 QREG-1->QREG
m37 xxxxx 000  xxx 010    000    001    xxxx xxxx 00  x11001x1xx QREG+0->NOP
m38 xxxxx 000  xxx 011    000    011    xxxx xxxx 00  x01001x0xx BPORT+0->BPORT, CARREY~
m39 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m3a xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c DCR R
m3b xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m3c xxxxx 000  xxx 111    000    001    xxxx xxxx 00  x110011101 MDR+0->NOP
m3d xxxxx 000  xxx 011    000    000    xxxx xxxx 00  x01001x1xx BPORT+0->QREG
m3e xxxxx 000  xxx 111    000    001    xxxx xxxx 00  x110011101 MDR+0->NOP
m3f xxxxx 000  xxx 110    001    011    xxxx xxxx 01  x010011110 QREG-1->BPORT
m40 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m41 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c DCX RP
m42 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m43 xxxxx 000  xxx 111    000    000    xxxx xxxx 00  x110011101 MDR+0->QREG
m44 xxxxx 000  xxx 111    000    011    xxxx 0101 01  x110011110 1+0->A
m45 xxxxx 000  xxx 010    000    001    xxxx xxxx 00  x11001x1xx QREG+0->NOP
m46 xxxxx 000  xxx 001    001    011    0101 xxxx 00  x01011x1xx BPORT-A->BPORT, MSTATUS
m47 xxxxx 000  xxx 110    001    000    xxxx xxxx 01  x110011110 QREG-1->QREG
m48 xxxxx 000  xxx 010    000    001    xxxx xxxx 00  x11001x1xx QREG+0->NOP
m49 xxxxx 000  xxx 001    001    011    0101 xxxx 00  x01001x0xx BPORT-A->BPORT, CARREY~
m4a xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m4b xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c CMP R
m4c xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m4d xxxxx 000  xxx 111    000    001    xxxx xxxx 00  x110011101 MDR+0->NOP
m4e xxxxx 000  xxx 011    000    000    xxxx xxxx 00  x01001x1xx BPORT+0->QREG
m4f xxxxx 000  xxx 000    010    011    0101 0010 00  x110111111 A-QREG->C, MSTATUS
m50 xxxxx 000  xxx 100    000    111    0010 0010 00  0110111111 C+0->SRAMU, MSTAT0111US
m51 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m52 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c CMP M
m53 xxxxx 000  xxx 100    000    001    1001 xxxx 00  x11101x1xx L+0->NOP, MAR
m54 xxxxx 000  xxx 101    010    011    0101 0010 00  x110111101 MDR-A->C,MSTATUS
m55 xxxxx 000  xxx 100    000    111    0010 0010 00  0110111111 C+0->SRAMU, MSTATUS
m56 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m57 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c CPI,#K
m58 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m59 xxxxx 000  000 101    001    011    0101 0010 00  x110111101 A-MDR->C,MSTATUS
m5a xxxxx 000  000 100    000    111    0010 0010 00  0110111111 C+0->SRAMU, MSTATUS
m5b xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m5c xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c JZ $K
m5d xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m5e xxxxx 000  xxx 100    000    011    0011 0111 00  x110011101 PC+0->E
m5f xxxxx 000  xxx 111    000    011    xxxx 0011 00  x111011101 MDR+0->PC, MAR
m60 00011 011  011 000    000    000    xxxx xxxx 00  x11001x1xx BRZ +3(macrozero)
m61 xxxxx 000  xxx 100    000    011    0111 0011 00  x111011101 E+0->PC, MAR
m62 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m63 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c JNZ $K
m64 00011 011  011 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR,BRZ
m65 xxxxx 000  xxx 111    000    011    xxxx 0011 00  x110011101 MDR+0->PC
m66 xxxxx 000  xxx 101    001    011    0011 0011 01  x110011110 PC-1->PC
m67 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC,MAR
m68 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c JC $K
m69 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m6a xxxxx 000  xxx 100    000    011    0011 0111 00  x110011101 PC+0->E
m6b xxxxx 000  xxx 111    000    011    xxxx 0011 00  x111011101 MDR+0->PC, MAR
m6c 00011 011  xxx 000    000    000    xxxx xxxx 00  x11001x1xx BRC +3 (macrocarry)
m6d xxxxx 000  xxx 100    000    011    0111 0011 00  x111011101 E+0->PC, MAR
m6e xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m6f xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c JNC $K
m70 00011 011  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR,BRC
m71 xxxxx 000  xxx 111    000    011    xxxx 0011 00  x111011101 MDR+0->PC, MAR
m72 xxxxx 000  xxx 101    001    011    0011 0011 01  x111011110 PC-1->PC, MAR
m73 xxxxx 000  xxx 101    000    011    0011 0011 01  x111011110 PC+1->PC, MAR
m74 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
c HALT
m75 xxxxx 000  xxx xxx    xxx    001    xxxx xxxx xx  xx1000xxxx NEXT(PC)
MAIN
m00 02 //MVI L, #(X-1)
m01 09
m02 3f 
m03 04 //MOV A, M
m04 05
m05 02 //MVI D, #FF
m06 06
m07 ff
m08 0c //CPI #09
m09 09
m0a 10 //JNC $(MVI L, #(Y+1))
m0b 16
m0c 06 //INR L
m0d 09
m0e 0a // COMP E
m0f 07
m10 06 //INR E
m11 07
m12 0e //JNZ $(INR L)
m13 0c
m14 04 //MOV D, M
m15 06
m16 02 //MVI L, #(Y+1)
m17 09
m18 4a
m19 05 //MOV M, D
m1a 06
m1b 11 //halt
m3f 03 //x-1
m40 00 //x
m41 01 
m42 04
m43 09 
m44 16
m45 25
m46 36
m47 49
m48 64
m49 81 //y
m4a 00 //y+1
MAPPER
m00 02
m01 07
m02 0c
m03 13
m04 1c
m05 23
m06 2a
m07 31
m08 3b 
m09 42
m0a 4c
m0b 53
m0c 58
m0d 5d
m0e 64
m0f 69
m10 70
m11 75
