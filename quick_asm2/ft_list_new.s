extern malloc
%include "t_list.inc"

section .text
	global ft_list_new

ft_list_new:
	push rdi
	mov rdi, t_list_size
	call malloc wrt ..plt
	pop rdi

	mov [rax + t_list.data], rdi
	mov byte [rax + t_list.next], 0

	ret

section .note.GNU-stack noalloc noexec nowrite progbits