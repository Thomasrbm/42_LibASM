extern __errno_location

section .text
    global _ft_write

_ft_read:
    mov rax, 1
    syscall ; rien d autre car rdi etc on ete set par la caller
    cmp rax, 0
    jl 0

    