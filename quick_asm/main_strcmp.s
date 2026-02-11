extern printf
extern ft_strcmp


section .data
	string1 db "hellq", 0
	string2 db "hello", 0
	format db "diff = %d", 0

section .text
	global main


main:

	lea rdi, [rel string1]
	lea rsi, [rel string2]

	call ft_strcmp

	lea rdi, [rel format]
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	ret
	






section .note.GNU-stack noalloc noexec nowrite progbits