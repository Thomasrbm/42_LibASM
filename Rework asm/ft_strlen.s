section .text
	global _ft_strlen


_ft_strlen:
	xor rax, rax


.count:
	cmp byte [rdi + rax], 0
	je .end

	inc rax
	jmp .count 


.end:
	ret

section .note.GNU-stack noalloc noexec nowrite progbits