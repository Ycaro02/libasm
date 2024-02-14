BITS 64
;   Algo
;   prepare register

section .text
	global ft_strcmp	; Function entry point

ft_strcmp:
    push	rbp			    ; Save the stack frame of caller, pushed on stack 
    mov 	rbp, rsp	    ; Set my own stack frame 
    cmp		rdi, 0x0		; rdi NULL
	je		_strcmp_exit    ; jump equal exit
    cmp		rsi, 0x0		; rdi NULL
	je		_strcmp_exit    ; jump equal exit

    ; 0x20 --> RSI    SECOND str
    ; 0x18 --> RDI    FIRST str
    ; 0x8  --> FIRST counter
    ; 0x4  --> SECOND counter

    mov     qword [rbp-0x20], rsi ; Put rsi at rbp - 32
    mov     qword [rbp-0x18], rdi ; Put rdi at rbp - 24
	mov     dword [rbp-0x8], 0x0  ; int i = 0 
	mov     dword [rbp-0x4], 0x0  ; int j = 0

    jmp     _no_null_byte1

_increment_counter: ; inc before loop + 32
    add     dword [rbp-0x8], 0x1 ; increment counter
    add     dword [rbp-0x4], 0x1


_no_null_byte1: ; main loop + 40
    mov     eax, dword[rbp-0x8] ; get i counter in eax
    movsxd  rdx, eax            ; move this value in rdx with default 0
    mov     rax, qword[rbp-0x18]; get first string pointer
    add     rax, rdx            ; increment string with counter
    movzx   eax, byte[rax]      ; get char in eax
    test    al, al              ; test if char is 0
    je      _strcmp_exit

_no_null_byte2:
    mov     eax, dword[rbp-0x4] ; get j counter in eax
    movsxd  rdx, eax            ; move this value in rdx with default 0
    mov     rax, qword[rbp-0x20]; get second string pointer
    add     rax, rdx            ; increment string with counter
    movzx   eax, byte[rax]      ; get char in eax
    test    al, al              ; test if char is 0
    je      _strcmp_exit

_byte_cmp:
    ; get byte of string 1
    mov     eax, dword[rbp-0x8] ; get i counter in eax
    movsxd  rdx, eax            ; move this value in rdx with default 0
    mov     rax, qword[rbp-0x18]; get first string pointer
    add     rax, rdx            ; increment string with counter
   
    ; store byte in eDX don't touch RDX and co register
    movzx   edx, byte[rax]      ; get char in edx, NOT in eax, he is for the second value
   
    ; get byte of string 2
    mov     eax, dword[rbp-0x4] ; get j counter in eax
    movsxd  rcx, eax            ; move this value in rCx with default 0
    mov     rax, qword[rbp-0x20]; get second string pointer
    add     rax, rcx            ; increment string with counter

    movzx   eax, byte[rax]      ; store char in eax
    cmp     dl, al              ; compate 8 lower bit of edx and eax
    je      _increment_counter


_strcmp_exit: ; exit + 116
    ; get char 1
    mov     eax, dword[rbp-0x8] ; get i counter in eax
    movsxd  rdx, eax            ; move this value in rdx with default 0
    mov     rax, qword[rbp-0x18]; get first string pointer
    add     rax, rdx            ; increment string with counter
    ;store value 1
    movzx   eax, byte[rax]
    movsx   eax, al
    ; get char 2
    mov     edx, dword[rbp-0x4] ; get j counter in edx
    movsxd  rcx, edx            ; move this value in rCx with default 0
    mov     rdx, qword[rbp-0x20]; get second string pointer
    add     rdx, rcx            ; increment string with counter
    ;store value 2
    movzx   edx, byte[rdx]
    movsx   edx, dl

    sub    eax, edx         ; last sub char in return
    
    pop 	rbp			; Pop rbp to restore stack
    ret