BITS 64

section .text
	global ft_create_list_node

extern  malloc

; register	| type	| name	| def			| addr	| byte
; RDI		| void*	| lst	| data pointer	| 0x18	| 8
; Local var	| list*	| node	| str counter	| 0x8	| 8

ft_create_list_node:
	push   rbp						; save rbp
	mov    rbp, rsp					;
	sub    rsp, 0x20				; allocate 0x20 on stack
	mov    qword[rbp-0x18], rdi		; store lst head at 0x18
	mov    edi, 0x10				; mov sizeof t_list in rdi
	call   malloc  WRT ..plt		; call malloc
	mov    qword[rbp-0x8], rax		; store malloc return in node var 0x8
	cmp    qword[rbp-0x8], 0x0		; chec if 0 NULL
	jne    _list_node_init			; if no equal set value
	mov    eax, 0x0					; else eax = NULL
	jmp    _list_node_exit			; go exit

_list_node_init:
	mov    rax, qword[rbp-0x8]		; put node in rax
	mov    qword[rax+0x8], 0x0		; node->next = NULL 
	mov    rax, qword[rbp-0x8]		; put in node in rax
	mov    rdx, qword[rbp-0x18]		; put lst head pointer/addr in rdx
	mov    qword[rax], rdx			; node->data = rdx
	mov    rax, qword[rbp-0x8]		; set turen value = node

_list_node_exit:
	mov		rsp,rbp
	pop		rbp
	ret