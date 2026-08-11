section .text
global square_of_sum
global sum_of_squares
global difference_of_squares

square_of_sum:
    ; sum = 0;
    mov eax, 0
    
    .loop:
        ; while (number > 0)
        cmp edi, 0
        jng .ret

        ; sum += number * number
        add eax, edi
        
        ; number--
        dec edi
        jmp .loop

    .ret:
        ; return sum * sum;
        imul eax, eax
        ret

sum_of_squares:
    ; sum = 0;
    mov eax, 0
    
    .loop:
        ; while (number > 0)
        cmp edi, 0
        jng .ret

        ; sum += number * number
        mov edx, edi
        imul edx, edi
        add eax, edx
        
        ; number--
        dec edi
        jmp .loop

    .ret:
        ret

difference_of_squares:
    ; armo stackframe
    push r12
    push r13
    
    mov r12d, edi ; preservo edi
    call sum_of_squares
    mov r13d, eax ; guardo resultado
    
    mov edi, r12d ; restablezco edi
    call square_of_sum
    sub eax, r13d

    ; restablezco stackframe
    pop r12
    pop r13
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
