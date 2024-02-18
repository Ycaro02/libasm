BITS 64

section .text
	global ft_list_size		; Function entry poin`t

; RDI: lst list pointer on pointer 0x14
; RCX counter

ft_list_size:					; ft_list_size label
	push 	rbp
	mov		rbp,rsp						; rsp = rbp
	mov		qword[rbp-0x14], rdi		; save rdi, lst pointer on stack
	xor		rcx, rcx					; rcx = 0 use it like counter
	jmp		_lst_size_check				; jmp size check

_lst_size_loop:
	mov		rax, qword[rbp-0x14]		; save lst in rax
	; mov		rax, qword[rax]				; go next field get lst->next
	mov		rax, qword[rax+0x8]				; go next field get lst->next
	mov		qword[rbp-0x14], rax		; save this pointer in stack lst = lst->next
	add		rcx, 0x1

_lst_size_check:
	cmp		qword[rbp-0x14],0x0			; if lst == NULL
	jne		_lst_size_loop				; if not jmp to size loop
	mov		rax, rcx					; move return value in eax, eax = count
	pop		rbp
	ret
