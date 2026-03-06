
section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax
	
.cmp:
	mov dl,	[rdi + rax]  ; PK peut pas faire deux dereferencement entre [] sur le meme ligne ?
	mov cl, [rsi + rax]

	cmp cl, 0
	je .end

	cmp dl, 0
	je .end

	cmp cl, dl
	jne .end

	inc rax
	jmp .cmp


.end:
	movzx rax, dl
	movzx rdi, cl
	sub rax, rdi
	ret

section .note.GNU-stack noalloc noexec nowrite progbits