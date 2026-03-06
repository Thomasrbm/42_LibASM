extern malloc

section .text
    _ft_strdup


_ft_strdup:
    xor rax, rax
    mov r10, rdi

.count:
    cmp byte [r10 + rax], 0
    je .end_count

    inc rax
    jmp .count

.end_count:
    mov rdi, rax
    inc rdi
    call malloc

.copy:
    mov r12, byte [r10 + r11]
    mov byte byte [rax + r11], r12
    cmp r11, rdi
    je .end

    inc r11
    jmp .copy

.end:
    mov  byte [rax + r11], 0
    ret
