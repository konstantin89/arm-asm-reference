# arm-asm-reference

## Links

[ARM assembler simulator](https://wunkolo.github.io/OakSim)  

</br>

## GNU build command reference

Assemble assemply source file into object file
``` sh
as -o program.o program.s
```

Assemble assemply source file into object file with debugging info
``` sh
as -g -o program.o program.s
```

Link assemble object file into executable
``` sh
ld -o program program.o
```

## GDB command reference

``` gdb
q (quit)              - Exit GDB
l (list)              - List source code
b (break)             - Set brak point
i r (info register)   - Examine CPU registers
disas (disassemble)   - Disassemble machine code

r (run)               - Run program
stepi                 - Step through instruction
c (continue)          - Continue execution

x                     - Examine memory
x/32b 0x10070         - Examine 32 bytes from address 0x10070
```

</br>

### Exiting ASM program

The proper way to finish a program is by calling sys_exit. 
System calls are called "Software Interrupt" command  
The following code is an example of using exit system call:  


``` asm
	.global _start

_start:

	MOV R0,#5     ; Set the parameter for sys_exit
	
	MOV R7,#1
	SWI 0         ; Call sys_exit
```

You can observe the exit code of the last exited command by running:

``` bash
echo $?
```
