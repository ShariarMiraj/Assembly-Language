.model small
.stack 100h

.data
char_sequence db 'Hello, World!' ; Example character sequence
length equ $ - char_sequence    ; Length of the character sequence

.code
main proc
    mov ax, @data
    mov ds, ax ; Set up data segment

    lea si, char_sequence ; Load effective address of character sequence into SI
    mov al, [si] ; Load the first character from the sequence into AL

    ; Display the first character
    mov ah, 02h ; Function 02h - display character in AL
    int 21h ; Call DOS interrupt 21h

    mov ah, 4Ch ; Function 4Ch - terminate program
    int 21h ; Call DOS interrupt 21h
main endp
end main
