Question:

// mplement a function in ARM assembly that takes an unsigned integer as input and returns 
// the count of set bits (1s) in its binary representation. The catch is to perform this operation 
// with an optimal algorithm using bitwise operations and rotations. 

.global _start

.equ EXIT_SYS_NUMBER, 1

COUNTER .req R0
NUMBER .req R1

_start:

    EOR COUNTER, COUNTER           // set counter to 0
    MOV NUMBER, #13                // 0b 1101

loop:

    ANDS R3, NUMBER, #1            // ANDS modifies flags
    ADDNE COUNTER, COUNTER, #1

    LSRS NUMBER, NUMBER, #1        // NUMBER >> 1 and update flags
    BNE loop

_exit:
    // R0 is COUNTER
    mov R7,#EXIT_SYS_NUMBER
    swi 0


