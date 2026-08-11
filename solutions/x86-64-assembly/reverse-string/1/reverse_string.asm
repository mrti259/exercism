section .text
global reverse

;void reverse(char *str);
reverse:
    mov rcx, 0 ; top1 = 0
    .strLen:
        cmp byte [rdi + rcx], 0
        jz .next
        inc rcx ; top1++
        jmp .strLen

    .next:
        mov rdx, 0   ; i = 0
        mov rsi, rcx ; j = top
        dec rsi      ; j = top - 1
        shr rcx, 1   ; top = top / 2

    .loop:
        cmp rdx, rcx ; while (i < top)
        jnl .ret

        mov al, byte [rdi+rdx] ; tmp1 = str[i]
        mov bl, byte [rdi+rsi] ; tmp2 = str[j]
        
        mov byte [rdi+rdx], bl
        mov byte [rdi+rsi], al
        
        inc rdx ; i++
        dec rsi ; j--
        jmp .loop

    .ret:
        ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
