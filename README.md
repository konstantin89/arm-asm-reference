# arm-asm-reference

## Links

[ARM assembler simulator](https://salmanarif.bitbucket.io/visual/index.html)  

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
ln -o program program.o
```

## GDB command reference

``` gdb
q (quit)              - Exit GDB
l (list)              - List source code
b (break)             - Set brak point
r (run)               - Run program
i r (info register)   - Examine CPU registers
disas (disassemble)   - Disassemble machine code
stepi                 - Step through instruction
c (continue)          - Continue execution
x                     - Examine memory
```