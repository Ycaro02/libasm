BITS 64

section .text
	global ft_list_remove_if
; register		type		var_name	addr	(subs to rbp)
; RDI			t_list**	list		0x18
; RSI			void*		data		0x20
; RDX			func*		cmp			0x28
; RCX			func* 		free_fct	0x30
list_remove_if:
	push		rbp							; save rbp
	mov			rbp, rsp					; load rsb in rbp
	sub			rsp, 0x30					; 'alloc' 0x30 (48 bytes on stack)
	mov			qword[rbp-0x18], rdi		; save rdi value
	mov			qword[rbp-0x20], rsi		; save rsi value
	mov			qword[rbp-0x28], rdx		; save rdx value
	mov			qword[rbp-0x30], rcx		; save rcx value
	mov			qword[rbp-0x8], 0x0
	mov			qword[rbp-0x10], 0x0
	cmp			qword[rbp-0x18], 0x0
	je			_list_remove_if_exit
	cmp			qword[rbp-0x28], 0x0
	je			_list_remove_if_exit
	cmp			qword[rbp-0x30], 0x0
	je			_list_remove_if_exit
	cmp			qword[rbp-0x20], 0x0
	je			_list_remove_if_exit
	mov			rax, qword[rbp-0x18]
	mov			rax, qword[rax]
	mov			qword[rbp-0x10], rax
	cmp			qword[rbp-0x10], 0x0
	je			_list_remove_if_end
	mov			rax, qword[rbp-0x10]
	mov			rax, qword[rax]
	mov			rdx, qword[rbp-0x20]
	mov			rcx, qword[rbp-0x28]
	mov			rsi, rdx
	mov			rdi, rax
	mov			eax, 0x0
	call		rcx
	cmp			eax, 0x1
	jne			_list_remove_if_end
	mov			rax, qword[rbp-0x18]
	mov			rax, qword[rax]
	mov			rdx, qword[rax+0x8]
	mov			rax, qword[rbp-0x18]
	mov			qword[rax], rdx
	mov			rax, qword[rbp-0x10]
	mov			rax, qword[rax]
	mov			rdx, qword[rbp-0x30]
	mov			rdi, rax
	call		rdx
	mov			rax, qword[rbp-0x10]
	mov			rdi, rax
	call		<free@plt> ; TODO replace by ptr on free funct
	mov			rax, qword[rbp-0x18]
	mov			rax, qword[rax]
	mov			qword[rbp-0x10], rax
	jmp			_list_remove_if_end
_list_remove_if_loop:
	mov			rax, qword[rbp-0x10]
	mov			rax, qword[rax+0x8]
	test		rax, rax
	je			_list_remove_if_next
	mov			rax, qword[rbp-0x10]
	mov			rax, qword[rax+0x8]
	mov			rax, qword[rax]
	mov			rdx, qword[rbp-0x20]
	mov			rcx, qword[rbp-0x28]
	mov			rsi, rdx
	mov			rdi, rax
	mov			eax, 0x0
	call		rcx
	cmp			eax, 0x1
	jne			_list_remove_if_next
	mov			rax, qword[rbp-0x10]
	mov			rax, qword[rax+0x8]
	mov			qword[rbp-0x8], rax
	mov			rax, qword[rbp-0x10]
	mov			rax, qword[rax+0x8]
	mov			rdx, qword[rax+0x8]
	mov			rax, qword[rbp-0x10]
	mov			qword[rax+0x8], rdx
	mov			rax, qword[rbp-0x8]
	mov			rax, qword[rax]
	mov			rdx, qword[rbp-0x30]
	mov			rdi, rax
	call		rdx
	mov			rax, qword[rbp-0x8]
	mov			rdi, rax
	call		<free@plt> ; TODO replace by ptr on free funct maybe just call rbp-0x30
	jmp			_list_remove_if_end
_list_remove_if_next:
	mov			rax, qword[rbp-0x10]
	mov			rax, qword[rax+0x8]
	mov			qword[rbp-0x10], rax
_list_remove_if_end:
	cmp			qword[rbp-0x10], 0x0
	jne			_list_remove_if_loop
_list_remove_if_exit:
	leave		 ; TODO replace by pop and restore rsb
	ret