%include "t_list.inc"

section .text
    global ft_list_sort

ft_list_sort:
	test rdi, rdi
	jz .end

    push r12
    push r13
    push r14
    push r15

	mov r12, rdi
	mov r13, rsi

.restart:
	xor r14, r14
	mov r15, r12

.sort:
	mov rax, [r15]
	
	mov rdx, [rax + t_list.next]
	test

	jz

	mov rdi
	rsi

	jle/


.swap:
	mov rax,
	rdx 
	rcx

	rax nex 
	rdx nest

	mor [r15], rdx
	jmp


.next:
	mov rax, [r15]
	lea r15, [rax + t_list.next]
	jmp .sort


.check:
	test r14, r14
	jnz .restart





.end:
    pop r15
    pop r14
    pop r13
    pop r12
    ret