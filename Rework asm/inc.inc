%ifndef INC_INC  
%define INC_INC       

extern printf

%macro PRINTF_MAC 2
    lea rdi, [rel %1] 
	mov rsi, [rel %2]  ; en lea , ca montre le PIE
    xor rax, rax      
    call printf wrt ..plt
%endmacro

%endif