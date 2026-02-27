;Formato Q8.8
.model small

.stack 100h

.data

A_int  db 3
A_frac db 50

B_int  db 2
B_frac db 25

;internos
A_q88 dw 0
B_q88 dw 0

S_q88 dw 0
P_q88 dw 0

;desempaquetado

S_int  db 0
S_frac db 0

P_int  db 0
P_frac db 0

.code 
main:

    mov ax, @data
    mov ds, ax
    
    ;empaquetar A  
    
    xor ax, ax
    mov al, A_frac
    
    mov bx, 256  
    mul bx
    mov bx, 100
    xor dx, dx
    div bx
    mov cl, al
    
    ;armamos el Q8.8 
    mov ah, A_int
    mov al, cl
    
    mov A_q88, ax
    
    ;empaquetar B  
    
    xor ax, ax
    mov al, B_frac
    
    mov bx, 256  
    mul bx
    mov bx, 100
    xor dx, dx
    div bx
    mov cl, al
    
    ;armamos el Q8.8 
    mov ah, B_int
    mov al, cl
    
    mov B_q88, ax 
    
    ;suma
    
    mov ax, A_q88
    add ax, B_q88
    mov S_q88, ax
    
    ;desempaquetar
    mov S_int, ah
    
    xor ax, ax
    mov al, byte ptr S_q88 
    mov bx, 100
    mul bx
    mov bx, 256
    xor dx, dx
    div bx
    mov S_frac, al
    
    ;Producto 256*256
    
    mov ax, A_q88
    mov bx, B_q88
    mul bx   ;DX:AX producto Q16.16
    
    mov cx, ax
    shr cx, 8  ;formato Q8.16
    mov ax, dx
    shl ax, 8  ;formato Q8.8
    add ax, cx
    mov P_q88, ax   
    
    ;desempaquetar
    mov P_int, ah
    
    xor ax, ax
    mov al, byte ptr P_q88 
    mov bx, 100
    mul bx
    mov bx, 256
    xor dx, dx
    div bx
    mov P_frac, al

end main