section .text
	global ft_strcpy	; Function entry point
	extern	ft_strlen

ft_strcpy:			; int strlen(char *s);
	push	rdi				; push rdi on stack 1st args
	push	rsi				; push rci on stack 2second args
	push	rcx				; push rcx on stack counter
	xor		rcx, rcx		; initial value 0, for blank or null string 
	cmp		rdi, 0x0		; rdi NULL
	je		_ft_strcpy_exit
	cmp		rsi, 0x0		; rsi NULL	
	je		_ft_strcpy_exit


_ft_strcpy_exit:
	pop		rcx
	pop		rsi
	pop		rdi
	ret