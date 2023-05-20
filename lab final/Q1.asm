      
.STACK 100H
 
 .DATA
   PROMPT_1  DB  'Enter a string of Capital Letters : $'
   PROMPT_2  DB  0DH,0AH,'The longest consecutive increasing string is : $'
   INVALID   DB  0DH,0AH,'Invalid string of Capital Letters. Try again : $'
 
 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX
 
     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H
 
     JMP @START               
 
     @TRY_AGAIN:                 
 
     LEA DX, INVALID           
     MOV AH, 9
     INT 21H
 
     @START:                      
                                   
     MOV AH, 1                 
     INT 21H                    
 
     CMP AL, 0DH           
     JE @TRY_AGAIN                
 
     CMP AL, 41H               
     JB @TRY_AGAIN               
 
     CMP AL, 5AH             
     JA @TRY_AGAIN               
 
     MOV BL, AL                  
     MOV BH, AL                  
     MOV DH, AL                  
     MOV DL, 1                
     MOV CL, 1                 
 
     @INPUT:                      
       INT 21H                   
 
       CMP AL, 0DH                
       JE @END_INPUT              
 
       CMP AL, 41H               
       JB @TRY_AGAIN              
 
       CMP AL, 5AH              
       JA @TRY_AGAIN             
 
       INC BL                     
 
       CMP AL, BL                 
       JNE @CHECK_AND_REPLACE     
 
       INC CL                     
       JMP @INPUT                 
 
       @CHECK_AND_REPLACE:        
 
       CMP CL, DL                 
       JLE @SKIP_UPDATION_1      
 
       MOV DH, BH                
       MOV DL, CL                
 
       @SKIP_UPDATION_1:          
 
       MOV BH, AL              
       MOV BL, AL               
       MOV CL, 1          
     JMP @INPUT                  
 
     @END_INPUT:                
 
     CMP CL, DL                   
     JLE @SKIP_UPDATION_2         
 
     MOV DH, BH                  
     MOV DL, CL                   
 
     @SKIP_UPDATION_2:           
 
     MOV BX, DX               
 
     LEA DX, PROMPT_2           
     MOV AH, 9
     INT 21H
 
     XOR CX, CX                 
     MOV CL, BL                
 
     MOV DL, BH                
     MOV AH, 2                  
 
     @OUTPUT:                     
       INT 21H                   
       INC DL                    
     LOOP @OUTPUT                 
 
     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN