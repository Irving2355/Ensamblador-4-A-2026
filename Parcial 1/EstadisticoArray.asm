.model small

.stack 100h

.data   

N       db 10
notas   db 90,75,100,64,88,92,71,85,79,95

outSum dw 0
outAvg db 0
outMax db 0

.code
main: 

    mov ax, @data ;ax 0720
    mov ds, ax    ;ds 0720
    
    xor ax, ax    ;ax 0000
    mov outSum, ax
    
    mov al, notas[0] ;90dec
    mov outMax, al ;90dec
    
     
    ;inicializo los datos del recorrido
    xor si, si   ;int i=0
    mov cl, N    ;int contador=10
    xor ch, ch ;cx H:00 L:0A
 
L1:
    mov al, notas[si]
    mov ah, 0
    
    add outSum, ax ;outSum += ax
    
    mov bl, outMax
    cmp al, bl    ;actual con el maximo
    jbe NoMax
    mov outMax, al
NoMax:
    inc si
    loop L1 ;do while vueltas con cx  
    
    mov ax, outSum
    mov bl, N
    div bl
    
    mov outAvg, al  
    
    mov dx, 0
    mov dx, offset outAvg

end main