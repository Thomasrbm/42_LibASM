section .text
    global ft_strcmp

ft_strcmp:
    xor rax, rax

.while:
    mov bl, byte [rdi + rax]
    mov cl, byte [rsi + rax]

    cmp bl, 0
    je .fin_while
    cmp cl, 0
    je .fin_while
    cmp bl, cl
    jne .fin_while

    inc rax
    jmp .while

.fin_while:
    movzx rax, bl               
    movzx rdx, cl
    sub rax, rdx
    ret