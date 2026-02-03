section .text
	global _ft_list_size

_ft_list_size:
	xor rax, rax


.size:
	test rdi, rdi
	jz .end

	inc rax
	mov rdi, [rdi + 8]

	jmp .size

.end:
	ret