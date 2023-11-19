.global _start

.equ EXIT_SYS_NUMBER, 1

_start:
    
    MOV R0, #0x2

    // Logical right shift (R1 = (R0 >> 1))
    LSR  R1, R0, #1 

    // Logical left shift  (R1 = (R0 << 1))
    LSL  R1, R0, #1

    // Arithmetic right shift (R1 = (R0 >> 1))
    ASR R1, R0, #1

    // Rotate right
    ROR  R1, R0, #1

    // There is no rotate left varaint
    // But for 8 bit number, ROL(3) == ROR(8-3)

_exit:
    // Set exit code
    MOV R0, #0
    mov R7,#EXIT_SYS_NUMBER
    swi 0


