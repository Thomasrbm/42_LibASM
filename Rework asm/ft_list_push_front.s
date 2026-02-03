extern _ft_lst_new

section .text
	global _ft_list_push_front

_ft_list_push_front:
	push rdi
	mov rdi, rsi
	call _ft_lst_new
	pop rdi

	test rax, rax
	jz .error

	mov r11, [rdi]
    mov [rax + 8], r11
    mov [rdi], rax

	ret

.error:
	ret



; on touche jamais a **begin (rdi)

;rdi = **begin et [rdi] = *begin 
;new->next = [rax + 8]
;[rax + 8], [rdi]
;**begin = rax
;mov rdi, rax



section .note.GNU-stack noalloc noexec nowrite progbits