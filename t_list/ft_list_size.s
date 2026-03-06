%include "t_list.inc"

section .text
	global ft_list_size

ft_list_size:
	xor rax, rax

	test rdi, rdi
	jz .end

	mov rax, 0

.count:
	test rdi, rdi
	je .end



	inc rax
	mov rdi, [rdi + t_list.next]
	jmp .count


.end:
	ret

section .note.GNU-stack noalloc noexec nowrite progbits