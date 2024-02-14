BITS 64
;   Algo
;   prepare register

section .text
	global ft_strcmp	; Function entry point

ft_strcmp:			;

    push	rbp			    ; Save the stack frame of caller, pushed on stack 
    ; RBP = RSP
    mov 	rbp, rsp	    ; Set my own stack frame 

_ft_strcmp_protect:
    cmp		rdi, 0x0		; rdi NULL
	je		_ft_strcmp_exit ; jump equal exit
    cmp		rsi, 0x0		; rdi NULL
	je		_ft_strcmp_exit ; jump equal exit

    mov     qword [rbp-0x20], rsi ; Put rsi at rbp - 32
    mov     qword [rbp-0x18], rdi ; Put rdi at rbp - 24
	mov     dword [rbp-0x8], 0x0  ; int i = 0 
	mov     dword [rbp-0x4], 0x0  ; int j = 0 
    ; rbp - 0x20 --> RSI
    ; rbp - 0x18 --> RDI
    ; rbp - 0x8  --> i counter
    ; rbp - 0x4  --> j counter


_ft_strcmp_exit:
    pop 	rbp			; Pop rbp to restore stack
    ret

