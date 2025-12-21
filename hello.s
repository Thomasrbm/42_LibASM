section .data
	msg db "hello world", 0xA  ; apres une declration le curseur est sur la last case declarer
	len equ $ - msg

section .text
	global _start


_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, msg
	mov rdx, len
	syscall

	mov rax, 60
	mov rdi, 0
	syscall



;  nasm -f elf64 hello.s -o hello.o
;  ld hello.o -o hello