.model small
.stack 100h
.code
main proc
    ;display user prompt
    mov ah,2 ;prepare to display
    mov dl,'?' ;char to display
    int 21H ;display "?"
    
    
    ;initialize chacacter count
    XOR cx,cx ;count = 0
    ;read a character 
    mov ah,1 ;prepare to read
    int 21h ;read a char
    ;while character is not a carriage return do  while 
    while_:
    cmp al,0DH  ;cr?
    je End_while ;yes exit loop
    ;save character on the stack and  increment count    
    push ax ;push it on stack     
    inc cx ;count =count + 1
   ;read a character 
   int 21h ; read a char
   jmp while_ ;loop back 
   End_while :
   ;go to a new line
   mov ah,2 ;display char fcn
   mov DL,0DH ; cr
   int 21h  ;execute 
   mov dl,0ah
   int 21h ;exexute
   jcxz exit ;  exit if no character read
 ;for count times do 
 top: .
 ;pop a character from the stack
 pop dx ;get a char  from stack
 ;display it 
   int 21h  ;display   it
    loop top.
    ;end,for
    exit:
    mov ah,4ch
    int 21h 
    main endp
        end main