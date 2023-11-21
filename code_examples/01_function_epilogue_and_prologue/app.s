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

IMPORTANT!

Be aware! The first variable on the stack is at [FP, #-4].  
The reason for that is that the stack is moving from high address to the low address.  
For this reason, if x is in [FP, #-8], its located in the following bytes:   
[FP, #-8],[FP, #-7],[FP, #-6],[FP, #-5]


x = fp-8
y = fp-12
z = fp-16

-------------   stack   ---------------- fp-20  <--- sp       
                                                    
---------------------------------------- fp-16
int z                           
---------------------------------------- fp-12
int y                            
---------------------------------------- fp-8
int x                            
---------------------------------------- fp-4
old fp                           
---------------------------------------- fp

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
    BL sum        // BL stores return address in LR (link register)
    
_end:

    MOV R0, #0
    MOV R7,#1
    SWI 0


