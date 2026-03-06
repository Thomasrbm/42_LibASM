%include "t_list.inc"

section .text
	global ft_list_size

ft_list_size:
	xor rax, rax

	cmp rdi, 0
	je .end

.count:
	inc rax

	cmp byte [rdi + t_list.next], 0
	je .end

	lea rdi, [rdi + t_list.next]
	jmp .count

.end:
	ret

section .note.GNU-stack noalloc noexec nowrite progbits