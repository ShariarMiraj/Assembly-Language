.MODEL SMALL
.STACK 100H
.DATA

msg01 DB "Enter Hexa Number : $"
msg02 DB 10,13, "Decimal Number : $"  

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, msg01
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BL, AL   
    
    
    CMP BL,39h
    JG PRINT01
    
    
    PRINT01:
     
    MOV AH, 9
    LEA DX, msg02
    INT 21H
    
    MOV AH, 2
    SUB BL, 11h
    MOV DL, 31h
    INT 21H
   
    MOV DL, BL
    INT 21H
    JMP EXIT
    
      
    EXIT:
    MOV AH, 4CH
    INT 21H                  
    
    
    
    
    
   
    MAIN ENDP
END MAIN 