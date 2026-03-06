extern ft_list_new
%include "t_list.inc"


section .text
	global ft_list_push_front

ft_list_push_front:
    push rdi
    push rsi
    mov rdi, rsi
    call ft_list_new  wrt ..plt
    pop rsi
    pop rdi  

push_front:
	mov r8, [rdi]
	mov [rax + t_list.next], r8
	mov [rdi], rax 


.end:
	ret



section .note.GNU-stack noalloc noexec nowrite progbits