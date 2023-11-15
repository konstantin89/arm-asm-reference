/*
* @brief: This file contains ASM code that demonstrates
*         how to write a basic function with a proper
*         prologue and epilogue
*/

	.global _start

/*
*
* @brief: Function that calculates the Nth term 
*         of arithmetic progression.
*
*         a[n] = a[1] + d*(n-1)
*
* @param: int a[1] - The first element of the progression.
* @param: int d - Common difference.
* @param: int n - Index of the required element.
*
* @returns: int a[n] - Nth term of the progression.
*/
calculate_nth_element:

    // prologue
    STR FP, [SP, #-4]!
    ADD FP, SP, #0
    SUB SP, SP, #16        // Allocate space for another 3 variables on the stack.
    STR R0, [FP, #-8]
    STR R1, [FP, #-12]
    STR R2, [FP, #-16]

    // logic
    LDR R2, [FP, #-8]
    MOV R1, R2             // R1 stores a[n]
    
    LDR R2, [FP, #-12]     // R2 stores d
    LDR R3, [FP, #-16]     // R3 stores n
    
    SUB R3, R3, #1
    
    MUL R0, R2, R3         // d*(n-1)
    
    Add R1, R0, R1         // a[0] + d*(n-1)


    // epilogue

    MOV     R0, R1       // Store the return value in R0
    ADD     SP, FP, #0
    LDR     FP, [SP], #4
    BX      LR
        
_start:
    
    
    MOV R0, #1
    MOV R1, #2
    MOV R2, #3
    
    BL calculate_nth_element
    
_end:

    MOV R0, #0
    MOV R7,#1
    SWI 0


