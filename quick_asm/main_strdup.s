extern ft_strdup
extern printf


section .data
	msg db "hello", 0
	format db "dupped : %s", 0


section .text
	global main

main:
	mov rdi, msg
	call ft_strdup

	mov rdi, format
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt

	ret

