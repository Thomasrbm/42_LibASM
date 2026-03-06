section .text
    global ft_strcpy



ft_strcpy:
    xor rax, rax



.while:
    cmp byte [rsi + rax], 0
    je .fin_while

    mov dl, [rsi + rax]
    mov byte [rdi + rax], dl ; vers RAM on précise taille
    inc rax
    jmp .while

.fin_while:
    mov byte [rsi + rax], 0 
    ret