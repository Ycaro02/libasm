BITS 64

section .text
	global ft_atoi_base		; Function entry poin`t

extern	ft_is_valid_base
extern	ft_char_to_numb
extern	ft_char_in_base
extern 	ft_is_space

; Byte count
; 8 + 8 + 4 + 4 + 4 : 28

; register	| type	| name	| def			| addr	| byte
; RDI		| char* | str	| nb to convert	| 0x18	| 8
; RSI		| char*	| base	| nb base from	| 0x20	| 8
; Local var	| int	| i		| str counter	| 0x10	| 4
; Local var	| int	| tmp	| tampon swap	| 0xc	| 4
; Local var | int	| sign	| sign value	| 0x8	| 4
; Local var | int	| len	| base len		| 0x8	| 4

; mult sign version
ft_atoi_base:
	push   rbp						; save rbp
	mov    rbp, rsp					; set my own stack frame
	sub    rsp, 0x20					; reserve 32 byte on stack
	mov    qword[rbp-0x18], rdi		; save str pointer at 0x18
	mov    qword[rbp-0x20], rsi		; save base pointer at 0x20
	mov    dword[rbp-0x10], 0x0		; create int i = 0
	mov    dword[rbp-0xc], 0x0		; create int tmp = 0
	mov    dword[rbp-0x8], 0x1		; create int sign = 1
;mov    rax, qword[rbp-0x20]
;mov    rdi, rax
	mov    rdi, qword[rbp-0x20]		; move base in rdi for call
	call   ft_is_valid_base	;
	mov    dword[rbp-0x4], eax		; save return value base_len at 0x4
	cmp    qword[rbp-0x18], 0x0		; check for null str
	je     _atoi_base_go_exit
	cmp    dword[rbp-0x4], 0xffffffff ; if base_len == -1
	jne    _atoi_base_skip_space_loop	; if no equal go skip space loop else just go atoi base go exit

_atoi_base_go_exit:
;mov    eax, 0x0					; set return value to 0 
	xor     rax, rax					; set return value to 0 
	jmp    _atoi_base_exit			; jmp exit

_atoi_base_skip_space:
	add    dword[rbp-0x10], 0x1		; i++

; here can be refactor i mean
_atoi_base_skip_space_loop:
	mov    eax, dword[rbp-0x10]		; put i in eax
	movsxd rdx, eax					; rdx = eax
	mov    rax, qword[rbp-0x18]		; put str in rax
	add    rax, rdx					; get str + i in rax 
	movzx  eax, byte[rax]				; move byte (char) in eax
	movsx  eax, al					; isole char
	mov    edi, eax					; put char id edi for call
	call   ft_is_space
	test   eax, eax					; test if 0
	jne    _atoi_base_skip_space		; if not 0 (is space) cotinue skip
	jmp    _atoi_base_check_sign				; else jump to sign loop check

_atoi_base_sign:
	mov    eax, dword[rbp-0x10]		; same manipulation to get str[i]
	movsxd rdx, eax
	mov    rax, qword[rbp-0x18]
	add    rax, rdx					; here str + i
	movzx  eax, byte[rax]
	cmp    al, 0x2b					; if str[i] == '+'
	sete   al							; set al bool to 1 ??
	movzx  eax, al					; move this in eax
	mov    edx, dword[rbp-0x10]		; again just get str[i]
	movsxd rcx, edx
	mov    rdx, qword[rbp-0x18]
	add    rdx, rcx					; here str + i
	movzx  edx, byte[rdx]
	cmp    dl, 0x2d					; if str[i] == '-'
	sete   dl							; set dl to one ??
	movzx  ecx, dl					; save it in ecx
	sub    eax, ecx					; eax = first bool - second bool
	mov    edx, eax					; save in edx
	mov    eax, dword[rbp-0x8]		; eax = sign
	imul   eax, edx					; mult sign with eax: sign *= expr
	mov    dword[rbp-0x8], eax
	add    dword[rbp-0x10], 0x1

_atoi_base_check_sign:
	mov    eax, dword[rbp-0x10]	; eax = i
	movsxd rdx, eax				; rdx = i
	mov    rax, qword[rbp-0x18]	; rax = str
	add    rax, rdx				; rax = str + i
	movzx  eax, byte[rax]			; eax = str[i]
	cmp    al, 0x2b				; if (str[i]) == '+'
	je     _atoi_base_sign		; jmp sign loop body
	mov    eax, dword[rbp-0x10]	; same shit can be remove
	movsxd rdx, eax
	mov    rax, qword[rbp-0x18]
	add    rax, rdx
	movzx  eax, byte[rax]
	cmp    al, 0x2d				; if (str[i] == '-')
	je     _atoi_base_sign		; jmp sign bode loop
	jmp    _atoi_base_convert_check ; otherwise go to convert

_atoi_base_convert:
	mov    eax, dword[rbp-0xc]	; eax = tmp
	imul   eax, dword[rbp-0x4]	; eax *= base_len
	mov    dword[rbp-0xc], eax	; tmp = eax, tmp *= b_len
	mov    eax, dword[rbp-0x10]	; again just get str[i]
	movsxd rdx, eax				 
	mov    rax, qword[rbp-0x18]
	add    rax, rdx				; here str + i
	movzx  eax, byte[rax]
	movsx  eax, al				; eax = str[i]
;mov    rdx, qword[rbp-0x20]
;mov    rsi, rdx
	mov    rsi, qword[rbp-0x20]	; rsi = base ptr
	mov    edi, eax				; edi = str[i]
	call   ft_char_to_numb		; call char_to_numb(str[i], base)
	add    dword[rbp-0xc], eax	; tmp += res
	add    dword[rbp-0x10], 0x1	; i++

_atoi_base_convert_check:
	mov    eax, dword[rbp-0x10]	; get str[i] start;
	movsxd rdx, eax
	mov    rax, qword[rbp-0x18]
	add    rax, rdx				; here str + i
	movzx  eax, byte[rax]
	movsx  eax, al				; eax = str[i]
;mov    rdx, qword[rbp-0x20]	; rdx = base ptr
;mov    rsi, rdx
	mov    rsi, qword[rbp-0x20]	; rsi = base ptr
	mov    edi, eax
	call   ft_char_in_base		; call car_in_base(str[i], base)
	cmp    eax, 0x1				; check if res == 1
	je     _atoi_base_convert		; jmp to convert 
	mov    eax, dword[rbp-0x8]	; eax = sign
	imul   eax, dword[rbp-0xc]	; eax *= tmp
_atoi_base_exit:
	leave							; to replace
	ret
