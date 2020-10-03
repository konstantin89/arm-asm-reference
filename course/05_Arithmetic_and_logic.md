# Arithmetic And Logic Instructions

## Status registers

![status registers](img/arithm_and_logic/status_registers.PNG)

</br>

## N flag 

Negative, indicates that the result is negative.  
Since machines are working in "2 complements", number is  
negastive if its most significant bit is 1.  

</br>

## V flag 

Signed overflow flag. Indicates that the result of arithmetic   
instruction is greater thatn 2^31 or smaller than 2^-31.

</br>

## Z flag

Indicates that the result of an operation is zero.  

</br>

## C flag

The carry flag indicates that the result is greater than 2^32.  

</br>

## Relevant instruciotns

``` text
CMP - Subtract register or imm and update status register.
CMN - Add register or imm and update status register.

TST - Logically ANDs value with register and update status reg.  
TEQ - Logically XORs value with register and update status reg.  

MRS - Move PSR into general porpuse register.
MSR - Move general porpuse register into PSR.

```
</br>

Note - TST and TEQ are not affecting the V flag.


</br>

## ADD vs ADDS

Arithmetic instructions (ADD, SUB, etc) don't modify the status    flag, unlike comparison instructions (CMP,TEQ) which update the   condition flags by default.   
However, adding the S to the arithmetic instructions(ADDS, SUBS,  etc) will update the condition flags according to the result of the operation.  

</br>

## Boolean operations

![boolean ops](img/arithm_and_logic/boolean_operations.PNG)

</br>

## Shift operations

Imporntant note is that logical shift is working only  
on positive numbers. Arithmetic shift must be used on signed  
negative numbers.

`Logical Shift` - Do not preserves the sign of the number.  
`Arithmetic Shift` - Preserves the sign of the number.  

</br>

![Shift](img/arithm_and_logic/barrel_shifter.PNG)

### Logical left shift
![Shift](img/arithm_and_logic/logical_left_shift.PNG)

### Logical right shift
![Shift](img/arithm_and_logic/logical_right_shift.PNG)

### Arithmetic right shift

Arithmetic shifts are preserving the sign on the number.

![Shift](img/arithm_and_logic/arithmetic_shift.PNG)

### Rotate right

![Shift](img/arithm_and_logic/ror.PNG)

### Rotate right extended
Rotate by a single bit, and place the LSB in the carry flag.  

![Shift](img/arithm_and_logic/rrx.PNG)

</br>

## ADD and SUB instructions

Note that RSB is Reverse Subtract.

![add sub](img/arithm_and_logic/add_sub.PNG)

</br>

## ADD and SUB instructions for 64 bit numbers

The following code adds two 64 bit intagers stored in  
R0,R1 and R2,R3 and stores the sum in R4,R5.

![add](img/arithm_and_logic/add_64_bit_number.PNG)

</br>

## Load signed data

The instruction `LDRSB` can be used to store signed byte into  
register. This instruction extends the sign bit.


``` asm
	.global _start

SignedData:   .byte -9
              .align 4

_start:

        LDR R0, =SignedData    // R0 is the ptr for SignedData

        LDRSB R1, [R0]         // R1 = -9 

        MOV R7,#1
        SWI 0

```

</br>

## Bit manipulation inbstructions

Bit manipulation instructions:
![add](img/arithm_and_logic/bit_instr.PNG)

Example of BFI insturction (Bit Field Insert):
![add](img/arithm_and_logic/bit_instr_bfi.PNG)

Example of BFC insturction (Bit Field Clear):
![add](img/arithm_and_logic/bit_instr_bfc.PNG)

</br>

## Saturated math instructions

Saturated math instructions needed to prevent incorrect values  
resulted from numbers overflows.  
It can prevent sign change of overflown numbers.  

The example below describes sensor input with and whithout  
saturated math. The upper graph demonstrates data corruption.    
The corruption resulted from number overflow that caused sign  
change.  
![add](img/arithm_and_logic/saturated_math.PNG)

Some saturated math instructions:
![add](img/arithm_and_logic/saturated_math_instr.PNG)

</br>

## Multiplication instructions

![add](img/arithm_and_logic/mul_instr.PNG)

Some multiplication instructions examples:
![add](img/arithm_and_logic/mul_instr_examples.PNG)
![add](img/arithm_and_logic/mul_instr_examples2.PNG)
![add](img/arithm_and_logic/mul_instr_examples3.PNG)

</br>

## Division instructions

![add](img/arithm_and_logic/div.PNG)

</br>

## Example: Max value from data set

This program will place in R1 the max number from DataSet.

```
	.global _start

DataSet:   .word 1,5,3,2,9,0,4,7

NEXT      .req R0
MAX_VAL   .req R1
COUNT     .req R2
DATA_PTR  .req R3


_start:

        LDR DATA_PTR, =DataSet
        MOV COUNT, #7
        LDR MAX_VAL, [DATA_PTR]

LOOP:
        
        ADD DATA_PTR, DATA_PTR, #4
        
        LDR NEXT, [DATA_PTR]
        CMP NEXT, MAX_VAL    
        BHI VALUE_IS_LARGER

CONTROL: 

        SUBS COUNT, COUNT, #1
        BEQ END
        B LOOP

        
VALUE_IS_LARGER:

        MOV  MAX_VAL, NEXT
        B CONTROL
 	

END:

        MOV R7,#1
        SWI 0

```