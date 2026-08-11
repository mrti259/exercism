section .text
global to_rna

; char *to_rna(const char *strand, char *buffer)
to_rna:
    mov ecx, 0

.loop:
    ; Cargar el carácter actual de dna[i] en al
    mov al, byte [rdi + rcx]      ; al = dna[i]

    ; Verificar si hemos llegado al final de la cadena (carácter nulo)
    test al, al
    jz .end                       ; Si al == 0, salir del bucle

    ; Switch case para convertir el carácter de ADN a ARN
    cmp al, 'G'
    je .case_G
    cmp al, 'C'
    je .case_C
    cmp al, 'T'
    je .case_T
    cmp al, 'A'
    je .case_A

    ; Si no es ninguno de los casos anteriores, simplemente copiar el carácter
    jmp .default

.case_G:
    mov byte [rsi + rcx], 'C'     ; rna[i] = 'C'
    jmp .next

.case_C:
    mov byte [rsi + rcx], 'G'     ; rna[i] = 'G'
    jmp .next

.case_T:
    mov byte [rsi + rcx], 'A'     ; rna[i] = 'A'
    jmp .next

.case_A:
    mov byte [rsi + rcx], 'U'     ; rna[i] = 'U'
    jmp .next

.default:
    mov byte [rsi + rcx], al      ; rna[i] = dna[i] (caso por defecto)

.next:
    ; Incrementar el índice i
    inc ecx                       ; i++
    jmp .loop                     ; Repetir el bucle

.end:
    ; Copiar el carácter nulo al final de la cadena rna
    mov byte [rsi + rcx], al      ; rna[i] = dna[i] (que es 0, el carácter nulo)

    ; Retornar
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
