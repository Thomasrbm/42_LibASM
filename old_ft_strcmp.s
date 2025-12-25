section .text
    global ft_strcmp



ft_strcmp:
    xor rax, rax



.while:
    cmp byte [rdi + rax], 0 
    je .fin_while
    cmp byte [rsi + rax], 0
    je .fin_while
    cmp byte [rsi + rax], [rdi + rax] ; rdi = registre MAIS rdi + rax = RAM car crochet veulent dire ca
    ; hors on peut pas cmp deux RAM, passer par registre tampo,
    jne .fin_while

    inc rax
    jmp .while


.fin_while:
    mov rax, [rdi + rax]
    sub rax, [rsi + rax]
    ret