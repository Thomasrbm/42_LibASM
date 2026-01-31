extern malloc


section .text
	global lst_new

lst_new:
	push rdi
	mov rdi, 16
	call malloc wrt ..plt
	pop rdi

	test rax, rax
	jz .error

	mov [rax], rdi				 ; pk pas de mot ???, car deux de taille 64
	mov qword [rax + 8], 0       ; PK QWORD ????  car 0 n a pas de taill, faut lui dire
	ret

.error:
	ret
