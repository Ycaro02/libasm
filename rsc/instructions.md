---
## <span style="color:yellow">Instructions: MOV, MOVZX, MOVSX, MOVSXD</span>

---
Instruction: <span style="color:red">MOV</span>
Operand(s) Supported: Source, Destination
Description: The <span style="color:red">MOV</span> (MOVe) instruction is used to move data from a source to a destination.

---
Instruction: <span style="color:red">MOVZX</span>
Operand(s) Supported: Source, Destination
Description: The <span style="color:red">MOVZX</span> (MOVe with Zero eXtension) instruction moves the source operand to the destination operand, zero-extending it to the size of the destination operand. It is typically used to clear upper bits when moving data between registers or memory locations of different sizes.

---
Instruction: <span style="color:red">MOVSX</span>
Operand(s) Supported: Source, Destination
Description: The <span style="color:red">MOVSX</span> (MOVe with Sign eXtension) instruction moves the source operand to the destination operand, sign-extending it to the size of the destination operand. It is commonly used to preserve the sign of data when moving between registers or memory locations of different sizes.

---
Instruction: <span style="color:red">MOVSXD</span>
Operand(s) Supported: Source, Destination
Description: The <span style="color:red">MOVSXD</span> (MOVe with Sign eXtension of Doubleword) instruction is used in 64-bit mode to move a signed doubleword from a 32-bit source to a 64-bit destination, sign-extending the value to fill the 64-bit destination.

---

---
## <span style="color:yellow">Instructions: CMP, SETE, JE, JL, JNE, JLE, JG, JZ</span>

---
Instruction: <span style="color:red">CMP</span>
Operand(s) Supported: Source, Destination
Description: The <span style="color:red">CMP</span> (CoMPare) instruction compares the values of two operands. It performs a subtraction between the operands but does not store the result, only updating the status flags. It is commonly used in conditional branching instructions to determine whether a branch should be taken based on the result of the comparison.

---
Instruction: <span style="color:red">SETE</span>
Operand(s) Supported: Destination
Description: The <span style="color:red">SETE</span> (SET if Equal) instruction sets the destination operand to 1 if the Zero Flag (ZF) is set (indicating that the previous comparison resulted in equality); otherwise, it sets the destination operand to 0.

---
Instruction: <span style="color:red">JE</span> (Jump if Equal)
Operand(s) Supported: Relative displacement
Description: The <span style="color:red">JE</span> instruction performs a jump to a specified target address if the Zero Flag (ZF) is set, indicating that the two compared operands are equal.

---
Instruction: <span style="color:red">JL</span> (Jump if Less), <span style="color:red">JNE</span> (Jump if no Equal), <span style="color:red">JLE</span> (Jump if Less equal), <span style="color:red">JG</span> (Jump if Greater), <span style="color:red">JZ</span> (Jump if Zero flag (ZF))
Operand(s) Supported: Relative displacement
Description: The <span style="color:red">JL</span> instruction performs a jump to a specified target address if the Sign Flag (SF) is not equal to the Overflow Flag (OF), indicating that the most recent comparison resulted in a signed less-than condition.

---

---
## <span style="color:yellow">Instructions: SYSCALL, CALL</span>

---
Instruction: <span style="color:red">SYSCALL</span>
Operand(s) Supported: None
Description: The <span style="color:red">SYSCALL</span> instruction is used in 64-bit mode to make a system call to the kernel. It transfers control to the operating system to request services such as I/O operations, process management, and more.

---
Instruction: <span style="color:red">CALL</span>
Operand(s) Supported: Target address
Description: The <span style="color:red">CALL</span> instruction is used to call a subroutine or procedure. It pushes the return address onto the stack and then jumps to the specified target address. Upon completion of the subroutine, the RET instruction is typically used to return control to the calling routine.

---

---
## <span style="color:yellow">Instructions: PUSH, POP, RET</span>

---
Instruction: <span style="color:red">PUSH</span>
Operand(s) Supported: Source
Description: The <span style="color:red">PUSH</span> instruction pushes the source operand onto the top of the stack. It decrements the stack pointer (ESP or RSP) and stores the operand in the memory location pointed to by the stack pointer.

