extern _ft_list_push_front, printf
global main

section .data
	begin:  dq 0
	str1:   db "Premier insere (donc dernier)", 0
	str2:   db "Dernier insere (donc premier)", 0
	fmt:    db "Data: %s", 10, 0

section .text
main:
	push rbp
	mov rbp, rsp
	push rbx
	sub rsp, 8

	; Insertion 1
	mov rdi, begin
	lea rsi, [str1]
	call _ft_list_push_front

	; Insertion 2
	mov rdi, begin
	lea rsi, [str2]
	call _ft_list_push_front

	; Boucle d'affichage
	mov rbx, [begin]
.loop:
	test rbx, rbx
	jz .done
	
	lea rdi, [fmt]
	mov rsi, [rbx]
	xor rax, rax
	call printf
	
	mov rbx, [rbx + 8] 
	jmp .loop

.done:
	add rsp, 8
	pop rbx
	leave
	ret