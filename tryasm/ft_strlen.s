section .text
    global _ft_strlen



_ft_strlen:
    xor rax, rax


.while:
    cmp byte [rdi + rax], 0
    je .fin_while

    inc rax
    jmp .while

.fin_while:
    ret