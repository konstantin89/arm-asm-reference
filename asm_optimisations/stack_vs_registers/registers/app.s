.global _start

.equ EXIT_SYS_NUMBER, 1
.equ N, 0xffffffff

COUNTER .req R1
SUM     .req R2

_start:
    
    MOV COUNTER, #N
    MOV SUM, #0

loop:
    SUBS COUNTER, #1          
    ADD SUM, COUNTER 
    BNE loop

_exit:

    // In linux, max exit code is 255
    MOV R0, #0
    mov R7,#EXIT_SYS_NUMBER
    swi 0
