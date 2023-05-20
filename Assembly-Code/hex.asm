                           .model small
.stack 100h

.data
    dec_num dw 1234   ; decimal number to convert to hexadecimal
    hex_num db 4 dup(?) ; array to store hexadecimal digits

.code
    mov ax, @data
    mov ds, ax

    ; initialize variables
    mov bx, offset hex_num
    mov cx, 4  ; number of nibbles in hexadecimal number

convert_loop:
    xor dx, dx  ; clear dx register for division
    mov ax, dec_num
    div cx      ; divide by 16^cx (i.e., 65536, 4096, 256, 16)
    cmp ah, 0
    je zero_nibble ; jump if remainder is zero
    cmp ah, 10h
    jb hex_digit ; jump if remainder is less than 10h (i.e., 10)
    add ah, 7   ; convert remainder to hex letter (A-F)
hex_digit:
    mov byte ptr [bx], ah ; set hex nibble
    jmp next_nibble
zero_nibble:
    mov byte ptr [bx], '0' ; set hex nibble to '0'
next_nibble:
    inc bx      ; move to next nibble in array
    dec cx      ; decrement nibble counter
    cmp cx, 0   ; check if all nibbles have been processed
    jne convert_loop

    ; print hexadecimal number
    mov bx, offset hex_num
    mov cx, 4
print_loop:
    mov dl, [bx]
    mov ah, 2
    int 21h
    inc bx
    loop print_loop

    mov ah, 4ch
    int 21h
end
