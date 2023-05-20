.model small
.data
       
.code
main proc 
    
      mov ax, @data
      mov ds, ax   
      
      
      mov bl, 'D'
      mov dl,bl
      mov bh,0
      mov cx,6
      mov ah,2
      
      L1:
      
      shl bl,1
      jc L2
      mov dl, '0'
      int 21h
      jmp L3
      
      L2:
      mov dl,'1'
      int 21h
      inc bh
      
      L3:
      loop L1