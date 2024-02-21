BITS 64

section .text
	global ft_is_valid_base	; Function entry point

extern	ft_strlen
extern	ft_is_space

ft_is_valid_base:
	push   rbp							; save rbp
	mov    rbp, rsp						; set my own stack frame
	sub    rsp, 0x20					; set my own stack frame
	mov    qword[rbp-0x18], rdi			; save rdi in	0x18
	mov    dword[rbp-0xc], 0x0			; int i = 0		0xc
	mov    dword[rbp-0x8], 0x0			; int j = 0		0x8
	call   ft_strlen					; call str_len
	mov    dword[rbp-0x4], eax			; store res in 0x4, len
	cmp    dword[rbp-0x4], 0x1			; cmp if == 1
	jg     _is_valid_base_compare		; if greather go while compare
	mov    eax, 0xffffffff				; else eax = -1
	jmp    _is_valid_base_exit			; go exit

_is_valid_base_loop:
	mov    eax, dword[rbp-0xc]			; put i in eax
	movsxd rdx, eax						; mov it in rdx
	mov    rax, qword[rbp-0x18]			; put str in rax
	add    rax, rdx						; add str + i
	movzx  eax, byte[rax]				; get byte got str[i] char
	movsx  eax, al						; move it (al 8 byte) in eax
	mov    edi, eax						; move in edi (rdi 32 bits) for function call
	call   ft_is_space
	test   eax, eax						; test if 0
	jne    _valid_base_loop_break		; if no equal continue while
	
	mov    eax, dword[rbp-0xc]			; move i in eax
	movsxd rdx, eax						; save it in rdx
	mov    rax, qword[rbp-0x18]			; move str in rax
	add    rax, rdx						; get str + i
	movzx  eax, byte[rax]				; got char str[i]
	cmp    al, 0x2b						; cmp with '+'
	je     _valid_base_loop_break
	cmp    al, 0x2d						; same here but compare with '-'
	jne    _valid_base_inc_j

_valid_base_loop_break:
	mov    eax, 0xffffffff				; set return value to -1
	jmp    _is_valid_base_exit			; jmp exit

_valid_base_inc_j:
	mov    eax, dword[rbp-0xc]			; get i
	add    eax, 0x1						; add 1 to i
	mov    dword[rbp-0x8], eax			; j = this value j = i + 1
	jmp    _valid_base_second_cmp

_valid_base_sec_loop:
	mov    eax, dword[rbp-0xc]			; put i in eax
	movsxd rdx, eax						; save it 
	mov    rax, qword[rbp-0x18]			; put str in rax
	add    rax, rdx						; get str + i
	movzx  edx, byte[rax]				; got str[i] in edx
	mov    eax, dword[rbp-0x8]			; same with j
	movsxd rcx, eax						; save j
	mov    rax, qword[rbp-0x18]			; put str in rax
	add    rax, rcx						; get str + j
	movzx  eax, byte[rax]				; got str[j] in eax
	cmp    dl, al						; cmp str[i] str[j]
	jne    _valid_base_sloop_inc		; if no equal
	mov    eax, 0xffffffff				; else eax = -1
	jmp    _is_valid_base_exit			; go exit

_valid_base_sloop_inc:
	add    dword[rbp-0x8], 0x1			; j++

_valid_base_second_cmp:
	mov    eax, dword[rbp-0x8]			; put j in eax
	movsxd rdx, eax						; store it in rdx
	mov    rax, qword[rbp-0x18]			; move str in rax
	add    rax, rdx						; get str + j
	movzx  eax, byte[rax]				; got char str[j]
	test   al, al						; test if 0
	jne    _valid_base_sec_loop
	add    dword[rbp-0xc], 0x1

_is_valid_base_compare:
	mov    eax, dword[rbp-0xc]			; get j
	movsxd rdx, eax						; save it
	mov    rax, qword[rbp-0x18]			; get str
	add    rax, rdx						; add str + j
	movzx  eax, byte[rax]				; got str[j]
	test   al, al						; test if 0
	jne    _is_valid_base_loop			; if not go base loop
	mov    eax, dword[rbp-0x4]			; else put len in eax 
_is_valid_base_exit:
	mov			rsp, rbp				; restore rsp
	pop			rbp						; restore rbp
	ret