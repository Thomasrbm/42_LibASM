extern printf
extern ft_strdup

section .data
	string db "hello", 0
	format db "dupped = %s", 0

section .text
	global main

main:
	lea rdi, [rel string]
	call ft_strdup

	lea rdi, [rel format]
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt

section .note.GNU-stack noalloc noexec nowrite progbits