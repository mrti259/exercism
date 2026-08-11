section .text
global steps

; int steps(int number);
steps:
    ; if (number < 1) return -1;
    cmp edi, 1
    jl .invalid

    ; int count = 0
    mov eax, 0

    .loop:
        ; while (number > 1)
        cmp edi, 1
        jng .ret
        
        ; count++
        inc eax
        
        ; if (number % 2 == 0) number = number / 2;
        test edi, 1
        jz .even
        
        ; else number = 3 * number + 1
        lea edi, [edi + edi * 2 + 1]
        jmp .loop

    .even:
        shr edi, 1
        jmp .loop    

    .invalid:
        mov eax, -1
        jmp .ret

    .ret:
        ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
