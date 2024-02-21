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
movzx	eax, byte [rax]			; get byte (first char)
test	al, al					; test if 0
je		_char_in_base_end		; jump if equal
mov		rax, qword [rbp-0x10]	; else get base ptr in rax
movzx	eax, byte [rax]			; got byte again REALLY mandatory ???
cmp		byte [rbp-0x4], al		; cmp char c with given char --> c == *base
jne		_char_in_base_start		; if not equal jmp start --> continue while if c != *base

_char_in_base_end:
mov		rax, qword [rbp-0x10]	; move count in rax
movzx	eax, byte [rax]			; move it in eax, get *base
test	al, al					; if 0
setne	al						; if no equal: al == 1 else al = 0 --> https://web.itu.edu.tr/kesgin/mul06/intel/instr/setne_setnz.html
movzx	eax, al					; move al in eax, 32 bits return value (int)
pop		rbp						; restore rbp
ret
