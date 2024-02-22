BITS 64

; The __errno_location() function shall return:
; the address of the errno variable for the current thread.
section .text
	global ft_write	; Function entry point
	extern __errno_location

; rdi --> int fd
; rsi --> void * buff
; rdx --> size_t count ?? 

ft_write:						; ssize_t ft_write(int fd, const void *buf, size_t count);
	mov			rax, 0x1		; 1 for write syscall value
	syscall
	cmp			rax, 0x0		; cmp if NULL
	jl			_handle_erno	; jump lower
	ret

_handle_erno:
	neg			rax				; get positif error code
	push		rax				; save rax
	call		__errno_location WRT ..plt; call errno location see https://www.tortall.net/projects/yasm/manual/html/objfmt-elf64.html
	pop			rdx				; get back rax value (error code pushed on stack before call)
	mov			[rax], rdx
	mov			rax, -1
	ret
