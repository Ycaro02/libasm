### Register --> https://wiki.osdev.org/CPU_Registers_x86-64

## $${\color{lightgreen}Instructions: MOV, MOVZX, MOVSX, MOVSXD}$$
## $${\color{orange}Register \space Value \space Assignment \space}$$
### $${\color{red}MOV}$$
```
Operand(s) Supported: Source, Destination
Description: The MOV (MOVe) instruction is used to move data 
from a source to a destination.
```

### $${\color{red}MOVZX}$$
```
Operand(s) Supported: Source, Destination
Description: The MOVZX (MOVe with Zero eXtension) instruction moves the source
operand to the destination operand, zero-extending it to the size of the
destination operand. It is typically used to clear upper bits when moving data
between registers or memory locations of different sizes.
```

### $${\color{red}MOVSX}$$
```
Operand(s) Supported: Source, Destination
Description: The MOVSX (MOVe with Sign eXtension) instruction moves the source
operand to the destination operand, sign-extending it to the size of the destination
operand. It is commonly used to preserve the sign of data when moving between
registers or memory locations of different sizes.
```

### $${\color{red}MOVSXD}$$
```
Operand(s) Supported: Source, Destination
Description: The MOVSXD (MOVe with Sign eXtension of Doubleword) instruction
is used in 64-bit mode to move a signed doubleword from a 32-bit source to
a 64-bit destination, sign-extending the value to fill the 64-bit destination.
```

### $${\color{red}XCHG}$$
```
Operand(s) Supported: Source, Destination
Description: EXCHanGes the contents of the destination and source operands.
The operands can be two general-purpose registers or a register and a memory location.
```
## $${\color{lightgreen}Instructions: ADD, SUB, IMUL}$$
## $${\color{orange}Register \space Value \space Basic \space Operation}$$
```
### $${\color{red}ADD}$$
Operand(s) Supported: Source, Destination
Description: The ADD instruction adds the source operand to the destination operand
and stores the result in the destination operand.
It updates the status flags based on the result of the addition.
```

### $${\color{red}SUB}$$
```
Operand(s) Supported: Source, Destination
Description: The SUB (SUBtract) instruction subtracts the source operand from the
destination operand and stores the result in the destination operand.
It updates the status flags based on the result of the subtraction.
```

### $${\color{red}IMUL}$$
```
Operand(s) Supported: Source, Destination
Description: The IMUL (Integer MULtiply) instruction performs signed integer
multiplication of the source operand with the destination operand.
It stores the result in the destination operand, and it may also set the overflow
and carry flags depending on the result.
```

### $${\color{red}INC}$$
```
Operand(s) Supported: Source
Description: The INC instruction increment the source operand, similar to add 1.
```




## $${\color{lightgreen}Instructions: TEST, XOR, NEG}$$
## $${\color{orange}Register \space Value \space Binary \space Operation}$$

### $${\color{red}TEST}$$
```
Operand(s) Supported: Source, Destination
Description: The TEST instruction performs a bitwise AND operation between the 
sourceand destination operands, updating the status flags based on the result without
storingthe result. It is often used to check for the presence of specific bits 
or to perform a null test.
```

### $${\color{red}XOR}$$
```
Operand(s) Supported: Source, Destination
Description: The XOR (eXclusive OR) instruction performs a bitwise XOR operation between
the source and destination operands, storing the result in the destination operand.
Each bit of the result is set to 1 if the corresponding bits of the operands are different
, otherwise, it is set to 0. XOR operations are commonly used for bitwise manipulation
, clearing specific bits, or toggling bits.
```

### $${\color{red}NEG}$$
```
Operand(s) Supported: Destination
Description: The NEG (NEGate) instruction negates the value of the destination operand.
It performs a two's complement negation, effectively changing the sign of the operand.
```

## $${\color{lightgreen}Instructions: SCASB}$$
## $${\color{orange}Special  \space String  \space Operation  \space Instruction}$$

### $${\color{red}MOVSB}$$
```
Operand(s) Supported: None
Description: The MOVSB (MOVe String Byte) instruction moves a byte of data from the memory location 
addressed by the source index register (SI) to the memory location addressed by the destination
index register (DI). After the byte is moved, both the source and destination index registers
are incremented or decremented, depending on the state of the Direction Flag (DF) in the FLAGS
register. This instruction is commonly used for string manipulation tasks such as copying
a string from one location to another.
```

### $${\color{red}SCASB}$$
```
Operand(s) Supported: None
Description: The SCASB (SCan String for Byte) instruction compares the byte in the AL register
with the byte at the address specified by the ES:DI or ES:EDI register pair.
It sets the status flags based on the result of the comparison and increments or decrements
the DI or EDI register depending on the direction flag (DF) in the FLAGS register.
```

