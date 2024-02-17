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
<+4>:     push   rbp						; save rbp
<+5>:     mov    rbp, rsp					; set my own stack frame
<+8>:     sub    rsp, 0x20					; reserve 32 byte on stack
<+12>:    mov    qword[rbp-0x18], rdi		; save str pointer at 0x18
<+16>:    mov    qword[rbp-0x20], rsi		; save base pointer at 0x20
<+20>:    mov    dword[rbp-0x10], 0x0		; create int i = 0
<+27>:    mov    dword[rbp-0xc], 0x0		; create int tmp = 0
<+34>:    mov    dword[rbp-0x8], 0x1		; create int sign = 1
; <+41>:    mov    rax, qword[rbp-0x20]
; <+45>:    mov    rdi, rax
<+41>:    mov    rdi, qword[rbp-0x20]		; move base in rdi for call
<+48>:    call   ft_is_valid_base	;
<+53>:    mov    dword[rbp-0x4], eax		; save return value base_len at 0x4
<+56>:    cmp    qword[rbp-0x18], 0x0		; check for null str
<+61>:    je     _atoi_base_go_exit
<+63>:    cmp    dword[rbp-0x4], 0xffffffff ; if base_len == -1
<+67>:    jne    _atoi_base_skip_space_loop	; if no equal go skip space loop else just go atoi base go exit

_atoi_base_go_exit:
; <+69>:    mov    eax, 0x0					; set return value to 0 
<+69>:    xor     rax, rax					; set return value to 0 
<+74>:    jmp    _atoi_base_exit			; jmp exit

_atoi_base_skip_space:
<+79>:    add    dword[rbp-0x10], 0x1		; i++

; here can be refactor i mean
_atoi_base_skip_space_loop:
<+83>:    mov    eax, dword[rbp-0x10]		; put i in eax
<+86>:    movsxd rdx, eax					; rdx = eax
<+89>:    mov    rax, qword[rbp-0x18]		; put str in rax
<+93>:    add    rax, rdx					; get str + i in rax 
<+96>:    movzx  eax, byte[rax]				; move byte (char) in eax
<+99>:    movsx  eax, al					; isole char
<+102>:   mov    edi, eax					; put char id edi for call
<+104>:   call   ft_is_space
<+109>:   test   eax, eax					; test if 0
<+111>:   jne    _atoi_base_skip_space		; if not 0 (is space) cotinue skip
<+113>:   jmp    _atoi_base_check_sign				; else jump to sign loop check

_atoi_base_sign:
<+115>:   mov    eax, dword[rbp-0x10]
<+118>:   movsxd rdx, eax
<+121>:   mov    rax, qword[rbp-0x18]
<+125>:   add    rax, rdx
<+128>:   movzx  eax, byte[rax]
<+131>:   cmp    al, 0x2b
<+133>:   sete   al
<+136>:   movzx  eax, al
<+139>:   mov    edx, dword[rbp-0x10]
<+142>:   movsxd rcx, edx
<+145>:   mov    rdx, qword[rbp-0x18]
<+149>:   add    rdx, rcx
<+152>:   movzx  edx, byte[rdx]
<+155>:   cmp    dl, 0x2d
<+158>:   sete   dl
<+161>:   movzx  ecx, dl
<+164>:   sub    eax, ecx
<+166>:   mov    edx, eax
<+168>:   mov    eax, dword[rbp-0x8]
<+171>:   imul   eax, edx
<+174>:   mov    dword[rbp-0x8], eax
<+177>:   add    dword[rbp-0x10], 0x1

_atoi_base_check_sign:
<+181>:   mov    eax, dword[rbp-0x10]	; eax = i
<+184>:   movsxd rdx, eax				; rdx = i
<+187>:   mov    rax, qword[rbp-0x18]	; rax = str
<+191>:   add    rax, rdx				; rax = str + i
<+194>:   movzx  eax, byte[rax]			; eax = str[i]
<+197>:   cmp    al, 0x2b				; if (str[i]) == '+'
<+199>:   je     _atoi_base_sign		; jmp sign loop body
<+201>:   mov    eax, dword[rbp-0x10]	; same shit can be remove
<+204>:   movsxd rdx, eax
<+207>:   mov    rax, qword[rbp-0x18]
<+211>:   add    rax, rdx
<+214>:   movzx  eax, byte[rax]
<+217>:   cmp    al, 0x2d				; if (str[i] == '-')
<+219>:   je     _atoi_base_sign
<+221>:   jmp    _atoi_base_convert_check

_atoi_base_convert:
<+223>:   mov    eax, dword[rbp-0xc]
<+226>:   imul   eax, dword[rbp-0x4]
<+230>:   mov    dword[rbp-0xc], eax
<+233>:   mov    eax, dword[rbp-0x10]
<+236>:   movsxd rdx, eax
<+239>:   mov    rax, qword[rbp-0x18]
<+243>:   add    rax, rdx
<+246>:   movzx  eax, byte[rax]
<+249>:   movsx  eax, al
<+252>:   mov    rdx, qword[rbp-0x20]
<+256>:   mov    rsi, rdx
<+259>:   mov    edi, eax
<+261>:   call   ft_char_to_numb
<+266>:   add    dword[rbp-0xc], eax
<+269>:   add    dword[rbp-0x10], 0x1

_atoi_base_convert_check:
<+273>:   mov    eax, dword[rbp-0x10]
<+276>:   movsxd rdx, eax
<+279>:   mov    rax, qword[rbp-0x18]
<+283>:   add    rax, rdx
<+286>:   movzx  eax, byte[rax]
<+289>:   movsx  eax, al
<+292>:   mov    rdx, qword[rbp-0x20]
<+296>:   mov    rsi, rdx
<+299>:   mov    edi, eax
<+301>:   call   ft_char_in_base
<+306>:   cmp    eax, 0x1
<+309>:   je     _atoi_base_convert
<+311>:   mov    eax, dword[rbp-0x8]
<+314>:   imul   eax, dword[rbp-0xc]
_atoi_base_exit:
<+318>:   leave
<+319>:   ret
End of assembler dump.
