BITS 64

section .text
	global ft_strdup	; Function entry point

extern	ft_strlen
extern	ft_strcpy
extern  malloc

; rdi --> char *src --> src string to copy

ft_strdup:
    push rdi    ; save rdi
    push rcx    ; save rcx
    cmp rdi, 0x0    ; cmp rdi NULL
    je  _strdup_protect ; if NULL jmp
    call ft_strlen
    mov rcx, rax        ; store len in rcx
    ; now we got len but we need to mov this value in rdi for call malloc
    ; maybe we need to save rdi value on stack do dont lose str pointer (stored in rdi)
    ; just swap rdi, rcx, call malloc, got alloc address in rax
    ; switch again to reset register state, (string pointer in rdi)
    ; we can now loop on rdi string and copy byte in rax
_strdup_protect:
    mov rax, 0x1    ; set rax to 1 if rdi is NULL 

_strdup_exit:
    pop rcx
    pop rdi
    ret