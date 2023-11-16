/*
* @brief: This file contains ASM code that demonstrates
*         how to write a basic function with a proper
*         prologue and epilogue
*/

	.global _start

/*
*
* @brief: Implements e Sum(int x, int y, int z)
*
* @param: int x
* @param: int y
* @param: int z
*
* @returns: x+y+z
*/
sum:

/*

x = fp-8
y = fp-12
z = fp-16

-------------   stack   ----------------
                <--- sp          fp-20
int z                            fp-16
int y                            fp-12
int x                            fp-8
old fp                           fp-4
return addr    <--- fp           fp-0

----------------------------------------
*/
    // Prologue

    str     fp, [sp, #-4]!   // Store FP of previous frame
    add     fp, sp, #0       // Create new frame
    sub     sp, sp, #20      // Allocate 20 bytes on current stack frame

    // Logic
    str     r0, [fp, #-8]
    str     r1, [fp, #-12]
    str     r2, [fp, #-16]

    ldr     r2, [fp, #-8]      // R2 <- x
    ldr     r3, [fp, #-12]     // R3 <- y 

    add     r2, r2, r3         // R2 = x + y
    ldr     r3, [fp, #-16]     // R3 <- z
    add     r3, r2, r3

    // Epilogue
    mov     r0, r3          // Store return value in R0
    add     sp, fp, #0      // Remove current stack
    ldr     fp, [sp], #4    // Restore previous frame pointer
    bx      lr 
    
_start:
    
    
    MOV R0, #1
    MOV R1, #2
    MOV R2, #3
    
    BL sum

    MOV R0, #3
    MOV R1, #4
    MOV R2, #5
    BL sum
    
_end:

    MOV R0, #0
    MOV R7,#1
    SWI 0


