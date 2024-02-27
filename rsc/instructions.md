## Instructions: MOV, MOVZX, MOVSX, MOVSXD

---
Instruction: <font color="red">MOV</font>  
Operand(s) Supported: Source, Destination  
Description: The <font color="red">MOV</font> (MOVe) instruction is used to move data from a source to a destination.

---

Instruction: <font color="red">MOVZX</font>  
Operand(s) Supported: Source, Destination  
Description: The <font color="red">MOVZX</font> (MOVe with Zero eXtension) instruction moves the source operand to the destination operand, zero-extending it to the size of the destination operand. It is typically used to clear upper bits when moving data between registers or memory locations of different sizes.

---

Instruction: <font color="red">MOVSX</font>  
Operand(s) Supported: Source, Destination  
Description: The <font color="red">MOVSX</font> (MOVe with Sign eXtension) instruction moves the source operand to the destination operand, sign-extending it to the size of the destination operand. It is commonly used to preserve the sign of data when moving between registers or memory locations of different sizes.

---

Instruction: <font color="red">MOVSXD</font>  
Operand(s) Supported: Source, Destination  
Description: The <font color="red">MOVSXD</font> (MOVe with Sign eXtension of Doubleword) instruction is used in 64-bit mode to move a signed doubleword from a 32-bit source to a 64-bit destination, sign-extending the value to fill the 64-bit destination.

---

## Instructions: CMP, SETE, JE, JL, JNE, JLE, JG, JZ

---

Instruction: <font color="red">CMP</font>  
Operand(s) Supported: Source, Destination  
Description: The <font color="red">CMP</font> (CoMPare) instruction compares the values of two operands. It performs a subtraction between the operands but does not store the result, only updating the status flags. It is commonly used in conditional branching instructions to determine whether a branch should be taken based on the result of the comparison.

---

Instruction: <font color="red">SETE</font>  
Operand(s) Supported: Destination  
Description: The <font color="red">SETE</font> (SET if Equal) instruction sets the destination operand to 1 if the Zero Flag (ZF) is set (indicating that the previous comparison resulted in equality); otherwise, it sets the destination operand to 0.

---

Instruction: <font color="red">JE</font> (Jump if Equal)  
Operand(s) Supported: Relative displacement  
Description: The <font color="red">JE</font> instruction performs a jump to a specified target address if the Zero Flag (ZF) is set, indicating that the two compared operands are equal.

---

Instruction: <font color="red">JL</font> (Jump if Less), <font color="red">JNE</font> (Jump if no Equal), <font color="red">JLE</font> (Jump if Less equal), <font color="red">JG</font> (Jump if Greater), <font color="red">JZ</font> (Jump if Zero flag (ZF))  
Operand(s) Supported: Relative displacement  
Description: The <font color="red">JL</font> instruction performs a jump to a specified target address if the Sign Flag (SF) is not equal to the Overflow Flag (OF), indicating that the most recent comparison resulted in a signed less-than condition.

---

## Instructions: SYSCALL, CALL

---

Instruction: <font color="red">SYSCALL</font>  
Operand(s) Supported: None  
Description: The <font color="red">SYSCALL</font> instruction is used in 64-bit mode to make a system call to the kernel. It transfers control to the operating system to request services such as I/O operations, process management, and more.

---

Instruction: <font color="red">CALL</font>  
Operand(s) Supported: Target address  
Description: The <font color="red">CALL</font> instruction is used to call a subroutine or procedure. It pushes the return address onto the stack and then jumps to the specified target address. Upon completion of the subroutine, the RET instruction is typically used to return control to the calling routine.

---

## Instructions: PUSH, POP, RET

---

Instruction: <font color="red">PUSH</font>  
Operand(s) Supported: Source  
Description: The <font color="red">PUSH</font> instruction pushes the source operand onto the top of the stack. It decrements the stack pointer (ESP or RSP) and stores the operand in the memory location pointed to by the stack pointer.

