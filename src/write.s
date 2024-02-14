BITS 64

; The __errno_location() function shall return:
; the address of the errno variable for the current thread.
section .text
	global ft_write	; Function entry point
	extern __errno_location

; rdi --> int fd
; rsi --> void * buff
; rdx --> size_t count ?? 

; ssize_t ft_write(int fd, const void *buf, size_t count);

ft_write:						; write
	mov			rax, 0x1		; 1 for write
	syscall
	cmp			rax, 0x0
	jl			_handle_erno
	ret

_handle_erno:
	neg			rax				; get positif error code
	push		rax				; save rax
	call		__errno_location	; calle errno location
	mov			rbx, rax			; rbx = rax, get return value in rbx
	pop			rax					; restore rax
	mov			[rbx], rax			; update erno
	mov			rax, -1
	ret

