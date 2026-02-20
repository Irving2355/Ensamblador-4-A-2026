.model small

.stack 100h

.data

M    dw 65521
A    dw 75
seed dw 1234  ;semilla siempre menor a M mayor que A 

rand1 db 0
rand2 db 0

MINVAL db 10
MAXVAL db 20

.code

NextLehmer16:  
    ;aleatorio = A*seed%M
    mov ax, seed
    mul A        ;ax = ax*A
    div M ;dx residuo
    mov seed, dx
    ret

main: 

    mov ax, @data
    mov ds, ax
    
    
    call NextLehmer16
    mov al, dl
    mov rand1, al
    
    ;segundo aleatorio acotado 
    ; valorminimo + rand()%(valormax - minimo +1)
    mov al, MAXVAL
    sub al, MINVAL
    inc al
    mov bl, al
    
    call NextLehmer16
    mov al, dl  ;rand()
    
    xor ah, ah
    div bl ;ah residuo
    
    mov al, ah
    add al, MINVAL
    mov rand2, al
    
    mov dx, 0
    mov dx, offset rand1

end main