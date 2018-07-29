MICRO
c X=0100 Y=0101 R1=0110 R2=0111
c    BRA  BIN  CON I[2:0] I[5:3] I[8:6] A    B    DD  CS
c BOOTSTRAP
m00 00000 000  000 111    000    011   0000 0011  00  0111010111
m01 00000 000  000 000    000    001   0000 0000  00  0010000000
c LOAD ,R $K
m02 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m03 00000 000  000 111    000    011    0000 0100 00  0110011101 MDR+0->X
m04 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m05 00000 000  000 111    000    001    0000 0000 00  0111011101 MDR+0->NOP,MAR
m06 00000 000  000 100    000    001    0100 0000 00  0110011111 X+0->NOP
m07 00000 000  000 111    000    011    0000 0000 00  0010011101 MDR+0->BPORT
m08 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m09 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)
c STORE R, $K
m0a 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m0b 00000 000  000 111    000    011    0000 0100 00  0110011101 MDR+0->X
m0c 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m0d 00000 000  000 111    000    001    0000 0000 00  0111011101 MDR+0->NOP,MAR
m0e 00000 000  000 100    000    001    0100 0000 00  0110011111 X+0->NOP
m0f 00000 000  000 011    000    001    0000 0000 00  0000011111 BPORT+0->NOP, MWE~
m10 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m11 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)
c ADD R1, $K
m12 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m13 00000 000  000 111    000    011    0000 0100 00  0110011101 MDR+0->X
m14 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m15 00000 000  000 111    000    001    0000 0000 00  0111011101 MDR+0->NOP,MAR
m16 00000 000  000 111    000    011    0000 0101 00  0110011101 MDR+0->Y
m17 00000 000  000 100    000    001    0100 0000 00  0110011111 X+0->NOP
m18 00000 000  000 001    000    011    0101 0000 00  0010011111 Y+Bport->bport                                                            
m19 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m1a 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)
c SUB R1, $K
m1b 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m1c 00000 000  000 111    000    011    0000 0100 00  0110011101 MDR+0->X
m1d 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m1e 00000 000  000 111    000    001    0000 0000 00  0111011101 MDR+0->NOP,MAR
m1f 00000 000  000 111    000    011    0000 0101 00  0110011101 MDR+0->Y
m20 00000 000  000 100    000    001    0100 0000 00  0110011111 X+0->NOP
m21 00000 000  000 001    001    011    0101 0000 00  0010011111 bport-Y->bport                                                            
m22 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m23 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)
c ADD R1, R2
m24 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m25 00000 000  000 111    000    011    0000 0100 00  0110011101 MDR+0->X
m26 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m27 00000 000  000 111    000    001    0000 0000 00  0110011101 MDR+0->NOP
m28 00000 000  000 011    000    000    0000 0000 00  0010011111 bport+0->qreg
m29 00000 000  000 010    000    011    0000 0101 00  0110011111 q+0->y
m2a 00000 000  000 100    000    001    0100 0000 00  0110011111 X+0->NOP
m2b 00000 000  000 011    000    000    0000 0000 00  0010011111 bport+0->qreg
m2c 00000 000  000 000    000    011    0101 0101 00  0110011111 y+q->y
m2d 00000 000  000 100    000    001    0100 0000 00  0110011111 X+0->NOP
m2e 00000 000  000 100    000    011    0101 0000 00  0010011111 y+0->bport
m2f 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m30 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)
c SHL, R
m31 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m32 00000 000  000 111    000    011    0000 0100 00  0110011101 MDR+0->X
m33 00000 000  000 100    000    001    0100 0000 00  0110011111 X+0->NOP
m34 00000 000  000 011    000    000    0000 0000 00  0010011111 bport+0->qreg
m35 00000 000  000 100    000    001    0100 0000 00  0110011111 X+0->NOP
m36 00000 000  000 010    000    111    0000 0000 00  0010011111 q+0->SRAMU, bport
m37 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m38 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)
c DEC R
m39 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m3a 00000 000  000 111    000    011    0000 0100 00  0110011101 MDR+0->X
m3b 00000 000  000 100    000    001    0100 0000 00  0110011111 X+0->NOP
m3c 00000 000  000 011    000    000    0000 0000 00  0010011111 bport+0->qreg
m3d 00000 000  000 100    000    001    0100 0000 00  0110011111 X+0->NOP
m3e 00000 000  000 110    001    011    0000 0000 01  0010011110 q-1->bport
m3f 00000 000  000 101    000    011    0011 0011 01  0111011110 PC+1->PC, MAR
m40 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)
c HALT
m41 00000 000  000 000    000    001    0000 0000 00  0010000000 NEXT(PC)
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
m06 39
m07 41