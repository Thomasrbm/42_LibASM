extern printf
extern _ft_read


section .data: ; db = defin bytes = pour la memoire
	format db "byte read : %d ", 10, 0
	open_name db "to_read.txt", 0

section .bss ; zone memoir non init 
	buffer_read resb 1024 ; resb = reserved byte

section .text
	global main

main:
	; push rbx  ; desaligner la stack provoque un segfault
	mov rax, 2
	mov rdi, open_name
	mov rsi, 0 ; flag pour rd only
	mov rdx, 0 ; permission a creation (pas donne)
	syscall

	mov rdi, rax ; stock le fd 
	mov rsi, buffer_read 
	mov rdx, 100
	call _ft_read

	mov rdi, format
	mov rsi, rax

	xor rax, rax    ; SINON SEGFAULT 

	call printf


	ret
