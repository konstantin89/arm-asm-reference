.global _start

.equ EXIT_SYS_NUMBER, 1
.equ N, 0xffffffff

_start:
    
    // FP-4   counter
    // FP-8   sum

    MOV FP, SP
    SUB SP, SP, #8

    MOV R0, #N
    STR R0, [FP, #-4]   // counter = N

    MOV R0, #0
    STR R0, [FP, #-8]   // sum = 0

loop:

    LDR R0, [FP, #-4]
    LDR R1, [FP, #-8]

    ADD R1, R1, R0
    SUBS R0, #1       

    STR R0, [FP, #-4]
    STR R1, [FP, #-8]

    BNE loop

_exit:

    // In linux, max exit code is 255
    MOV R0, #0
    mov R7,#EXIT_SYS_NUMBER
    swi 0
