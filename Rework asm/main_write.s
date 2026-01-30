extern _ft_write

section .data
	to_write db "to_read.txt", 0
	text db "lol", 10, 0

section .text
	global main

main:
	mov rax, 2
	mov rdi, to_write
	mov rsi, 1025
	mov rdx, 0777q
	syscall
	mov rdi, rax
	mov rsi, text
	mov rdx, 4
	call _ft_write
	ret

