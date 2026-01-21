section .text
	global _ft_strlen



_ft_strlen:
	xor rax, rax


.count_char:
	cmp byte[rdi + rax], 0
	je .end

	inc rax
	jmp .count_char

.end:
	ret



