
VAL1    .req       R1
VAL2    .req       R2
SUM     .req       R3

                    .global main

main:
                MOV     VAL1,#0x25
                MOV     VAL2,#0x34

                ADD     SUM,VAL1,VAL2

                MOV     R7,#1
                SVC     0

                .end
