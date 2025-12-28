section .text
    global _ft_strdup
    extern malloc
    extern _ft_strlen

_ft_strdup:
    xor  rax, rax


.start:
    push rdi ; save la str dans stack car apres rdi used pour le malloc
    call _ft_strlen
    inc rdi ; strlen ne count pas le \0
    mov rdi, rax
    call malloc
    pop rdi
    xor al, al ; erase garbage values

.while:
    cmp byte [rdi + al], 0
    je .end 

    mov r9, [rdi + al]
    mov [rax + al], r9
    inc al
    jmp .while


.end:
    mov [rax + al], 0 
    ret