---

Instruction: <font color="red">POP</font>  
Operand(s) Supported: Destination  
Description: The <font color="red">POP</font> instruction pops the topmost value from the stack and stores it in the destination operand. It increments the stack pointer (ESP or RSP) after retrieving the value.

---

Instruction: <font color="red">RET</font>  
Operand(s) Supported: None  
Description: The <font color="red">RET</font> (RETurn) instruction is used to return control from a subroutine to the calling routine. It pops the return address from the stack and jumps to that address.

---

## Instructions: ADD, SUB, IMUL

---

Instruction: <font color="red">ADD</font>  
Operand(s) Supported: Source, Destination  
Description: The <font color="red">ADD</font> instruction adds the source operand to the destination operand and stores the result in the destination operand. It updates the status flags based on the result of the addition.

---

Instruction: <font color="red">SUB</font>  
Operand(s) Supported: Source, Destination  
Description: The <font color="red">SUB</font> (SUBtract) instruction subtracts the source operand from the destination operand and stores the result in the destination operand. It updates the status flags based on the result of the subtraction.

---

Instruction: <font color="red">IMUL</font>  
Operand(s) Supported: Source, Destination  
Description: The <font color="red">IMUL</font> (Integer MULtiply) instruction performs signed integer multiplication of the source operand with the destination operand. It stores the result in the destination operand, and it may also set the overflow and carry flags depending on the result.

---

## Instructions: TEST, XOR, NEG

---

Instruction: <font color="red">TEST</font>  
Operand(s) Supported: Source, Destination  
Description: The <font color="red">TEST</font> instruction performs a bitwise AND operation between the source and destination operands, updating the status flags based on the result without storing the result. It is often used to check for the presence of specific bits or to perform a null test.

---

Instruction: <font color="red">XOR</font>  
Operand(s) Supported: Source, Destination  
Description: The <font color="red">XOR</font> (eXclusive OR) instruction performs a bitwise XOR operation between the source and destination operands, storing the result in the destination operand. Each bit of the result is set to 1 if the corresponding bits of the operands are different, otherwise, it is set to 0. XOR operations are commonly used for bitwise manipulation, clearing specific bits, or toggling bits.

---

Instruction: <font color="red">NEG</font>  
Operand(s) Supported: Destination  
Description: The <font color="red">NEG</font> (NEGate) instruction negates the value of the destination operand. It performs a two's complement negation, effectively changing the sign of the operand.

---

## Instructions: REP, REPZ, SCASB, CLD

---

Instruction: <font color="red">REP</font>  
Operand(s) Supported: None  
Description: The <font color="red">REP</font> (REPeat) instruction is used in conjunction with string manipulation instructions such as MOVS, STOS, INS, and OUTS. It causes the specified string operation to repeat until the ECX register becomes zero or the specified condition is met.

---

Instruction:$${\space \color{red}REPNZ}$$
Operand(s) Supported: None  
Description: The $${\color{red}REPNZ}$$ (REPeat while Zero) instruction is a specific form of the REP instruction. It causes the string operation to repeat while the Zero Flag (ZF) is set, or until the ECX register becomes zero.

---

Instruction: <font color="red">SCASB</font>  
Operand(s) Supported: None  
Description: The <font color="red">SCASB</font> (SCan String for Byte) instruction compares the byte in the AL register with the byte at the address specified by the ES:DI or ES:EDI register pair. It sets the status flags based on the result of the comparison and increments or decrements the DI or EDI register depending on the direction flag (DF) in the FLAGS register.

---

Instruction: <font color="red">CLD</font>  
Operand(s) Supported: None  
Description: The <font color="red">CLD</font> (CLear Direction flag) instruction clears the Direction Flag (DF) in the FLAGS register. This causes string manipulation instructions to auto-increment the index registers (such as DI or EDI) after each operation, allowing them to move forward through memory.

---
$${\color{red}Red}$$