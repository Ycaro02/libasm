
; if sign version
Dump of assembler code for function my_atoi_base:
   0x00000000000033cf <+0>:     endbr64
   0x00000000000033d3 <+4>:     push   rbp
   0x00000000000033d4 <+5>:     mov    rbp,rsp
   0x00000000000033d7 <+8>:     sub    rsp,0x20
   0x00000000000033db <+12>:    mov    QWORD PTR [rbp-0x18],rdi
   0x00000000000033df <+16>:    mov    QWORD PTR [rbp-0x20],rsi
   0x00000000000033e3 <+20>:    mov    DWORD PTR [rbp-0x10],0x0
   0x00000000000033ea <+27>:    mov    DWORD PTR [rbp-0xc],0x0
   0x00000000000033f1 <+34>:    mov    DWORD PTR [rbp-0x8],0x1
   0x00000000000033f8 <+41>:    mov    rax,QWORD PTR [rbp-0x20]
   0x00000000000033fc <+45>:    mov    rdi,rax
   0x00000000000033ff <+48>:    call   0x39a0 <ft_is_valid_base>
   0x0000000000003404 <+53>:    mov    DWORD PTR [rbp-0x4],eax
   0x0000000000003407 <+56>:    cmp    QWORD PTR [rbp-0x18],0x0
   0x000000000000340c <+61>:    je     0x3414 <my_atoi_base+69>
   0x000000000000340e <+63>:    cmp    DWORD PTR [rbp-0x4],0xffffffff
   0x0000000000003412 <+67>:    jne    0x3422 <my_atoi_base+83>
   0x0000000000003414 <+69>:    mov    eax,0x0
   0x0000000000003419 <+74>:    jmp    0x34e6 <my_atoi_base+279>
   0x000000000000341e <+79>:    add    DWORD PTR [rbp-0x10],0x1
   0x0000000000003422 <+83>:    mov    eax,DWORD PTR [rbp-0x10]
   0x0000000000003425 <+86>:    movsxd rdx,eax
   0x0000000000003428 <+89>:    mov    rax,QWORD PTR [rbp-0x18]
   0x000000000000342c <+93>:    add    rax,rdx
   0x000000000000342f <+96>:    movzx  eax,BYTE PTR [rax]
   0x0000000000003432 <+99>:    movsx  eax,al
   0x0000000000003435 <+102>:   mov    edi,eax
   0x0000000000003437 <+104>:   call   0x3970 <ft_is_space>
   0x000000000000343c <+109>:   test   eax,eax
   0x000000000000343e <+111>:   jne    0x341e <my_atoi_base+79>
   0x0000000000003440 <+113>:   jmp    0x345d <my_atoi_base+142>
   0x0000000000003442 <+115>:   mov    eax,DWORD PTR [rbp-0x10]
   0x0000000000003445 <+118>:   movsxd rdx,eax
   0x0000000000003448 <+121>:   mov    rax,QWORD PTR [rbp-0x18]
   0x000000000000344c <+125>:   add    rax,rdx
   0x000000000000344f <+128>:   movzx  eax,BYTE PTR [rax]
   0x0000000000003452 <+131>:   cmp    al,0x2d
   0x0000000000003454 <+133>:   jne    0x3459 <my_atoi_base+138>
   0x0000000000003456 <+135>:   neg    DWORD PTR [rbp-0x8]
   0x0000000000003459 <+138>:   add    DWORD PTR [rbp-0x10],0x1
   0x000000000000345d <+142>:   mov    eax,DWORD PTR [rbp-0x10]
   0x0000000000003460 <+145>:   movsxd rdx,eax
   0x0000000000003463 <+148>:   mov    rax,QWORD PTR [rbp-0x18]
   0x0000000000003467 <+152>:   add    rax,rdx
   0x000000000000346a <+155>:   movzx  eax,BYTE PTR [rax]
   0x000000000000346d <+158>:   cmp    al,0x2b
   0x000000000000346f <+160>:   je     0x3442 <my_atoi_base+115>
   0x0000000000003471 <+162>:   mov    eax,DWORD PTR [rbp-0x10]
   0x0000000000003474 <+165>:   movsxd rdx,eax
   0x0000000000003477 <+168>:   mov    rax,QWORD PTR [rbp-0x18]
   0x000000000000347b <+172>:   add    rax,rdx
   0x000000000000347e <+175>:   movzx  eax,BYTE PTR [rax]
   0x0000000000003481 <+178>:   cmp    al,0x2d
   0x0000000000003483 <+180>:   je     0x3442 <my_atoi_base+115>
   0x0000000000003485 <+182>:   jmp    0x34b9 <my_atoi_base+234>
   0x0000000000003487 <+184>:   mov    eax,DWORD PTR [rbp-0xc]
   0x000000000000348a <+187>:   imul   eax,DWORD PTR [rbp-0x4]
   0x000000000000348e <+191>:   mov    DWORD PTR [rbp-0xc],eax
   0x0000000000003491 <+194>:   mov    eax,DWORD PTR [rbp-0x10]
   0x0000000000003494 <+197>:   movsxd rdx,eax
   0x0000000000003497 <+200>:   mov    rax,QWORD PTR [rbp-0x18]
   0x000000000000349b <+204>:   add    rax,rdx
   0x000000000000349e <+207>:   movzx  eax,BYTE PTR [rax]
   0x00000000000034a1 <+210>:   movsx  eax,al
   0x00000000000034a4 <+213>:   mov    rdx,QWORD PTR [rbp-0x20]
   0x00000000000034a8 <+217>:   mov    rsi,rdx
   0x00000000000034ab <+220>:   mov    edi,eax
   0x00000000000034ad <+222>:   call   0x3930 <ft_char_to_numb>
   0x00000000000034b2 <+227>:   add    DWORD PTR [rbp-0xc],eax
   0x00000000000034b5 <+230>:   add    DWORD PTR [rbp-0x10],0x1
   0x00000000000034b9 <+234>:   mov    eax,DWORD PTR [rbp-0x10]
   0x00000000000034bc <+237>:   movsxd rdx,eax
   0x00000000000034bf <+240>:   mov    rax,QWORD PTR [rbp-0x18]
   0x00000000000034c3 <+244>:   add    rax,rdx
   0x00000000000034c6 <+247>:   movzx  eax,BYTE PTR [rax]
   0x00000000000034c9 <+250>:   movsx  eax,al
   0x00000000000034cc <+253>:   mov    rdx,QWORD PTR [rbp-0x20]
   0x00000000000034d0 <+257>:   mov    rsi,rdx
   0x00000000000034d3 <+260>:   mov    edi,eax
   0x00000000000034d5 <+262>:   call   0x38f0 <ft_char_in_base>
   0x00000000000034da <+267>:   cmp    eax,0x1
   0x00000000000034dd <+270>:   je     0x3487 <my_atoi_base+184>
   0x00000000000034df <+272>:   mov    eax,DWORD PTR [rbp-0x8]
   0x00000000000034e2 <+275>:   imul   eax,DWORD PTR [rbp-0xc]
   0x00000000000034e6 <+279>:   leave
   0x00000000000034e7 <+280>:   ret
End of assembler dump.