BITS 64

; RDI, EDI : char c 0x4

section .text
	global ft_is_space

ft_is_space:
	push   rbp
	mov    rbp, rsp
	mov    eax, edi				; save edit, char c in 32 bits in eax
	mov    byte [rbp-0x4], al	; save char c in 0x4
	cmp    byte [rbp-0x4], 0x8	; cmp char c with '\t'
	jle    _is_space_last_cmp	; if lower equal
	cmp    byte [rbp-0x4], 0xd	; cmp char c with '\r'
	jle    _is_space_true		; if lower equal

_is_space_last_cmp:
	cmp    byte [rbp-0x4], 0x20	; cmp char c with ' ' --> space
	jne    _is_space_false

_is_space_true:
	mov    eax, 0x1				; put one in return valule
	jmp    _is_space_exit

_is_space_false:
	mov    eax, 0x0				; put 0 in return value

_is_space_exit:
	pop    rbp					; restore stack
	ret