BITS 64

section .text
	global gcc_strlen	; Function entry point

gcc_strlen:
	push   rbp                      ; save rbp
	mov    rbp,rsp                  ; set my own rbb with rsb value
	mov    QWORD [rbp-0x18],rdi     ; store rdi/args pointer in stack rbp - 0x18
	mov    QWORD [rbp-0x8],0x0      ; store index in statck rbp - ox8

	cmp		rdi, 0x0		; rdi NULL
	je		gcc_strlen_exit ; jump equal exit
	jmp    gcc_strlen_mov   ; jmp start while

gcc_strlen_add:             
	add    QWORD [rbp-0x8],0x1  ; increment index

;rbp-0x18    = str
;rbp-0x8     = i

gcc_strlen_mov:             ; start while
    ;rdx = str
	mov    rdx,QWORD [rbp-0x18]     ; store args pointer value in rdx
    ;rax = i
	mov    rax,QWORD [rbp-0x8]      ; store index in rax
    ;rax += str AKA str += i AKA str + i
	add    rax,rdx                  ; rax += rdx, we are a the good adress to take char
    ;char c = *rax
    movzx  eax,BYTE [rax]           ; put byte rax in eax
    ;c == 0 
    test   al,al                    ; test al, al is a sub register of eax/rax, represent lowerbyte
	;If al & al == 0, the zero flag will be set to 1
    ;if c not equal 0 jump to add
    jne    gcc_strlen_add


gcc_strlen_exit:
	mov    rax,QWORD [rbp-0x8]
	pop    rbp
	ret