### $${\color{red}CLD}$$
```
Operand(s) Supported: None
Description: The CLD (CLear Direction flag) instruction clears the Direction Flag (DF)
in the FLAGS register. This causes string manipulation instructions to auto-increment
the index registers (such as DI or EDI) after each operation, allowing them
to move forward through memory.
```


## $${\color{lightgreen}Instructions: CMP, SETE ... }$$
## $${\color{orange}Compare \space and \space Conditional \space operation \space}$$

### $${\color{red}CMP}$$
```
Operand(s) Supported: Source, Destination
Description: The CMP (CoMPare) instruction compares the values of two operands.
It performs a subtraction between the operands but does not store the result, 
only updating the status flags. It is commonly used in conditional branching instructions
to determine whether a branch should be taken based on the result of the comparison.
```

### $${\color{red}SETE}$$
```
- Operand(s) Supported: Destination
- Description: The SETE (SET if Equal) instruction sets the destination operand to 1
if the Zero Flag (ZF) is set (indicating that the previous comparison resulted in equality);
otherwise, it sets the destination operand to 0.
```



## $${\color{lightgreen}Instructions: JMP, JE, JL, JNE, JLE, JG, JZ}$$
## $${\color{orange}Jump \space and \space Conditional \space Jump}$$

 #### $${\color{orange}\color{red}JE} \space {\color{lightblue}(\space Jump \space if \space Equal), \space} \space {\color{red}JL} \space {\color{lightblue}(\space Jump \space if \space Less), \space} \space {\color{red}JG} \space {\color{lightblue}(\space Jump \space if \space Greater), \space} \space {\color{red}JZ} \space {\color{lightblue}(\space Jump \space if \space Zero) \space \space ...}$$
 #### $${\color{orange}\color{red}JLE} \space {\color{lightblue}(\space Jump \space if \space Less \space Equal), \space} \space {\color{red}JNE} \space {\color{lightblue}(\space Jump \space if \space no \space Equal), \space} \space {\color{red}JGE} \space {\color{lightblue}(\space Jump \space if \space Greater \space Equal) \space \space ...}$$
### $${\color{red}JMP}$$
```
Operand(s) Supported: Destination
Description: The JMP (Jump) instruction transfers program control to a specified destination.
It does not conditionally execute based on any flags or conditions; rather,
it unconditionally transfers the execution flow to the specified destination address.
```


## $${\color{orange}Syscall \space Classic \space Call}$$

### $${\color{red}SYSCALL}$$
```
- Operand(s) Supported: None
- Description: The SYSCALL instruction is used in 64-bit mode to make a
system call to the kernel. It transfers control to the operating system
to request services such as I/O operations, process management, and more.
```

### $${\color{red}CALL}$$
```
- Operand(s) Supported: Target address
- Description: The CALL instruction is used to call a subroutine or procedure.
It pushes the return address onto the stack and then jumps to the specified
target address. Upon completion of the subroutine, the RET instruction is
typically used to return control to the calling routine.
```



## $${\color{lightgreen}Instructions: PUSH, POP, RET}$$
## $${\color{orange}Stack \space Manipulation \space}$$


### $${\color{red}PUSH}$$
```
- Operand(s) Supported: Source
- Description: The PUSH instruction pushes the source operand onto the top of the stack.
It decrements the stack pointer (ESP or RSP) and stores the operand in the memory
location pointed to by the stack pointer.
```

### $${\color{red}POP}$$
```
- Operand(s) Supported: Destination
- Description: The POP instruction pops the topmost value from the stack
and stores it in the destination operand.
It increments the stack pointer (ESP or RSP) after retrieving the value.
```

### $${\color{red}RET}$$
```
- Operand(s) Supported: None
- Description: The RET (RETurn) instruction is used to return control from
a subroutine to the calling routine. It pops the return address
from the stack and jumps to that address.
```

## $${\color{lightgreen}Instructions: REP, REPZ, SCASB, CLD}$$
## $${\color{orange}Repeat \space Instruction}$$

### $${\color{red}REP}$$
```
Operand(s) Supported: None
Description: The REP (REPeat) instruction is used in conjunction with string
manipulation instructions such as MOVS, STOS, SCASB, MOVSB ...
It causes the specified string operation to repeat until the ECX register 
becomes zero or the specified condition is met.
```

### $${\color{red}REPZ}$$
```
Operand(s) Supported: None
Description: The REPZ (REPeat while Zero) instruction is a specific form of the 
REP instruction. It causes the string operation to repeat while the Zero Flag (ZF)
is set, or until the ECX register becomes zero.
```