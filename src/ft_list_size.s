BITS 64

section .text
	global ft_list_size		; Function entry poin`t

; RDI: lst list pointer on pointer 0x18
; count, counter to return 0x4
ft_list_size:					; ft_list_size label
	push	rbp							; push rbp to save it
	mov		rbp,rsp						; rsp = rbp
	mov		qword[rbp-0x18], rdi		; save rdi, lst pointer on stack
	mov		dword[rbp-0x4], 0x0			; create counter on stack, 0 for default value
	jmp		_lst_size_check				; jmp size check

_lst_size_loop:
	mov		rax, qword[rbp-0x18]		; save lst in rax
	mov		rax, qword[rax+0x8]			; increment it, go next
	mov		qword[rbp-0x18], rax		; save this pointer in stack
	add		dword[rbp-0x4], 0x1			; increment count

_lst_size_check:
	cmp    qword[rbp-0x18],0x0			; if lst == NULL
	jne    _lst_size_loop				; if not jmp to size loop
	mov    eax,dword[rbp-0x4]			; move return value in eax, eax = count
	pop    rbp							; restore rbp
	ret
