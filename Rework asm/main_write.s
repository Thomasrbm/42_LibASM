extern _ft_write

section .data    ; RAJOUTER  : apres la section :change le nom de la section = segfault
	msg db "Hello", 10, 0
	to_open db "to_read.txt", 0

section .text
	global main

main:
	mov rax, 2
	mov rdi, to_open
	mov rsi, 1
	mov rdx, 0
	syscall

	mov rdi, rax
	mov rsi, msg
	mov rdx, 6
	call _ft_write

	ret