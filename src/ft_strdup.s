BITS 64

section .text
	global ft_strdup	; Function entry point

extern	ft_strlen
extern	ft_strcpy
extern  malloc
; https://www.cs.uaf.edu/2010/fall/cs301/lecture/10_04_malloc.html malloc call assembly
; rdi --> char *src --> src string to copy

ft_strdup:
    push        rdi    ; save rdi
    push        rsi
    push        rcx    ; save rcx
    cmp         rdi, 0x0    ; cmp rdi NULL
    je          _strdup_protect ; if NULL jmp
    call        ft_strlen
    mov         rcx, rax        ; store len in rcx
    
_strdup_alloc:
    ; now we got len but we need to mov this value in rdi for call malloc
    ; maybe we need to save rdi value on stack do dont lose str pointer (stored in rdi)
	
    xchg        rdi, rcx		; exchange data between rdi and rcx, str ptr is now in RCX and len in RDI
    add         rdi, 0x1       ; one add byte to RDI for '\0'
    
    mov         rsi, rcx       ; store str addr in RSI for next call to movsb

    call        malloc  WRT ..plt   ; call malloc with RDI args, len + 1
    cmp         rax, 0x0    ; malloc return addr is now in RAX if malloc return NULL
    je          _strdup_exit

    mov         rcx, rdi    ; restore len in rcx for while (repz instruction)

    mov         rdi, rax    ; put malloc in rdi
    xchg		rdi, rsi ; exchange data, str need to be in rdi and malloc addr in rsi

; RCX: str len
; RSI: MALLOC ADDR
; RDI: ADDR str to copy
_strdup_loop:
	cld							; clear direction flag
	xor			al, al			; set al to 0
	repz movsb					; repeat until *rdi != al -> '\0'
	mov			byte[rdi], 0x0	; need to put '\0' at the end of string

_strdup_exit:
    pop rcx
    pop rsi
    pop rdi
    ret

_strdup_protect:
    mov rax, 0x1    ; set rax to 1 if rdi is NULL
    jmp _strdup_alloc 