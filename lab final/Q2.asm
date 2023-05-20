

DATA    segment
    msg1    db 'Type a character: $', 0AH, 0DH
    msg2    db  0AH,0DH,'The ASCII Code of ', 
    msg3    db  ?,' in binary is $'
    msg4    db  0AH,0DH,'The number of 1 bits is '
    msg5    db  ?,'$'
DATA    ENDS

Code    segment
    assume  cs:code, DS: DATA
    
START:
    MOV AX, DATA
    MOV DS, AX  
    
    XOR BL,BL  
    
    
    mov ah,9
    Lea DX, msg1
    int 21H;     
    
    
    MOV AH, 1
    INT 21H
    
    MOV BL,AL
    
    MOV msg3, AL
    
    
    MOV AH,9
    LEA DX ,msg2
    INT 21H
    
    
    MOV CH, 00H
    
    
    MOV AH,2    
    
    
    MOV CL, 8
   
DISPLAY:
    RCL BL,1
    
    JC  ONE 
    
    MOV DL, '0'
    JMP PRINT
ONE:
    MOV DL, '1'    
    INC CH 
PRINT:
    INT 21H
    DEC CL  
    CMP CL, 0 
    JZ  NO_OF_ONES
    JMP DISPLAY
           
NO_OF_ONES:
    ADD CH,30H
    MOV msg5, CH
               
    
    MOV AH,9
    LEA DX,msg4
    INT 21H    
              
EXIT:
    MOV AH, 4CH
    INT 21H
        
CODE    ENDS
    END START