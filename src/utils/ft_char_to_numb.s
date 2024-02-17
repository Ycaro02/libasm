BITS 64

; RDI, EDI :		0x14		char c
; RSI: 				0x20	char *base
; int i:			0x4		count i

section .text
	global ft_char_to_numb

ft_char_to_numb:
push	rbp
mov		rbp, rsp
mov		eax, edi				; move 32 bits edi in eax (for char c save)
mov		qword [rbp-0x20], rsi	; save base ptr at 0x20
mov		byte [rbp-0x14], al		; save char c 0x14
mov		dword [rbp-0x4], 0x0	; int i 0x4 = 0
jmp		_char_numb_test

_char_numb_start:
mov		rax, qword [rbp-0x20]	; move base ptr in eax, get base ptr
movzx	eax, byte [rax]			; get first char *base
cmp		byte [rbp-0x14], al		; cmp char c and *base
jne		_char_numb_inc			; if no equal go increment
mov		eax, dword [rbp-0x4]	; else move counter in eax go exit
jmp		_char_numb_exit

_char_numb_inc:
add		dword [rbp-0x4], 0x1	; increment counter
add		qword [rbp-0x20], 0x1	; increment string base ptr

_char_numb_test:
mov		rax, qword [rbp-0x20]	; get base ptr
movzx	eax, byte [rax]			; get first char *base
test	al, al					; test if 0
jne		_char_numb_start		; if no equal continue while
mov		eax, dword [rbp-0x4]	; move counter in eax for return value

_char_numb_exit:
pop		rbp		
ret				; return
