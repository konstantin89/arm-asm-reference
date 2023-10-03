/*
* @brief: Application that demonstrates usage of mmap2 on ARM asm.
*         Build and run on ARM32 processors with GNU compiler.
*
*         The application allocates 16 bytes in heap.
*         If the allocation succeeds, it stores the values
*         from 16 to 0 in the allocated bytes (one number in each byte).
*
*         Output example (mmap2 returned 0x76ffc000):
*
*             (gdb) x/32 0x76ffc000
*             0x76ffc000:     16      15      14      13
*             0x76ffc010:     12      11      10      9
*             0x76ffc020:     8       7       6       5
*             0x76ffc030:     4       3       2       1
*             0x76ffc040:     0       0       0       0
*             0x76ffc050:     0       0       0       0
*             0x76ffc060:     0       0       0       0
*             0x76ffc070:     0       0       0       0
*
*
*/


    .global _start

    .equ BYTES_TO_ALLOCATE, 16

    .equ MMAP2_SYS_NUMBER, 192
    .equ MMAP2_FAILED_RETURN_CODE, -1
    
    .equ PROT_READ,            0x1    // Page can be read.  
    .equ PROT_WRITE,           0x2    // Page can be written.  
    .equ PROT_EXEC,            0x4    // Page can be executed.  
    .equ PROT_NONE,            0x0    // Page can not be accessed.
    
    .equ PROT_RWE,             0x7    // PROT_READ | PROT_WRITE | PROT_EXEC
    
    .equ MAP_ANONYMOUS,        0x20   // Do not use a file in mapping.
    .equ MAP_SHARED,           0x01	
    .equ MAP_PRIVATE,	       0x02
    
    .equ MAP_ANONYMOUS_SHARED, 0x22
    
    
    PTR .req R1
    LOOP_COUNTER .req R2

_start:
		
        MOV R0, #0                      // void *addr
        MOV R1, #BYTES_TO_ALLOCATE      // size_t length
        MOV R2, #PROT_RWE               // int prot
        MOV R3, #MAP_ANONYMOUS_SHARED   // int flags
        MOV R4, #-1                     // int fd
        MOV R5, #0                      // off_t offset
		
        MOV R7, #MMAP2_SYS_NUMBER
		
        SWI #0
        
        cmp R0, #MMAP2_FAILED_RETURN_CODE
        
        BEQ _allocation_failed
        
        MOV PTR, R0                            // R1 is ptr to the heap memory
        
        MOV LOOP_COUNTER, #BYTES_TO_ALLOCATE   // R2 is the loop counter 
  
_loop:

         STRB LOOP_COUNTER, [PTR]
         ADD PTR, #4
         SUBS LOOP_COUNTER, LOOP_COUNTER, #1
          
         BNE _loop
         
         B _exit
        
_allocation_failed:
        
        B _exit

_exit:
        MOV R7,#1
        SWI #0