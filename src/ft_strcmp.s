BITS 64

section .text
	global	ft_strcmp

ft_strcmp:
    push        rdi                         ; push rdi to save it
    push        rsi                         ; push rsi to save it
    push        rcx                         ; push rcx to save it
	xor		    rcx, rcx                    ; rcx = 0
    cmp		    rdi, 0x0		            ; rdi NULL
	je		    _strcmp_protect1            ; jump equal exit
    movzx       rax, byte[rdi + rcx]        ; str1[0] in rax for out error

_strcmp_rdi_check:
    cmp		    rsi, 0x0		            ; rdi NULL
	je		    _strcmp_protect2            ; jump equal exit
    movzx       rdx, byte[rsi + rcx]        ; str2[0] in rdx for out error
    cmp         rdi, 0x0
    je          _strcmp_exit

_strcmp_compare:
	cmp		    byte[rdi + rcx], 0	        ; if str1[rcx] == 0
	jz		    _strcmp_get_last_char		; jump if zero flag
	cmp		    byte[rsi + rcx], 0	        ; if str2[rcx] == 0
	jz		    _strcmp_get_last_char		; jump if zero flag
	mov		    al, byte[rsi + rcx]	        ; put rsi byte in al
	cmp		    byte[rdi + rcx], al	        ; compare byte/char
	jnz		    _strcmp_get_last_char		; if not zero flag, not same char
	inc		    rcx			                ; else increment rcx
	jmp		    _strcmp_compare			    ; continue while


_strcmp_get_last_char:
	movzx		rax, byte[rdi + rcx]	    ; get char in rax, rdx
	movzx		rdx, byte[rsi + rcx]	    ; get char in rax, rdx
    jmp         _strcmp_exit


_strcmp_protect1:
    xor         rax, rax                    ; give default value for rax if str1 == NULL
    jmp         _strcmp_rdi_check

_strcmp_protect2:
    xor         rdx, rdx                    ; give default value for rdx if str2 == NULL 

_strcmp_exit:
    pop         rcx                         ; retore register value
    pop         rsi                         ; retore register value
    pop         rdi                         ; retore register value
    sub		    rax, rdx                    ; sub rdx to rax and get return value in rax
	ret