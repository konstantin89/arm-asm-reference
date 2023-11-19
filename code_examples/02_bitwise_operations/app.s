.global _start

.equ EXIT_SYS_NUMBER, 1

_start:
    
    MOV R0, #0x5       // 0b 0101
    MOV R1, #0xa       // 0b 1010

    // AND operation
    AND R2, R0, R1   // R2 = 0101 & 1010 = 0

    // Perform AND and modify flags with answer
    ANDS R2, R0, R1   // R2 = 0101 & 1010 = 0

    // OR operation
    ORR R2, R0, R1   // R2 = 0101 | 1010 = 1111

    // XOR operation
    EOR R2, R0, R1   // R2 = 0101 ^ 1010 = 1111    

    // Bitwise NOT operation
    MVN R2, R0   // R2 = ~0x00000005 = 0xfffffffa 

_exit:
    // Set exit code
    MOV R0, #0
    mov R7,#EXIT_SYS_NUMBER
    swi 0


