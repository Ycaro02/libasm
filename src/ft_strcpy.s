BITS 64

section .text
	global ft_strcpy	; Function entry point

extern	ft_strlen

; rdi --> char * dest
; rsi --> char * src
; rcx --> size_t src_size 

ft_strcpy:						; ft_strcpy
	push		rdi				; push rdi on stack 1st args
	push		rsi				; push rsi on stack 2second args
	push		rcx				; push rcx on stack counter
	push		rdx				; second count

_strcpy_protect:
	cmp			rdi, 0x0		; rdi NULL
	je			_strcpy_exit
	cmp			rsi, 0x0		; rsi NULL	
	je			_strcpy_exit

_strcpy_init:
	call 		ft_strlen		; compute dest len
	mov			rdx, rax		; store len in rdx

	xchg		rdi, rsi		; exchange data between rsi and rdi
	call		ft_strlen		; call ft_strlen on rdi --> src, store result in rax
	xchg		rdi, rsi		; restore initiale rsi rdi data
	mov			rcx, rax		; store src_size in rcx
	
	cmp			rdx, rcx		; compare dest_len, src_len
	jl			_strcpy_exit	; jump lower exit

_strcpy_loop:
	cld							; clear direction flag
	xor			al, al			; set al to 0
	repz movsb					; repeat until *rdi != al -> '\0'
	mov			byte[rdi], 0x0	; need to put '\0'

_strcpy_exit:
	pop			rdx
	pop			rcx
	pop			rsi
	pop			rdi
	mov			rax, rdi		; return src pointer
	ret