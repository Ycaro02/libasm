BITS 64

section .text
	global ft_list_push_back		; Function entry point

extern ft_create_list_node

; RDI: pointer on pointer on lst head	0x18
; RSI: pointer on data					0x20
; current pointer on lst				0x10
; new node to add back					0x8

ft_list_push_back:						; ft_list_push_back label
	push   rbp							
	mov    rbp, rsp
	sub    rsp, 0x20
	mov    qword[rbp-0x18], rdi
	mov    qword[rbp-0x20], rsi
	mov    qword[rbp-0x10], 0x0			; create tmp to iter on lst without lose head stored in 0x18
	cmp    qword[rbp-0x20], 0x0			; if data is NULL
	je     _lst_push_back_exit
	mov    rdi, qword[rbp-0x20]			; put data in rdi for function call			
	call   ft_create_list_node
	mov    qword[rbp-0x8], rax			; put return of function in 0x8 (node allocated and set with data)
	mov    rax, qword[rbp-0x18]			; get lst head
	mov    rax, qword[rax]				; dereference it get *lst
	test   rax, rax						; test if NULL
	jne    _lst_push_back_loop
	mov    rax, qword[rbp-0x18]			; get lst
	mov    rdx, qword[rbp-0x8]			; get new node
	mov    qword[rax], rdx				; *lst = new_node
	jmp    _lst_push_back_exit			; go exit

_lst_push_back_loop:
	mov    rax, qword[rbp-0x18]			; get lst
	mov    rax, qword[rax]				; dereference get *lst
	mov    qword[rbp-0x10], rax			; current = *lst
	jmp    _lst_push_back_check			; go check

_lst_push_back_next:
	mov    qword[rbp-0x10], rax			; current = current->next

_lst_push_back_check:
	mov    rax, qword[rbp-0x10]			; get current in rax
	; mov    rax, qword[rax]				; go current->next
	mov    rax, qword[rax+0x8]				; go current->next
	test   rax, rax						; test if NULL
	jne    _lst_push_back_next			; if not null got store this
	mov    rax, qword[rbp-0x10]			; get current in rax
	mov    rdx, qword[rbp-0x8]			; get new_node in rdx
	mov    qword[rax], rdx				; *lst = new_node

_lst_push_back_exit:
	mov    rsp, rbp						; restore stack
	pop	   rbp
	ret