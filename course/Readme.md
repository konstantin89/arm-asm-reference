# ARM Assembly Course

## Intro

### Converting between number systems

Binary to decimal
![Converting binary to decimal](img/intro/number_systems_1.PNG)

Hex to decimal
![Converting hex to decimal](img/intro/number_systems_2.PNG)


### Assembly tools

![Assembly tools](img/intro/assembly_tools.PNG)

### Assembler syntax

Each assembly command has the following syntax:  
Label Opcode Operand ;Comment

For example:  
store_routine STR R0, [R1] ;Store value of R0 into R1  

<br><br><br>

### Overall system architecture

![ARM system example](img/intro/arm_system_example.PNG)  

APB - ARM Peripherial bus  
AHB - Advanced High Performance Bus  
<br>

### Tightly-Coupled Memory
  
TCM is memory that can be accessd with in a single clock cycle.
One example of TCM usage is using it for interrupt handlers that need deterministic timing and cannot wait for cache misses.

For more info please refer the following link: 
[TCM](https://www.kernel.org/doc/Documentation/arm/tcm.txt) 

![ARM system example](img/intro/tcm_memory.PNG)

<br><br><br>

## ARM Architecture

### Data Types

* Byte - 8 bits
* HalfWord - 16 bits
* Word - 32 bits

### ARM7TDMI Registers

On ARM7TDMI processors, there are:
* 30 - General propuse registers
* 6 - Status registers
* 1 - Program counter register 

</br>

The registers are arranged in partially overlapping banks.   
There is a different register bank for each processor mode.  
The banked registers give rapid context switching for dealing  
with processor exceptions and privileged operations.   

![ARM register banks](img/architecture/register-banks.PNG)

</br>

Some registers have spacial porpuses:  
* R0 to R12 - General propuse registers
* R13 - Stack Pointer (SP)
* R14 - Linkn Register (LR), stores return locationn for functions
* R15 - Program Counter (PC), containers the current command address plus 4.

CPSR register is the "Current Program Status Register".  
![CPSR register](img/architecture/register-cpsr.PNG)

</br>

Bits [4:0] on CPSR store the current processor mode.
![CPSR register bits](img/architecture/register-cpsr-mode-bits.PNG)

</br>

### Cortex-M Registers

On Cortex-M processors, there are:
* 17 - General propuse registers
* 1 - Status register
* 3 - Interrupt mask register

</br>

![Cortex ARM registers](img/architecture/registers-cortex.PNG)

</br>

![Cortex ARM xPSR](img/architecture/registers-cortex_xPSR.PNG)

</br>

![Cortex ARM xPSR bits](img/architecture/registers-cortex_xPSR_bits.PNG)

</br>

![Cortex ARM xPSR values](img/architecture/registers-cortex_xPSR_values.PNG)

</br>

### ARM data flow

ARM is implementing the RISC architecture. Part of RISC  
architecture is the load/store architecture. So ARM processors  
have two instruction types, for transferring data in and out 
of the processor.     

ARM commands can have two source registers (Rn, Rm), and one  
distinationn register (Rd).

Rm register can עם through both Barrel shifer and ALU in sigle instruction.  

![ARM data flow](img/architecture/arm_data_flow.PNG)  

</br>

ARM processors implement pipelines with 5 stages.
![ARM pipeline](img/architecture/arm_pipeline.PNG)  

</br>

The PC register is poinnting on the instruction that is   
currenntly in "Fetch" stage of the pipeline.  

![ARM pipeline and PC](img/architecture/arm_pipeline_pc.PNG)  
