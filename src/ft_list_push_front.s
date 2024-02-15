BITS 64

section .text
	global ft_list_push_front		; Function entry point

; RDI: HEAD list pointer on pointer 0x8
; RSI: pointer on data				0x10

ft_list_push_front:					; ft_list_push_front label
	push	rbp						; save rbp
	mov		rbp,rsp					; set my own rbp
	mov		qword[rbp-0x8], rdi		; store rdi on stack
	mov		qword[rbp-0x10], rsi	; store rsi on stack
	cmp		qword[rbp-0x8], 0x0		; if head is NULL
	je		_lst_push_front_exit	; jump exit 
	cmp		qword[rbp-0x10], 0x0	; if data is NULL
	je		_lst_push_front_exit	; jump exit
	mov		rax,qword[rbp-0x8]		; rax = HEAD
	mov		rdx,qword[rax]			; rdx = rax
	mov		rax,qword[rbp-0x10]		; rax = rbp-0x10 ---> data
	mov		qword[rax+0x8], rdx		; rax + ptr size = rdx ---> data->next = HEAD
	mov		rax,qword[rbp-0x8]		; rax = rbp-0x8 ---> data = HEAD
	mov		rdx,qword[rbp-0x10]		; rdx = rbp - 0x10 ----> head = data
	mov		qword[rax], rdx			; move rdx(head) in rax

_lst_push_front_exit:
	pop rbp
	ret
