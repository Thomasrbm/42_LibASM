extern ft_strlen
extern ft_strindex

section .text
    global ft_check_base

ft_check_base:
    push rbx
    push r12
    mov r12, rdi
    
    call ft_strlen
    cmp rax, 2
    jl .invalid
    mov rbx, rax
    xor ecx, ecx

.check_each_char:
    cmp rcx, rbx
    jge .valid
    movzx eax, byte [r12 + rcx]
    
    cmp al, 32
    je .invalid
    
    sub al, '+'
    cmp al, 1
    jbe .invalid
    add al, '+'
    
    
    sub al, 9
    cmp al, 4
    jbe .invalid
    add al, 9
    
    mov rdi, r12
    mov rsi, rax
    push rcx
    call ft_strindex
    pop rcx
    cmp rax, rcx
    jl .invalid
    
    inc rcx
    jmp .check_each_char

.valid:
    mov rax, rbx
    jmp .end

.invalid:
    xor rax, rax

.end:
    pop r12
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite progbits