extern malloc


section .text
	global _ft_lst_new



; rdi va contenir le segment data

_ft_lst_new:
	push rdi
	mov rdi, 16
	call malloc wrt ..plt
	pop rdi

	test rax, rax     ; Vérifie si malloc a échoué (NULL)
    jz .error

	mov [rax], rdi
	mov qword [rax + 8], 0   ; next a null
	ret

.error:
	xor rax, rax
	ret