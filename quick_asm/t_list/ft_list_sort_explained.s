%include "t_list.inc"

section .text
	global ft_list_sort

ft_list_sort:
	mov r8, rdi
	mov r9, rsi

	test rdi, rdi
	jz .end

.restart:
	xor r10, r10
	mov r11, r8

.cmp:
	mov rdi, [r11]
	mov rsi, [r11 + t_list.next]

	test rsi, rsi
	jz .check

	mov rdi, [rdi + t_list.data]
	mov rsi, [rsi + t_list.data]
	call r9
	jle .next

	;swap:
		mov rax, [r11]
		mov rdx, [r11 + t_list.next]
		mov rcx, [rdx + t_list.next]
		mov [rax + t_list.next], rcx
		mov [rdx + t_list.next], rax
		mov [r11], rdx ; UTILE que pour la 1ere iteration pour begin list (r8) sinon apres lea le rend obsolete
		lea r11, [rdx + t_list.next] ; skip rdx, prend rax comme current (et donc futur previous)
		mov r10, 1
		jmp .cmp
	; 	  [r11]  
	;r11 -> rax -> rdx -> rcx

	; le swap
	;		 						  [r11]  
	; rdx ->(r11 depuis autre part -> rax ->  rcx

	; mov
	;[r11]  
	; rdx -> rax ->  rcx


	; lea
	;		[r11]
	; r11 -> rax ->  rcx


	; r11 = previous next
	; [r11] = current
.next:
	mov rax, [r11]
	lea r11, [rax + t_list.next]  ;[[r11] + t_list.next] en une ligne mais existe pas
	jmp .loop

	; r11 = current->next
	; mov [rax + t_list.next][r11] = next

	; donc une fois a loop [r11] = current

.check:
	cmp r10, 0
	jne .restart

.end:
	ret

section .note.GNU-stack noalloc noexec nowrite progbits