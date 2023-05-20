.model small
.stack 100h
.data

a db "Enter the number :$ "
b db " Is even number $ "
c db " Is odd number  $"

.code 

main proc 
    
     mov ax,@data
     mov ds,ax
     
     mov ah,9
     lea dx,a
     int 21h
     
     
     mov ah,1
     int 21h
     mov bl,al 
     
     
     mov al,bl
     test al ,1 
     jz even
     jmp odd
     
     even: 
     
     mov ah,9
     lea dx,b
     int 21h 
     jmp exit 
     
     
     odd:
     
     mov ah,9
     lea dx,c
     int 21h
   
     
     
     exit:        
     mov ah,4ch
     int 21h
     main endp
end  main
     