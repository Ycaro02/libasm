BITS 64

global	ft_strcmp

ft_strcmp:
    push    rdi
    push    rsi
    push    rcx
	xor		rcx, rcx
	xor		rax, rax
    cmp		rdi, 0x0		      ; rdi NULL
	je		_strcmp_protect1      ; jump equal exit
    movzx   rax, byte[rdi + rcx]  ; str1[0] in rax for out error

_check_second_args:
    cmp		rsi, 0x0		        ; rdi NULL
	je		_strcmp_protect2        ; jump equal exit
    movzx   rdx, byte[rsi + rcx]    ; str2[0] in rdx for out error
    cmp     rdi, 0x0
    je      _strcmp_out

_compare:
	cmp		byte[rdi + rcx], 0	; if rdi[rcx] == '\0' --> ZF = 1
	jz		_strcmp_exit		; if zero flag
	cmp		byte[rsi + rcx], 0	; if rsi[rcx] == '\0' --> ZF = 1
	jz		_strcmp_exit		; if zero flag
	mov		al, byte[rsi + rcx]	; put rsi byte in al
	cmp		byte[rdi + rcx], al	; cmp byte
	jnz		_strcmp_exit		; if not zero flag, not same char
	inc		rcx			        ; else increment rcx
	jmp		_compare			; continue while


_strcmp_exit:
	movzx		rax, byte[rdi + rcx]	; get char in rax, rdx
	movzx		rdx, byte[rsi + rcx]	; get char in rax, rdx
    jmp         _strcmp_out


_strcmp_protect1:
    xor     rax, rax
    jmp     _check_second_args

_strcmp_protect2:
    xor     rdx, rdx     

_strcmp_out:
    pop    rcx
    pop    rsi
    pop    rdi
    sub		rax, rdx
	ret