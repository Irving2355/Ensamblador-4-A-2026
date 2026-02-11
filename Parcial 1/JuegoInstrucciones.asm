.model small

.stack 100h

.data 

ARR DB 10,20,30,40
MSG DB "HOLA MUNDO","$"

.code

main:  

    MOV AX, @data
    MOV DS, AX

    ;XCHG EXCHANGE INTERCAMBIO
    MOV AX, 5
    MOV BX, 9
    XCHG AX, BX
    
    ;LEA LOAD EFFECTIVE ADDRESS CARGA DIRECCION
    LEA SI, ARR  ;CARGA DIRECCION
    MOV AL, ARR  ;CARGA EL DATO ARR[0]=10
    LEA DX, MSG   
    
    ;***********    ALU ************  
    ;ADD SUMAR
    ;SUB RESTAR
    
    ;LIMPIA EL REGISTRO
    MOV AX, 0
    
    MOV AL, 10
    ADD AL, 5
    
    MOV AL, 10
    SUB AL, 10 ;AL = 0 SE ACTIVA ZF=1
    
    MOV AL, 0FFh ;255
    ADD AL, 01h  ;CF = 1 AL = 00h 
    
    
    ;INC INCREMENTA
    ;DEC DECREMENTA
    
    MOV CX, 0
    INC CX  ; ++
    DEC CX  ; --
    ;INC Y DEC NO MODIFICAN LA CF 
    
    ;********   LOGICA  ******** 
    MOV AL, 0Fh ;00001111
    AND AL, 03h ;00000011
                ;00000011 
                ;SOLO QUEDAN LOS 2 BITS BAJOS
    
    MOV AL, 03h ;00000011
    OR  AL, 10h ;00010011
                ;00010011 
                ;ENCENDIMOS EL BIT 4 
    
    ;XOR CAMBIO/TOGGLE
    MOV AL, 55h
    XOR AL, 0FFh ;INVIERTE LOS BITS EN ESTE CASO
    
    MOV AL, 99h
    XOR AL, AL ;AL = 0
    
    MOV AL, 55h
    NOT AL
    

END main