---
Instruction: <span style="color:red">POP</span>
Operand(s) Supported: Destination
Description: The <span style="color:red">POP</span> instruction pops the topmost value from the stack and stores it in the destination operand. It increments the stack pointer (ESP or RSP) after retrieving the value.

---
Instruction: <span style="color:red">RET</span>
Operand(s) Supported: None
Description: The <span style="color:red">RET</span> (RETurn) instruction is used to return control from a subroutine to the calling routine. It pops the return address from the stack and jumps to that address.

---

---
## <span style="color:yellow">Instructions: ADD, SUB, IMUL</span>

---
Instruction: <span style="color:red">ADD</span>
Operand(s) Supported: Source, Destination
Description: The <span style="color:red">ADD</span> instruction adds the source operand to the destination operand and stores the result in the destination operand. It updates the status flags based on the result of the addition.

---
Instruction: <span style="color:red">SUB</span>
Operand(s) Supported: Source, Destination
Description: The <span style="color:red">SUB</span> (SUBtract) instruction subtracts the source operand from the destination operand and stores the result in the destination operand. It updates the status flags based on the result of the subtraction.

---
Instruction: <span style="color:red">IMUL</span>
Operand(s) Supported: Source, Destination
Description: The <span style="color:red">IMUL</span> (Integer MULtiply) instruction performs signed integer multiplication of the source operand with the destination operand. It stores the result in the destination operand, and it may also set the overflow and carry flags depending on the result.

---

---
## <span style="color:yellow">Instructions: TEST, XOR, NEG</span>

---
Instruction: <span style="color:red">TEST</span>
Operand(s) Supported: Source, Destination
Description: The <span style="color:red">TEST</span> instruction performs a bitwise AND operation between the source and destination operands, updating the status flags based on the result without storing the result. It is often used to check for the presence of specific bits or to perform a null test.

---
Instruction: <span style="color:red">XOR</span>
Operand(s) Supported: Source, Destination
Description: The <span style="color:red">XOR</span> (eXclusive OR) instruction performs a bitwise XOR operation between the source and destination operands, storing the result in the destination operand. Each bit of the result is set to 1 if the corresponding bits of the operands are different, otherwise, it is set to 0. XOR operations are commonly used for bitwise manipulation, clearing specific bits, or toggling bits.

---
Instruction: <span style="color:red">NEG</span>
Operand(s) Supported: Destination
Description: The <span style="color:red">NEG</span> (NEGate) instruction negates the value of the destination operand. It performs a two's complement negation, effectively changing the sign of the operand.

---

---
## <span style="color:yellow">Instructions: REP, REPZ, SCASB, CLD</span>

---
Instruction: <span style="color:red">REP</span>
Operand(s) Supported: None
Description: The <span style="color:red">REP</span> (REPeat) instruction is used in conjunction with string manipulation instructions such as MOVS, STOS, INS, and OUTS. It causes the specified string operation to repeat until the ECX register becomes zero or the specified condition is met.

---
Instruction: <span style="color:red">REPZ</span>
Operand(s) Supported: None
Description: The <span style="color:red">REPZ</span> (REPeat while Zero) instruction is a specific form of the REP instruction. It causes the string operation to repeat while the Zero Flag (ZF) is set, or until the ECX register becomes zero.

---
Instruction: <span style="color:red">SCASB</span>
Operand(s) Supported: None
Description: The <span style="color:red">SCASB</span> (SCan String for Byte) instruction compares the byte in the AL register with the byte at the address specified by the ES:DI or ES:EDI register pair. It sets the status flags based on the result of the comparison and increments or decrements the DI or EDI register depending on the direction flag (DF) in the FLAGS register.

---
Instruction: <span style="color:red">CLD</span>
Operand(s) Supported: None
Description: The <span style="color:red">CLD</span> (CLear Direction flag) instruction clears the Direction Flag (DF) in the FLAGS register. This causes string manipulation instructions to auto-increment the index registers (such as DI or EDI) after each operation, allowing them to move forward through memory.

---
