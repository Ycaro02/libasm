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

_strcpy_protect:
	cmp			rdi, 0x0		; rdi NULL
	je			_strcpy_exit
	cmp			rsi, 0x0		; rsi NULL	
	je			_strcpy_exit

_strcpy_init:
	xchg		rdi, rsi		; exchange data between rsi and rdi
	call		ft_strlen		; call ft_strlen on rdi --> src, store result in rax
	xchg		rdi, rsi		; restore initiale rsi rdi data
	mov			rcx, rax		; store src_size in rcx
	
_strcpy_loop:
	cld							; clear direction flag
	xor			al, al			; set al to 0
	repz movsb					; repeat until *rdi != al -> '\0'
	mov			byte[rdi], 0x0	; need to put '\0' at the end of string

_strcpy_exit:
	pop			rcx
	pop			rsi
	pop			rdi
	mov			rax, rdi		; return src pointer
	ret

;This case is undefined behaviors and cause segfault strcpy("", "hey"): 
;man strcpy 3:
;These  functions  copy  the string pointed to by src, into a string at the buffer pointed to by dst.  The programmer is responsible for allocating a
;destination buffer large enough, that is, strlen(src) + 1
;Subject:
;Your functions should not quit unexpectedly (segmentation fault, bus error, double
;free, etc) apart from undefined behaviors.