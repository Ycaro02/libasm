BITS 64

; void ft_list_sort(t_list **begin_list, int (*cmp)());

; RDI:		**begin_list 	----->	 	: 0x28
; RSI: int	*cmp, fun ptr	-----> 		: 0x30
; Current:	t_list *current	----->		: 0x10
; Next:		t_list *next	----->		: 0x18
; tmp		void *tmp		----->		: 0x8
section .text
	global	ft_list_sort

ft_list_sort:
	push		rbp						; save rbp
	mov			rbp, rsp				; set my own rbp
	sub			rsp, 0x30				; sub 0x30 (48 byte)
	mov			qword[rbp-0x28], rdi	; **begin_lst in 0x28
	mov			qword[rbp-0x30], rsi	; *cmp in 0x30
	
	cmp			qword[rbp-0x30], 0x0	; compare cmp and null
	je			_exit_label
	
	cmp			qword[rbp-0x28], 0x0	; compare **begin_lst and null
	je			_exit_label
	
	mov			rax, qword[rbp-0x28]	; **begin_lst in rax
	mov			rax, qword[rax]			; dereference it : *begin_lst
	test		rax, rax				; test if null
	je			_exit_label
	
	mov			qword[rbp-0x10], rax	; put rax (*begin_lst) in 0x10 (current)
	mov			qword[rbp-0x18], rax	; init current with same value
	jmp			_list_sort_loop_check

  _list_sort_loop:
	mov			rax, qword[rbp-0x10]	; put current in rax
	mov			rax, qword[rax+0x8]		; rax = current->next
	mov			qword[rbp-0x18], rax	; store this in next ---> next = current->next
	
	mov			rax, qword[rbp-0x10]	; put current in rax
	mov			rdx, qword[rax]			; get current->data in rdx
	
	mov			rax, qword[rbp-0x18]	; put next in rax
	mov			rax, qword[rax]			; get next->data in rax

	mov			rcx, qword[rbp-0x30]	; put *cmp, function ptr in rcx
	; setup args for cmp call
	mov			rsi, rdx				; mov rdx (current->data) in rsi for next CALL
	mov			rdi, rax				; mov rax (next->data) in rdi for next CALL
	mov			eax, 0x0				; set eax to 0 (return of call will be in eax)
	call		rcx						; call cmp function
	test		eax, eax				; if return value is 0
	jg			_list_sort_inc_next		; jump if greater 
	; if lower or equal
	mov			rax, qword[rbp-0x10]	; put current in rax
	mov			rax, qword[rax]			; get current data
	mov			qword[rbp-0x8], rax		; save this data in tmp --> tmp_data = current->data
	
	mov			rax, qword[rbp-0x18]	; put next in rax
	mov			rdx, qword[rax]			; get next data in rdx
	
	mov			rax, qword[rbp-0x10]	; put current in rax
	mov			qword[rax], rdx			; current->data = next->data
	
	mov			rax, qword[rbp-0x18]	; put next in rax
	mov			rdx, qword[rbp-0x8]		; put save data (tmp) in rdx
	mov			qword[rax], rdx			; next->data = tmp
	mov			rax, qword[rbp-0x28]	; put **lst in rax
	mov			rax, qword[rax]			; rax = *lst
	mov			qword[rbp-0x10], rax	; current = *lst
	jmp			_list_sort_loop_check

  _list_sort_inc_next:
	mov			rax, qword[rbp-0x18]	; rax = next
	mov			qword[rbp-0x10], rax	; current = next
   
   _list_sort_loop_check:
	cmp			qword[rbp-0x18], 0x0	; if next == NULL
	je			_exit_label
	cmp			qword[rbp-0x10], 0x0	; if current == NULL
	je			_exit_label
	mov			rax, qword[rbp-0x10]	; store current in rax
	mov			rax, qword[rax+0x8]		; increment to next field (current->next)
	test		rax, rax				; test if current->next == NULL
	jne			_list_sort_loop			; if not null jump to loop

_exit_label:
	mov			rsp, rbp				; restore rsp
	pop			rbp						; restore rbp
	ret
