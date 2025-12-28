section .text
    global ft_strcmp

ft_strcmp:
    xor rax, rax

.while:
    mov bl, byte [rdi + rax] ; mov ici car sinon si ca go fin sans init bl ou cl cest mauvais
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