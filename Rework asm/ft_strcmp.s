section .text
	global _ft_strcmp


_ft_strcmp:
	xor rax, rax
	xor rcx, rcx

.compare:
	mov r10b, [rdi + rcx]
	mov r11b, [rsi + rcx]

	cmp r10b, 0
	je .end

	cmp r11b, 0
	je .end

	cmp r10b, r11b
	jne .end

	inc rcx
	jmp .compare


.end:
	movzx rax, r10b
	movzx rbx, r11b
	sub rax, rbx
	ret

section .note.GNU-stack noalloc noexec nowrite progbits