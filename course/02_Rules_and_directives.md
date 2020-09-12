# Rules and directives

## ASM module structure

![Module struct](img/rules_and_directives/asm_module_structure.PNG)

</br>

## Thumb and Thumb2 instructions

### Thumb instructions


The ARM command is 32 bits long.
The Thumb command is 16 bits long.

Both instructions are: R0 = R0 + R2.

![Thumb](img/rules_and_directives/thumb_instructions.PNG)

Thumb 2 is a combination of Thumb 16 bits instructions, and ARM   
32 bit instructions. 

Different processors support different instruction sets.
![Instructions](img/rules_and_directives/instruction_sets.PNG)

</br>

## Registers and Directives
![Regs](img/rules_and_directives/predefined_registers_name.PNG)

</br>

Directives are not part of the instruction set.
![Directives](img/rules_and_directives/directives.PNG)

Examples of directives.    
DCB - Define Constant Byte (8 bits).  
DCW - Define Constant half Word (16 bits).  
DCD - Define Constant Word (32 bits).  

![Directives](img/rules_and_directives/directives_examples.PNG)

</br>

Keil and GNU assembers have different names for same directives:  
![Directives](img/rules_and_directives/directives_in_gnu.PNG)

![Directives](img/rules_and_directives/directives_in_gnu2.PNG)

Comparison of assembly code in Keil and GNU compilers:
![Directives](img/rules_and_directives/keil_vs_gnu.PNG)

