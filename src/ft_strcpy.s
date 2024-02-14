section .text
	global ft_strcpy	; Function entry point

extern	ft_strlen

; rdi --> char * dest
; rsi --> char * src
; rcx --> size_t src_size 

ft_strcpy:			; int strlen(char *s);
	push	rdi				; push rdi on stack 1st args
	push	rsi				; push rci on stack 2second args
	push	rcx				; push rcx on stack counter
	push	rdx				; second count

_strcpy_protect:
	cmp		rdi, 0x0		; rdi NULL
	je		_strcpy_exit
	cmp		rsi, 0x0		; rsi NULL	
	je		_strcpy_exit
	call 	ft_strlen		; compute dest len
	mov		rdx, rax		; store len in rdx
; need to check for string memory surperposition

_strcpy_init:
	xchg	rdi, rsi		; exchange data between rsi and rdi
	call	ft_strlen		; call ft_strlen on rdi --> src, store result in rax
	xchg	rdi, rsi		; restore initiale rsi rdi data
	mov		rcx, rax		; store src_size in rcx
	
	cmp		rdx, rcx		; compare dest_len, src_len
	jl		_strcpy_exit	; jump lower exit

_strcopy_loop:
	cld						; clear direction flag
	xor		al, al			; set al to 0
	repz movsb				; repeat until *rdi != al -> '\0'
	mov		BYTE [rdi], 0x0	; need to put '\0'

_strcpy_exit:
	pop		rdx
	pop		rcx
	pop		rsi
	pop		rdi
	mov		rax, rdi		; return src pointer
	ret



; Les deux chaînes ne doivent pas se chevaucher. 
; La chaîne dest doit être assez grande pour accueillir la copie.

;La fonction strcpy() copie la chaîne pointée par src
;(y compris l'octet nul « \0 » final)dans la chaîne pointée par dest.
