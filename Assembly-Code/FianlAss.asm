.MODEL SMALL    
.STACK 100H
.CODE
MAIN PROC
;display user promot
        MOV AH, 2
        MOV DL, '?'
        INT 21H 
        
;initialize character count
        XOR CX, CX
;read a character
        MOV AH,1
        INT 21H     
        
        
;While chracter is not a carrige return do
WHILE_:
        CMP AL,0DH
        JE END_WHILE
        ;save charcter on the stack and increment counter
        PUSH AX
        INC CX
;read a character
        INT 21H
        JMP WHILE_
END_WHILE:
;go to a new line
        MOV AH,2                                   
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        JCXZ EXIT
;for coutn times do
TOP:
;pop a charcter from the stack  
        POP DX
;display it     
        INT 21H
        LOOP TOP
;end for
EXIT:
        MOV AH,4CH
        INT 21H
MAIN ENDP
        END MAIN