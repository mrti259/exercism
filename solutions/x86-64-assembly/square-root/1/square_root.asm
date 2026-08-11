section .text
global square_root

; int square_root(int radicand);
square_root:
    ; x = radicand;
    mov eax, edi

    .loop:
        ; while ((x * x) - radicand)
        mov edx, eax
        imul edx, edx
        sub edx, edi
        jz .ret

        ; x = (x + radicand / x) / 2;
        ; y = radicand / x
        mov ecx, eax
        mov eax, edi
        mov edx, 0
        div ecx
        
        ; y = y + x
        add eax, ecx
        
        ; y = y / 2
        shr eax, 1
        jmp .loop

    .ret:
        ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
