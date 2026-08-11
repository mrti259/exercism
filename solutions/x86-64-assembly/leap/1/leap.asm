section .text
global leap_year

; int leap_year(int year)
leap_year:

    ; if (year % 4 != 0) return 0
    xor rdx, rdx   ; limpio rdx
    mov rax, rdi   ; cargo dividendo en rax
    mov rbx, 4     ; cargo divisor en rbx
    div rbx        ; rax / rbx
    test rdx, rdx
    jnz .ret_false

    ; if (year % 100 != 0) return 1;
    xor rdx, rdx   ; limpio rdx
    mov rax, rdi   ; cargo dividendo en rax
    mov rbx, 100   ; cargo divisor en rbx
    div rbx        ; rax / rbx
    test rdx, rdx
    jnz .ret_true

    ; return year % 400 == 0;
    xor rdx, rdx   ; limpio rdx
    mov rax, rdi   ; cargo dividendo en rax
    mov rbx, 400   ; cargo divisor en rbx
    div rbx        ; rax / rbx
    test rdx, rdx
    jz .ret_true

    .ret_false:
        mov rax, 0
        ret
        
    .ret_true:
        mov rax, 1
        ret


%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
