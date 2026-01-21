extern printf
extern _ft_strlen


section .data
	format db "len = %d", 10, 0
	msg db "test", 0

section .text
	global main
	

main:
	mov rdi, msg
	call _ft_strlen
	mov rsi, rax
	mov rdi, format
	xor rax, rax
	call printf
