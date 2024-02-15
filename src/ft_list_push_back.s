BITS 64

section .text
	global ft_list_push_back		; Function entry point

; RDI: pointer on pointer on lst head	0x18
; RSI: pointer on data					0x20
; current pointer on lst				0x8

ft_list_push_back:					; ft_list_push_back label
   push   rbp
   mov    rbp, rsp
   mov    qword[rbp-0x18], rdi
   mov    qword[rbp-0x20], rsi
   mov    qword[rbp-0x8], 0x0		; create tmp to iter on lst without lose head stored in 0x18
   cmp    qword[rbp-0x20], 0x0		; if data is NULL
   je     _lst_push_back_exit
   mov    rax, qword[rbp-0x18]		; get lst head
   mov    rax, qword[rax]			; dereference it
   test   rax, rax					; test if 0
   jne    _lst_push_back_loop				; if not jump
   mov    rax, qword[rbp-0x18]		; get lst head again
   mov    rdx, qword[rbp-0x20]		; get data in rdx
   mov    qword[rax], rdx			; dereference rax to put rdx, *lst = data
   jmp    _lst_push_back_exit 		; go exit
   
   _lst_push_back_loop:
   mov    rax, qword[rbp-0x18]		; again just get head
   mov    rax, qword[rax]			; dereference it in rax
   mov    qword[rbp-0x8], rax		; put this node in tmp
   jmp    _lst_push_back_check
   
   _lst_push_back_next:
   mov    rax, qword[rbp-0x8]		; put tmp in rax
   mov    rax, qword[rax+0x8]		; go next
   mov    qword[rbp-0x8], rax		; save value in tmp
   
   _lst_push_back_check:
   mov    rax, qword[rbp-0x8]		; put tmp in rax
   mov    rax, qword[rax+0x8]		; go next with + 8
   test   rax, rax					; test if 0
   jne    _lst_push_back_next		; if no equal jmp 
   mov    rax, qword[rbp-0x8]		; put tmp in rax, need to acces at tmp->next later
   mov    rdx, qword[rbp-0x20]		; put data in rdx
   mov    qword[rax+0x8], rdx		; put data in tmp->next, current->next = data
   jmp _lst_push_back_exit   
   
   _lst_push_back_exit:
   pop    rbp
   ret