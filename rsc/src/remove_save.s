section .text
	global ft_list_remove_if
; register		type		var_name	addr	(subs to rbp)
; RDI			t_list**	list		0x18
; RSI			void*		data		0x20
; RDX			func*		cmp			0x28
; RCX			func* 		free_fct	0x30
; STACK			t_list*		tmp			0x8
; STACK			t_list*		current		0x10
ft_list_remove_if:
	push		rbp							; save rbp
	mov			rbp, rsp					; load rsb in rbp
	sub			rsp, 0x30					; 'alloc' 0x30 (48 bytes on stack)
	mov			qword[rbp-0x18], rdi		; save rdi value
	mov			qword[rbp-0x20], rsi		; save rsi value
	mov			qword[rbp-0x28], rdx		; save rdx value
	mov			qword[rbp-0x30], rcx		; save rcx value
	mov			qword[rbp-0x8], 0x0			; set tmp to 0x0
	mov			qword[rbp-0x10], 0x0		; set current to 0x0 null
	cmp			qword[rbp-0x18], 0x0		; if !list
	je			_list_remove_if_exit
	cmp			qword[rbp-0x28], 0x0		; if !cmp
	je			_list_remove_if_exit
	cmp			qword[rbp-0x30], 0x0		; if !free_fct
	je			_list_remove_if_exit
	cmp			qword[rbp-0x20], 0x0		; if !data_ref
	je			_list_remove_if_exit
	mov			rax, qword[rbp-0x18]		; put list in rax
	mov			rax, qword[rax]				; dereference it got *list
	mov			qword[rbp-0x10], rax		; put *list in current 
	cmp			qword[rbp-0x10], 0x0		; if !(*list) ----> if !current
	je			_list_remove_if_end_loop



	mov			rax, qword[rbp-0x10]		; put current in rax, he is already here ???
	mov			rax, qword[rax]				; get data
	mov			rdx, qword[rbp-0x20]		; put data_ref in rdx 
	mov			rcx, qword[rbp-0x28]		; get cmp function ptr in rcx
	mov			rsi, rdx					; put data_ref in rsi (second args)
	mov			rdi, rax					; put current->data in rdi (first args)
	mov			eax, 0x0					; reset eax before call
	call		rcx							; call cmp(current->data, data_ref)
	cmp			eax, 0x1					; check if ret == 1
	jne			_list_remove_if_end_loop	; if != 1 go end loop else :
	mov			rax, qword[rbp-0x18]		; get list in rax
	mov			rax, qword[rax]				; dereference it got *list
	mov			rdx, qword[rax+0x8]			; get *list->next in rdx
	mov			rax, qword[rbp-0x18]		; put list in rax
	mov			qword[rax], rdx				; dereference it and move rdx ---> *list = (*list)->next;
	mov			rax, qword[rbp-0x10]		; put current in rax
	mov			rax, qword[rax]				; get data
	mov			rdx, qword[rbp-0x30]		; put free function ptr in rdx
	mov			rdi, rax					; put current data in rdi
	call		rdx							; call free_fct(current->data)
	mov			rax, qword[rbp-0x10]		; put current in rax
	mov			rdi, rax					; put this in rdi for function call
	mov			rdx, qword[rbp-0x30]		; put free function ptr in rdx realy mandatory ??
	call		rdx							; call free_fct(current->data)
	; call		<free@plt> ; TODO replace by ptr on free funct
	mov			rax, qword[rbp-0x18]		; put list in rax
	mov			rax, qword[rax]				; dereference it
	mov			qword[rbp-0x10], rax		; current = *list
	jmp			_list_remove_if_end_loop

_list_remove_if_loop:
	mov			rax, qword[rbp-0x10]		; put current in rax
	mov			rax, qword[rax+0x8]			; go next
	test		rax, rax					; if 0
	je			_list_remove_if_next
	mov			rax, qword[rbp-0x10]		; same here get current and go next 
	mov			rax, qword[rax+0x8]
	mov			rax, qword[rax]				; get data current->next->data, direct in rdi ?
	mov			rdx, qword[rbp-0x20]		; put data_ref in rdx ?? rsi no ? 
	mov			rcx, qword[rbp-0x28]		; put cmp function in rcx
	mov			rsi, rdx					; put data un rsi
	mov			rdi, rax					; put data in rdi
	mov			eax, 0x0					; reset eax
	call		rcx							; call cmp(current->next->data, data_ref)
	cmp			eax, 0x1					; check if == 1 
	jne			_list_remove_if_next		; jump if no equal (continue iterate)
	mov			rax, qword[rbp-0x10]		; put current in rax
	mov			rax, qword[rax+0x8]			; go next
	mov			qword[rbp-0x8], rax			; store it in tmp
	mov			rax, qword[rbp-0x10]		; put current in rax
	mov			rax, qword[rax+0x8]			; go next
	mov			rdx, qword[rax+0x8]			; go next again store in rdx
	mov			rax, qword[rbp-0x10]		; put current in rax
	mov			qword[rax+0x8], rdx			; current->next = current->next->next
	mov			rax, qword[rbp-0x8]			; put tmp in rax
	mov			rax, qword[rax]				; get data, in rdi ???
	mov			rdx, qword[rbp-0x30]		; free function in rdx
	mov			rdi, rax					; put tmp->data in rdi 
	call		rdx							; call free_fct(tmp->data)
	mov			rax, qword[rbp-0x8]			; move tmp in rax
	mov			rdi, rax					; put it in rdi
	mov			rdx, qword[rbp-0x30]		; free function in rdx
	call		rdx							; call free_fct(tmp->data)
	; call		<free@plt> ; TODO replace by ptr on free funct maybe just call rbp-0x30
	jmp			_list_remove_if_end_loop

_list_remove_if_next:
	mov			rax, qword[rbp-0x10]		; put current in rax
	mov			rax, qword[rax+0x8]			; got next
	mov			qword[rbp-0x10], rax		; save it in current stack addr

_list_remove_if_end_loop:
	cmp			qword[rbp-0x10], 0x0		; if current == NULL
	jne			_list_remove_if_loop		; jump if no equal


; leave		 ; TODO replace by pop and restore rsb

_list_remove_if_exit:
	mov			rsp, rbp
	pop			rbp							; restore stack frame
	ret
