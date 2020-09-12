
            .global main

main:
          LDR      R0,=A
          MOV      R1,#5
          STR      R1,[R0]   ; Store R1 in the memory region allocated by A.

          LDR      R0,=D
          MOV      R1,#4
          STR      R1,[R0]

          LDR      R0,=C
          MOV      R1,#200
          STR      R1,[R0]

          MOV       R7,#1
          SVC       0         ; Return control back to operating system



            .data
 A:         .space      4
 D:         .space      4
 C:         .space      4
            .align
            .end
