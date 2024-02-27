---
## $${\color{yellow}Instructions: MOV, MOVZX, MOVSX, MOVSXD}$$

---
$${\color{orange}Instruction \space \color{red}MOV}$$
- Operand(s) Supported: Source, Destination
- Description: The MOV (MOVe) instruction is used to move data from a source to a destination.

$${\color{orange}Instruction \space \color{red}MOVZX}$$
- Operand(s) Supported: Source, Destination
- Description: The MOVZX (MOVe with Zero eXtension) instruction moves the source operand to the destination operand, zero-extending it to the size of the destination operand. It is typically used to clear upper bits when moving data between registers or memory locations of different sizes.

$${\color{orange}Instruction \space \color{red}MOVSX}$$
- Operand(s) Supported: Source, Destination
- Description: The MOVSX (MOVe with Sign eXtension) instruction moves the source operand to the destination operand, sign-extending it to the size of the destination operand. It is commonly used to preserve the sign of data when moving between registers or memory locations of different sizes.

$${\color{orange}Instruction \space \color{red}MOVSXD}$$
- Operand(s) Supported: Source, Destination
- Description: The MOVSXD (MOVe with Sign eXtension of Doubleword) instruction is used in 64-bit mode to move a signed doubleword from a 32-bit source to a 64-bit destination, sign-extending the value to fill the 64-bit destination.

---

---
## $${\color{yellow}Instructions: CMP, SETE, JE, JL, JNE, JLE, JG, JZ}$$

---
$${\color{orange}Instruction \space \color{red}CMP}$$
- Operand(s) Supported: Source, Destination
- Description: The CMP (CoMPare) instruction compares the values of two operands. It performs a subtraction between the operands but does not store the result, only updating the status flags. It is commonly used in conditional branching instructions to determine whether a branch should be taken based on the result of the comparison.

$${\color{orange}Instruction \space \color{red}SETE}$$
- Operand(s) Supported: Destination
- Description: The SETE (SET if Equal) instruction sets the destination operand to 1 if the Zero Flag (ZF) is set (indicating that the previous comparison resulted in equality); otherwise, it sets the destination operand to 0.

- $${\color{orange}Instruction \space \color{red}JE} \space {\color{lightblue}(\space Jump \space if \space Equal), \space} \space {\color{red}JL} \space {\color{lightblue}(\space Jump \space if \space Less), \space} \space {\color{red}JG} \space {\color{lightblue}(\space Jump \space if \space Greater), \space} \space {\color{red}JZ} \space {\color{lightblue}(\space Jump \space if \space Zero) \space ...}$$
- $${\color{red}JLE} \space {\color{lightblue}(\space Jump \space if \space Less \space Equal), \space} \space {\color{red}JNE} \space {\color{lightblue}(\space Jump \space if \space no \space Equal), \space ...}$$
- Operand(s) Supported: Relative displacement
- Description: The JE instruction performs a jump to a specified target address if the Zero Flag (ZF) is set, indicating that the two compared operands are equal.
---

---
## $${\color{yellow}Instructions: SYSCALL, CALL}$$

---
$${\color{orange}Instruction \space \color{red}SYSCALL}$$
- Operand(s) Supported: None
- Description: The SYSCALL instruction is used in 64-bit mode to make a system call to the kernel. It transfers control to the operating system to request services such as I/O operations, process management, and more.

$${\color{orange}Instruction \space \color{red}CALL}$$
- Operand(s) Supported: Target address
- Description: The CALL instruction is used to call a subroutine or procedure. It pushes the return address onto the stack and then jumps to the specified target address. Upon completion of the subroutine, the RET instruction is typically used to return control to the calling routine.

---

---
## $${\color{yellow}Instructions: PUSH, POP, RET}$$

---
$${\color{orange}Instruction \space \color{red}PUSH}$$
- Operand(s) Supported: Source
- Description: The PUSH instruction pushes the source operand onto the top of the stack. It decrements the stack pointer (ESP or RSP) and stores the operand in the memory location pointed to by the stack pointer.

