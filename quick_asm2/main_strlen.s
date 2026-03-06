extern printf
extern ft_strlen

section .data
	string db "test", 0
	format db "len = %d", 0

section .text
	global main


main:
	lea rdi, [rel string]    ; PK rel PK lea et pas mov ici ? 
	call ft_strlen

	lea rdi, [rel format]
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt

	ret






section .note.GNU-stack noalloc noexec nowrite progbits