bits 64
default rel 

global longitud_cadena, contar_vocales, contar_espacios
global a_mayusculas, invertir 

section .text

longitud_cadena:
    xor eax, eax

    .loop_long:
    mov dl, [rcx + rax]
    cmp dl, 0   ;fin de la cadena con \0 
    je .fin_long
    inc eax
    jmp .loop_long

    .fin_long:
    ret 

contar_vocales:
    xor eax, eax

    .loop_vocales:
    mov r10b, [rcx]
    cmp r10b, 0
    je .fin_vocales

    ;convertir las letras a minusculas para comparar
    or r10b, 32

    cmp r10b, 'a'
    je .es_vocal
    cmp r10b, 'e'
    je .es_vocal
    cmp r10b, 'i'
    je .es_vocal
    cmp r10b, 'o'
    je .es_vocal
    cmp r10b, 'u'
    je .es_vocal

    .no_vocal:
    inc rcx
    jmp .loop_vocales

    .es_vocal:
    inc eax
    inc rcx
    jmp .loop_vocales

    .fin_vocales:
    ret 

contar_espacios:
    xor eax, eax

    .loop_espacio:
    mov r10b, [rcx]
    cmp r10b, 0
    je .fin_espacio

    cmp r10b, ' '
    je .es_espacio 

    inc rcx
    jmp .loop_espacio

    .es_espacio:
    inc eax
    inc rcx
    jmp .loop_espacio

    .fin_espacio:
    ret 

a_mayusculas:
    .loop_m:
    mov r8b, [rcx]
    cmp r8b, 0
    je .fin_m 

    cmp r8b, 'a'
    jb .copiar_char
    cmp r8b, 'z'
    ja .copiar_char
    sub r8b, 32

    .copiar_char:
    mov [rdx], r8b
    inc rcx
    inc rdx
    jmp .loop_m 

    .fin_m:
    mov byte [rdx], 0
    ret 

invertir:
    mov r8, rcx
    mov r9, rdx

    xor eax, eax

    .loop_len:
    cmp byte [r8 + rax], 0
    je .len_obt
    inc eax
    jmp .loop_len

    .len_obt:
    test eax, eax
    jz .cadena_vacia

    ;apuntamos al ultimo caracter que no sea el \0
    lea r10, [r8 + rax - 1]

    mov r11d, eax

    .loop_inv:
    mov cl, [r10]
    mov [r9], cl 
    inc r9
    dec r10
    dec r11d 
    jnz .loop_inv

    mov byte [r9], 0
    ret 

    .cadena_vacia:
    mov byte[r9], 0
    ret 