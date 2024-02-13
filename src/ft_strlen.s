section .text
	global ft_strlen	; set entry point

ft_strlen:			; int strlen(char *s);
	;push	rbp			; Save the stack frame of caller, pushed on stack 
	;mov 	rbp, rsp	; Set my own stack frame
	;pop 	rbp			; Pop rbp to restore stack

	push	rdi				; push rdi on stack to save it
	push	rcx				; push rcx on stack
	xor		rcx, rcx		; initial value 0, for blank or null string 
	cmp		rdi, 0x0		; rdi NULL
	; cmp		BYTE [rdi], 0	; if *rdi == 0
	je		_ft_strlen_exit ; jump equal exit
	mov		rcx, -1			; rcx - 1 to enter in while, rcx = 0xfffffffffffff

_ft_strlen_loop:
	cld						; clear direction
	xor		al, al			; Set al to 0
	;repnz means "repeat until zero flag is not set and cx is not zero"
	repnz	scasb			; repeat scasb *rdi != al, decrement rcx each iteration
	not		rcx				; reverse rcx
	sub		rcx, 1			; rcx -= 1
	; jl _ft_strlen_loop		; jump if lower


_ft_strlen_exit:
	mov rax, rcx		; put return value in rax
	pop rdi				; pop rdi from stack
	pop rcx
	ret