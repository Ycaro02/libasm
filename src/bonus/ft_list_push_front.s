BITS 64


; RDI: t_list** list		0x18
; RSI: void* data			0x20
; Local var t_list* node	0x8

section .text
	global ft_list_push_front		; Function entry point

extern ft_create_list_node

ft_list_push_front:

	push   rbp						; save rbp
	mov    rbp, rsp
	sub    rsp, 0x20				; alloc ox20 on stack
	mov    qword[rbp-0x18], rdi		; save rdi at 0x18
	mov    qword[rbp-0x20], rsi		; save rsi at 0x20
	cmp    qword[rbp-0x18], 0x0		; if lst == NULL
	je     _lst_push_front_exit
	cmp    qword[rbp-0x20], 0x0 	; if data == NULL
	je     _lst_push_front_exit
	mov    rax, qword[rbp-0x20]
	mov    rdi, rax
	call   ft_create_list_node
	mov    qword[rbp-0x8], rax		; move return value (allocated node) in 0x8
	mov    rax, qword[rbp-0x18]		; get lst
	mov    rdx, qword[rax]			; dereference it in rdx got *lst
	mov    rax, qword[rbp-0x8]		; get new node in rax
	mov    qword[rax], rdx			; node->next = *lst
	mov    rax, qword[rbp-0x18] 	; rax = lst
	mov    rdx, qword[rbp-0x8]		; rdx = node
	mov    qword[rax], rdx			; *lst = node
   
_lst_push_front_exit:
	mov rsp, rbp
	pop rbp							; restore stack pointer
	ret