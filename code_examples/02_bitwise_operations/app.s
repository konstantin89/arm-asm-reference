.global _start

.equ EXIT_SYS_NUMBER, 1




_start:
    

    
_exit:
    // Set exit code
    MOV R0, #0
    mov R7,#EXIT_SYS_NUMBER
    swi 0


