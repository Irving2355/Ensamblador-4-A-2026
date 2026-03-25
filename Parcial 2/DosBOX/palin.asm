;Verificar si es palindromo
.model small
.stack 100h
.data 
msg1 db 13,10,'Dame una palabra: $'
msg2 db 13,10,'Es palindromo $'
msg3 db 13,10,'No es palindromo $'

buffer db 20
        db 0
        db 20 dup('$')
.code
main:
    mov ax, @data 
    mov ds, ax

    ;Pedir palabra
    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 0Ah
    lea dx, buffer
    int 21h

    ;obtener longitud
    mov si, offset buffer
    mov cl, [si+1]
    xor ch, ch 

    mov di, si ; apuntan al buffer 
    add si, 2
    add di, 2  ; si y di apunten al inicio de la cadena
    add di, cx ;di apunta + 1 al final de la cadena
    dec di   ; di apunta al final de la cadena

    comparar:
    cmp si, di
    jge esPal

    mov al, [si]
    mov bl, [di] 

    cmp al, bl 
    jne noPal

    inc si 
    dec di 
    jmp comparar

    esPal:
    mov ah, 09h
    lea dx, msg2
    int 21h
    jmp final

    noPal:
    mov ah, 09h
    lea dx, msg3
    int 21h

    final:
    mov ah, 4Ch
    int 21h
end main