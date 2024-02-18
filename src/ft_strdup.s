BITS 64

section .text
	global ft_strdup	; Function entry point

extern	ft_strlen
extern	ft_strcpy
extern  malloc
; https://www.cs.uaf.edu/2010/fall/cs301/lecture/10_04_malloc.html malloc call assembly
; rdi --> char *src --> src string to copy

ft_strdup:
    push		rdi             	; save rdi on stack (str ptr)
    cmp			rdi, 0x0        	; cmp rdi NULL
    je			_strdup_error 		; if NULL jmp
    call		ft_strlen

; now we got len but we need to mov this value in rdi for call malloc
_strdup_alloc:
    mov			rdi, rax	    	; get len in rdi
    add			rdi, 0x1        	; one add byte to RDI for '\0'
    push		rdi             	; save rdi on stack (len value) cause malloc reset/change lot of register
    call		malloc  WRT ..plt   ; call malloc with RDI args, len + 1
    pop			rcx                 ; got back str len value
    cmp			rax, 0x0            ; malloc return addr is now in RAX if malloc return NULL
    je			_strdup_error
    sub			rcx, 0x1    		; avoid invalid write
    mov			rdi, rax    		; put malloc in rdi
    pop			rsi         		; get back string ptr
    push		rdi         		; save head of malloc addr

; RCX: str len
; RSI: MALLOC ADDR
; RDI: ADDR str to copy
_strdup_loop:
	cld								; clear direction flag
	xor			al, al				; set al to 0
	repz		movsb				; repeat while zero, until the count register (CX) or the zero flag (ZF) matches a tested condition
	mov			byte[rdi], 0x0		; need to put '\0' at the end of string

_strdup_exit:
    pop			rax             	; get head of malloc addr
    ret

_strdup_error:
    pop			rdi
    mov			rax, 0x0    		; set rax to 0 beforer error ret
    ret