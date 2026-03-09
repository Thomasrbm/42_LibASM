%include "t_list.inc"



section .text
	global ft_list_remove_if

ft_list_remove_if:
	test rdi, rdi
	jz .end

	push r12
	push r13
	push r14
	push r15

	mov r12, rdi
	mov r13, rsi
	mov r14, rdx
	mov r15, rcx

.loop:
	mov rax, [r12]
	
	mov rdx, [rax + t_list.next]
	test rdx, rdx
	jz	.end

	mov rdi, [rax + t_list.data]
	mov rsi, r13
	call r14

	jnz .next


.remove:
	mov rax, [r12]
	mov rdx, [rax + t_list.next]
	mov [r12], rdx
	mov rdi, rax
	call r15
	jmp .loop

.next:
	mov rax, [r12]
	lea r12, [rax + t_list.next]
	jmp .loop


.end:
	pop r15
	pop r14
	pop r13
	pop r12
	ret


section .note.GNU-stack noalloc noexec nowrite progbits