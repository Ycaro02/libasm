BITS 64

; The __errno_location() function shall return:
; the address of the errno variable for the current thread.
section .text
	global ft_read	; Function entry point
	extern __errno_location

; rdi --> int fd
; rsi --> void * buff
; rdx --> size_t count

; ssize_t ft_read(int fd, const void *buf, size_t count);

ft_read:						; read
	mov			rax, 0x0		; 0 for read
	syscall
	cmp			rax, 0x0
	jl			_handle_erno
	ret

_handle_erno:
	neg			rax					; get positif error code
	push		rax					; save rax
	call		__errno_location WRT ..plt; call errno location see https://www.tortall.net/projects/yasm/manual/html/objfmt-elf64.html
	mov			rbx, rax			; rbx = rax, get return value in rbx (erno pointer)
	pop			rax					; restore rax
	mov			[rbx], rax			; update erno
	xor			rax, rax
	sub			rax, 0x1
	ret

