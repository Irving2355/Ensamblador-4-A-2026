.model small

.stack 100h

.data 

stock db 10
venta db 18
ok    db 0

.code

main: 

    mov ax, @data
    mov ds, ax
    
    mov al, stock
    
    sub al, venta
    
    jc sin_stock
    
    mov stock, al
    mov ok, 1
    jmp fin 
    
    sin_stock:
    mov ok, 0
    ;jmp main
    
    fin: 
    mov ah, 4Ch
    int 21h
end main