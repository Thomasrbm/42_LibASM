extern __errno_location

section .text
    global _ft_read

_ft_read:
    mov rax, 0
    syscall
    cmp rax, 0
    jl .errno
    ret

.errno:
    neg rax ; syscall renvoit négatif mais exitcode doit etre pos
    mov r10, rax  ; stock l exit code du syscall dans volatil r10
    call __errno_location ; met adresse errno dans rax
    mov [rax], r10
    mov rax, -1 ; car le return de write doit etre -1 (mais errno doit avoir exit code précis)
    ret

    