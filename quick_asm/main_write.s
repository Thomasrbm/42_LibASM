extern ft_write

;defines 

O_RDWR      equ 0x002
O_CREAT     equ 0x040
O_APPEND    equ 0x400


section .data
	to_write db "test.text", 0
	string db "hello", 10, 0

section .text
	global main

main:
	lea rdi, [rel to_write]
	mov rsi, O_RDWR | O_CREAT | O_APPEND   ; combinaison lisible
    mov rdx, 0o644 ;    permissions 064 octal (group: rw, others: r)


	mov rax, 2
	syscall

	mov rdi, rax
	lea rsi, [rel string]
	mov rdx, 6
	call ft_write

	ret










section .note.GNU-stack noalloc noexec nowrite progbits