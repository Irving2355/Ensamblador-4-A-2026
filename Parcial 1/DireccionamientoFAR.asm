.model small

.stack 100h

.data 

a db 11h
b db 22h 
c db 33h

.code

main:

    mov ax, @data
    mov ds, ax
    
    mov es, ax
    
    ;es = ds = ax
    
    mov di, offset b 
    
    mov ah, offset a
    
    ;acceso con FAR a datos usando es:di
    
    mov al, es:[di] ;al=22h aqui usa el es
    
    mov bl, b ;aqui usa el ds   
    
    mov ah, 4Ch
    int 21h
END main