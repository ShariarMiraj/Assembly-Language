.model small 
.stack 100h
.data
.code 
main proc
    
    mov ax,@data 
    mov ds,ax
    
    mov ah,1
    int 21h
    mov bl,al
    
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,1
    int 21h
    mov cl,al
    
    cmp bl,bh
    jg a
    
    
    b:
    cmp bh,cl
    jg c 
    
    c:
    mov ah,2
    mov dl,bh
    int 21h
    jmp exit 
    
    a:
    cmp bl,cl
    jg b 
    mov ah,2
    mov dl,cl
    int 21h
    jmp exit
    
    
    d:
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
      
