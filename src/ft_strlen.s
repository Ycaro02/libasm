BITS 64

section .text
	global ft_strlen				; Function entry point

ft_strlen:							; int strlen(char *s);
	push			rdi				; push rdi on stack to save it
	xor				rcx, rcx		; initial value 0, for blank or null string 
	cmp				rdi, 0x0		; rdi NULL
	je				_ft_strlen_exit ; jump equal exit
	sub				rcx, 0x1		; rcx -= 1 to enter in while, rcx = 0xfffffffffffff

_ft_strlen_loop:
	cld								; clear DIRECTION FLAG
	xor				al, al			; Set al to 0
	repnz	scasb					; CORE instruction repeat until *rdi != al, decrement rcx, increment rdi each iteration
	not				rcx				; reverse rcx
	sub				rcx, 1			; rcx -= 1

_ft_strlen_exit:
	mov 			rax, rcx		; put return value in rax
	pop 			rdi				; pop rdi from stack
	ret