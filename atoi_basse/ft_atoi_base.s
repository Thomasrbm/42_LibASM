section .text
    global ft_atoi_base

ft_atoi_base:
    ; rdi = str, rsi = base
    push    rbx
    xor     eax, eax        ; result = 0
    xor     ecx, ecx        ; base_len = 0
    mov     rbx, rsi

    ; calcule len(base) dans ecx
.base_len:
    cmp     byte [rbx + rcx], 0   ; ← rcx pas ecx
    je      .skip_spaces
    inc     rcx                    ; ← rcx
    jmp     .base_len

.skip_spaces:
    movzx   edx, byte [rdi]
    cmp     dl, ' '
    je      .next_sp
    cmp     dl, 9           ; \t
    jb      .sign
    cmp     dl, 13          ; \r
    jbe     .next_sp
    jmp     .sign
.next_sp:
    inc     rdi
    jmp     .skip_spaces

.sign:
    xor     r8d, r8d        ; sign = 0
    cmp     dl, '-'
    jne     .check_plus
    inc     r8d
    inc     rdi
    jmp     .loop
.check_plus:
    cmp     dl, '+'
    jne     .loop
    inc     rdi

.loop:
    movzx   edx, byte [rdi]
    test    dl, dl
    jz      .end
    ; cherche rdi[0] dans base
    xor     r9d, r9d
.find:
    cmp     r9d, ecx
    jge     .end
    cmp     dl, byte [rsi + r9]
    je      .found
    inc     r9d
    jmp     .find
.found:
    imul    eax, ecx
    add     eax, r9d
    inc     rdi
    jmp     .loop

.end:
    test    r8d, r8d
    jz      .pos
    neg     eax
.pos:
    pop     rbx
    ret

section .note.GNU-stack noalloc noexec nowrite progbits  