extern ft_atoi_base
extern printf

section .data
	string db "za123", 0
    base db "0123456789abcdefghijklmnopqrstuvwxyz", 0
	format db "result = %ld", 0


section .text
	global main

main:
	lea rdi, [rel string]
	lea rsi, [rel base]
	call ft_atoi_base


	lea rdi, [rel format]
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	
	ret


section .note.GNU-stack noalloc noexec nowrite progbits
