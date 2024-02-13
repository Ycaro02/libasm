section .text
	global ft_strlen	; set entry point

ft_strlen:			; int strlen(char *s);
	push	rbp		; Save the stack frame of caller, pushed on stack 
	mov 	rbp, rsp	; Set my own stack frame
	pop 	rbp			; Pop rbp to restore stack
	mov 	rax, 42		; put 0 in rax (contained the return  value)
	ret