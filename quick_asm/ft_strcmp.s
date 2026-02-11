section .text
	global ft_strcmp



ft_strcmp:
	xor rax, rax

.comp:
	mov r8b, byte [rdi + rax]
	mov r9b, byte [rsi + rax]

	cmp r8b, 0
	je  .end

	cmp r9b, 0
	je  .end

	cmp r8b, r9b
	jne .end

	inc rax
	jmp .comp


.end:
	movzx rax, r8b
	movzx rdx, r9b
	sub rax, rdx
	jl .set_neg
	jg .set_pos

	mov rax, 0
	ret


.set_neg:
	mov rax, -1
	ret


.set_pos:
	mov rax, 1
	ret





section .note.GNU-stack noalloc noexec nowrite progbits