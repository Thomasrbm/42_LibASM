section .text
    global _ft_lst_size

_ft_lst_size:
 xor rax, rax


.while: 
  cmp byte [rdi + rax], 0
  je .end

  mov rdi, [rdi + 8]
  inc rax
  jmp .while


.end:
  ret