$${\color{orange}Instruction \space \color{red}POP}$$
- Operand(s) Supported: Destination
- Description: The POP instruction pops the topmost value from the stack and stores it in the destination operand. It increments the stack pointer (ESP or RSP) after retrieving the value.

$${\color{orange}Instruction \space \color{red}RET}$$
- Operand(s) Supported: None
- Description: The RET (RETurn) instruction is used to return control from a subroutine to the calling routine. It pops the return address from the stack and jumps to that address.

---

---
## $${\color{yellow}Instructions: ADD, SUB, IMUL}$$

---
$${\color{orange}Instruction \space \color{red}ADD}$$
- Operand(s) Supported: Source, Destination
- Description: The ADD instruction adds the source operand to the destination operand and stores the result in the destination operand. It updates the status flags based on the result of the addition.

$${\color{orange}Instruction \space \color{red}SUB}$$
- Operand(s) Supported: Source, Destination
- Description: The SUB (SUBtract) instruction subtracts the source operand from the destination operand and stores the result in the destination operand. It updates the status flags based on the result of the subtraction.

$${\color{orange}Instruction \space \color{red}IMUL}$$
- Operand(s) Supported: Source, Destination
- Description: The IMUL (Integer MULtiply) instruction performs signed integer multiplication of the source operand with the destination operand. It stores the result in the destination operand, and it may also set the overflow and carry flags depending on the result.

---

---
## $${\color{yellow}Instructions: TEST, XOR, NEG}$$

---
$${\color{orange}Instruction \space \color{red}TEST}$$
- Operand(s) Supported: Source, Destination
- Description: The TEST instruction performs a bitwise AND operation between the source and destination operands, updating the status flags based on the result without storing the result. It is often used to check for the presence of specific bits or to perform a null test.

$${\color{orange}Instruction \space \color{red}XOR}$$
- Operand(s) Supported: Source, Destination
- Description: The XOR (eXclusive OR) instruction performs a bitwise XOR operation between the source and destination operands, storing the result in the destination operand. Each bit of the result is set to 1 if the corresponding bits of the operands are different, otherwise, it is set to 0. XOR operations are commonly used for bitwise manipulation, clearing specific bits, or toggling bits.

$${\color{orange}Instruction \space \color{red}NEG}$$
- Operand(s) Supported: Destination
- Description: The NEG (NEGate) instruction negates the value of the destination operand. It performs a two's complement negation, effectively changing the sign of the operand.

---

---
## $${\color{yellow}Instructions: REP, REPZ, SCASB, CLD}$$

---
$${\color{orange}Instruction \space \color{red}REP}$$
- Operand(s) Supported: None
- Description: The REP (REPeat) instruction is used in conjunction with string manipulation instructions such as MOVS, STOS, INS, and OUTS. It causes the specified string operation to repeat until the ECX register becomes zero or the specified condition is met.

$${\color{orange}Instruction \space \color{red}REPZ}$$
- Operand(s) Supported: None
- Description: The REPZ (REPeat while Zero) instruction is a specific form of the REP instruction. It causes the string operation to repeat while the Zero Flag (ZF) is set, or until the ECX register becomes zero.

$${\color{orange}Instruction \space \color{red}SCASB}$$
- Operand(s) Supported: None
- Description: The SCASB (SCan String for Byte) instruction compares the byte in the AL register with the byte at the address specified by the ES:DI or ES:EDI register pair. It sets the status flags based on the result of the comparison and increments or decrements the DI or EDI register depending on the direction flag (DF) in the FLAGS register.

$${\color{orange}Instruction \space \color{red}CLD}$$
- Operand(s) Supported: None
- Description: The CLD (CLear Direction flag) instruction clears the Direction Flag (DF) in the FLAGS register. This causes string manipulation instructions to auto-increment the index registers (such as DI or EDI) after each operation, allowing them to move forward through memory.

---
