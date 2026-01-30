
extern _ft_lst_new


; void ft_list_push_front(t_list **begin_list, void *data);


section .text
	global _ft_list_push_front

_ft_list_push_front:
	push rdi
	mov rdi, rsi
	call _ft_lst_new
	pop rdi

	test rax, rax
	jz .error

	mov r9, [rdi] 			; adresse ptr begin
	mov [rax + 8], r9       ; le next du nouveau devient l ancien begin
	mov [rdi], rax          ;  adresse ptr begin devient adresse nouveau noeu 


	; s occupe pas du next ancien il pointe toujours sur null OU la next value de base

.error:
	ret