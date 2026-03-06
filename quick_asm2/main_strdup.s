extern printf
extern ft_strdup

section .data
	format db "dupped = %s", 0
	string db "test", 0

section .text
	global main



main:
	lea rdi, [rel string]
	call ft_strdup

	lea rdi, [rel format]
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt

	ret






section .note.GNU-stack noalloc noexec nowrite progbits