bits 64
default rel 
section .text
global suma_arreglo

;rcx = apuntador al arreglo
;edx = numero de elementos
;eax = valor de retorno 

suma_arreglo:
    xor eax, eax ;suma actual = 0
    xor r8d, r8d ;r8d se usara como indice i

    .bucle:
    cmp r8d, edx
    jge .fin

    add eax, dword [rcx + r8*4]

    inc r8d
    jmp .bucle

    .fin:
    ret 