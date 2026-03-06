section .text
    global _ft_strcmp


_ft_strcmp:
    xor rax, rax

.while:
    mov r10, byte [rdi + rax]
    mov r11, byte [rsi + rax]
    cmp r10, 0
    je .end
    cmp r11, 0
    je .end
    cmp r10, r11
    jne .end

    inc rax
    jmp .while



.end
    sub r10, r11
    mov rax, r10
    ret

