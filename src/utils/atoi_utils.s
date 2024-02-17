BITS 64

section .text
	global ft_char_in_base
; RDI, EDI : char c 0x4
; RSI char* base	0x10
; Dump of assembler code for function char_in_base:
ft_char_in_base:
push	rbp					;save rbp
mov		rbp, rsp				
mov		eax, edi				; get edi (rdi 32 bits) in eax
mov		qword [rbp-0x10], rsi	; save base a 0x10
mov		byte [rbp-0x4], al		; save char c in 0x4
jmp		_char_in_base_loop

_char_in_base_start:
add		qword [rbp-0x10], 0x1	; increment base ptr

_char_in_base_loop:
mov		rax, qword [rbp-0x10]	; store base ptr in rax
movzx	eax, byte [rax]		; get byte (first char)
test	al, al					; test if 0
je		_char_in_base_end		; jump if equal
mov		rax, qword [rbp-0x10]	; else get base ptr in rax
movzx	eax, byte [rax]		; got byte again REALLY mandatory ???
cmp		byte [rbp-0x4], al		; cmp char c with given char --> c == *base
jne		_char_in_base_start	; if not equal jmp start --> continue while if c != *base

_char_in_base_end:
mov		rax, qword [rbp-0x10]	; move count in rax
movzx	eax, byte [rax]		; move it in eax, get *base
test	al, al					; if 0
setne	al						; if no equal: al == 1 else al = 0 --> https://web.itu.edu.tr/kesgin/mul06/intel/instr/setne_setnz.html
movzx	eax, al				; move al in eax, 32 bits return value (int)
pop		rbp					; restore rbp
ret		; return
; End of assembler dump.


; gdb-peda$ disass char_to_numb
; Dump of assembler code for function char_to_numb:
;    0x0000000000003221 <+0>:     endbr64
;    0x0000000000003225 <+4>:     push   rbp
;    0x0000000000003226 <+5>:     mov    rbp, rsp
;    0x0000000000003229 <+8>:     mov    eax, edi
;    0x000000000000322b <+10>:    mov    qword [rbp-0x20], rsi
;    0x000000000000322f <+14>:    mov    byte [rbp-0x14], al
;    0x0000000000003232 <+17>:    mov    DWORD PTR [rbp-0x4], 0x0
;    0x0000000000003239 <+24>:    jmp    0x3255 <char_to_numb+52>
;    0x000000000000323b <+26>:    mov    rax, qword [rbp-0x20]
;    0x000000000000323f <+30>:    movzx  eax, byte [rax]
;    0x0000000000003242 <+33>:    cmp    byte [rbp-0x14], al
;    0x0000000000003245 <+36>:    jne    0x324c <char_to_numb+43>
;    0x0000000000003247 <+38>:    mov    eax, DWORD PTR [rbp-0x4]
;    0x000000000000324a <+41>:    jmp    0x3263 <char_to_numb+66>
;    0x000000000000324c <+43>:    add    DWORD PTR [rbp-0x4], 0x1
;    0x0000000000003250 <+47>:    add    qword [rbp-0x20], 0x1
;    0x0000000000003255 <+52>:    mov    rax, qword [rbp-0x20]
;    0x0000000000003259 <+56>:    movzx  eax, byte [rax]
;    0x000000000000325c <+59>:    test   al, al
;    0x000000000000325e <+61>:    jne    0x323b <char_to_numb+26>
;    0x0000000000003260 <+63>:    mov    eax, DWORD PTR [rbp-0x4]
;    0x0000000000003263 <+66>:    pop    rbp
;    0x0000000000003264 <+67>:    ret
; End of assembler dump

ft_is_space:
push   rbp
mov    rbp, rsp
mov    eax, edi				; save edit, char c in 32 bits in eax
mov    byte [rbp-0x4], al	; save char c in 0x4
cmp    byte [rbp-0x4], 0x8	; cmp char c with '\t'
jle    _is_space_last_cmp	; if lower equal
cmp    byte [rbp-0x4], 0xd	; cmp char c with '\r'
jle    _is_space_true		; if lower equal
_is_space_last_cmp:
cmp    byte [rbp-0x4], 0x20	; cmp char c with ' ' --> space
jne    _is_space_false
_is_space_true:
mov    eax, 0x1				; put one in return valule
jmp    _is_space_exit
_is_space_false:
mov    eax, 0x0				; put 0 in return value
_is_space_exit:
pop    rbp					; restore stack
ret
