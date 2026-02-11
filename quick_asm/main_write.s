extern ft_write
extern open
extern __errno_location
extern printf


section .data
	to_write db "test.text", 0
	format_err db "%d", 0
	text db "hello", 10, 0

section .text
	global main

main:
	lea rdi, [rel to_write] 
	; mov rdi, 7
	mov rsi, 1090
	mov rcx, 0644q
	xor rax, rax
	call open wrt ..plt
	

	mov rdi, rax
	lea rsi, [rel text]
	mov rdx, 6
	call ft_write
	
	call __errno_location wrt ..plt


	lea rdi, [rel format_err]
	mov rsi, [rax]
	xor rax, rax
	call printf wrt ..plt
	ret

section .note.GNU-stack noalloc noexec nowrite progbits