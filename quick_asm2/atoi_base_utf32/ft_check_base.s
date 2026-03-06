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
    mov eax, dword [r12 + rcx*4]   ; index en codepoints × 4

    cmp eax, 32
    je .invalid
    sub eax, '+'
    cmp eax, 1
    jbe .invalid
    add eax, '+'
    sub eax, 9
    cmp eax, 4
    jbe .invalid
    add eax, 9

    mov rdi, r12
    mov esi, eax            ; caractère UTF-32
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