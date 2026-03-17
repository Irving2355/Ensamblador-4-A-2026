;Servicios 01h y 02h
.model small 
.stack 100h
.data

msg1 db 13,10,'Presiona una tecla: $'
msg2 db 13,10,'La tecla capturada fue: $'  
car db ?
.code
main:
    mov ax, @data 
    mov ds, ax

    ;pedir una tecla
    mov ah, 09h
    lea dx, msg1
    int 21h 

    ;leer el caracter
    mov ah, 01h
    int 21h
    mov car, al 

    ;mostrar mensaje 2
    mov ah, 09h
    lea dx, msg2
    int 21h

    ;mostrar caracter
    mov dl, car 
    mov ah, 02h
    int 21h

    mov ax, 4C00h ;mov ah, 4Ch
    int 21h
end main