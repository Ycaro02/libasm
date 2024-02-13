section .text
	global ft_strlen	; set entry point

ft_strlen:			; int strlen(char *s);
	mov rax, 0		; put 0 in rax (contained the return  value)
	ret
