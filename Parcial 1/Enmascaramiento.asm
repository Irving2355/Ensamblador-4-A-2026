;registro de control para permisos
;bit0 LED    bit1 MOTOR
;bit2 ALARMA bit3 MODO_SEGURO 

.model small

.stack 100h

.data

regCtrl    db  03h ;00000011b

MASK_LED   equ 01h ;00000001b
MASK_MOTOR equ 02h ;00000010b
MASK_ALARM equ 04h ;00000100b
MASK_SAFE  equ 08h ;00001000b

outAfterOr  db 0
outAfterAnd db 0
outSafeIsOn db 0 ; 1 si es modo seguro activo

.code
main: 

    mov ax, @data
    mov ds, ax
    
    ;encender led y alarma
    ;OR enciende bits
    mov al, regCtrl
    or  al, (MASK_LED + MASK_ALARM)  ;(0h)
    mov outAfterOr, al
    
    ;apagar motor
    ;usamos and y not(mascara)
    mov al, outAfterOr     ;00000111 
    mov bl, MASK_MOTOR
    not bl
    and al, bl             ;11111101
                           ;00000101 
    mov outAfterAnd, al
    
    ;modo seguro
    ;TEST and que no se guarda cambia banderas
    mov  al, outAfterAnd ;00000101
    test al, MASK_SAFE   ;00001000
    jz SafeOff
SafeOn:
    mov outSafeIsOn, 1
    jmp Done          
SafeOff:
    mov outSafeIsOn, 0
Done:
    int 3  

end main