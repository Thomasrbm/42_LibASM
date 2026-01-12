bauche, ajouter concept des bases
; ebauche, ajouter concept des bases



section .text
   global atoi_base
  
  
atoi_base:
   xor rcx, rcx
 
; skip sign
; skip spaces


.while_blank:
   cmp [rdi + rcx], 32
   jne .get_sign
   cmp [rdi + rcx], 9
   jne .get_sign
   
   jmp.inc_space




.inc_space:
 inc rcx
 jmp .while_blank


.get_sign:
   cmp byte [rdi + rax], 45
   je .neg
   
   jmp .pos




.neg:
  inc rcx
  cmp byte [rdi + rcx], 48
  ji .end_neg
  cmp byte [rdi + rcx], 57
  js .end_neg
  mul rax, 10
  mov r9, byte [rdi + rcx]
  sub r9, 48
  add rax, r9
  jmp .neg
  
.end_neg:
 mul rax, rax
  
  
.pos:
 ; same mais faire jump a end



.ret:
  ret
