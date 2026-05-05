bits 64
default rel 

global suma, contar_pares, obtener_max

section .text

suma:
    xor rax, rax
    xor r8d, r8d

    .bucle_suma:
    cmp r8d, edx
    jge .fin_suma

    ;leer arreglo como entero de 32bits y extender signo a 64
    movsxd r9, dword [rxc + r8*4]
    add rax, r9

    inc r8d
    jmp .bucle_suma

    .fin_suma:
    ret 

contar_pares:
    xor eax, eax
    xor r8d, r8d

    .bucle_pares:
    cmp r8d, edx
    jge .fin_pares

    mov r9d, dword [rcx + r8*4]
    test r9d, 1
    jnz .siguiente
    
    inc eax

    .siguiente:
    inc r8d
    jmp .bucle_pares

    .fin_pares:
    ret 

obtener_max:
    test edx, edx
    jle .arrgelo_vacio

    mov eax, dword [rcx]
    mov r8d, 1

    .bucle_max:
    cmp r8d, edx
    jge .fin_max

    mov r9d, dword [rcx + r8*4]
    cmp r9d, eax 
    jle .no_cambiar

    mov eax, r9d

    .no_cambiar:
    inc r8d
    jmp .bucle_max

    .fin_max:
    ret 

    .arrgelo_vacio:
    xor eax, eax
    ret 