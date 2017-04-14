.model small
.stack 200h
.code
main proc

mov ax,0
call indec
mov bx,ax

mov ah,2
mov dl,0ah
int 21h

mov cx,0
call indec
mov cx,ax
dec cx

mov ah,2
mov dl,0ah
int 21h

mov ax,bx
l1:
mul bx
loop l1

push ax
mov ah,2
mov dl,0ah
int 21h
pop ax

mov ah,4ch
int 21h
main endp

indec proc

push dx
push cx
push bx

start:
mov ah,2
mov dl,'?'
int 21h
mov bx,0
mov cx,0
mov ah,1
int 21h

cmp al,'-'
je minus
cmp al,'+'
je plus
jmp rep_loop

minus:
	mov cx,1
plus:
	int 21h

rep_loop:
cmp al,'0'
jnge not_digit
cmp al,'9'
jnle not_digit
sub al,30h

mov ah,0
push ax
mov ax,10
mul bx
pop bx
add bx,ax
mov ah,1
int 21h
cmp al,0dh
jne rep_loop
mov ax,bx
cmp cx,0
je exit
neg ax

exit:
pop bx
pop cx
pop dx
ret
not_digit:
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h
jmp start
indec endp

outdec proc

push ax
push bx
push cx
push dx
; if ax<0

cmp ax,0
jl if_check
jge else_label
if_check:
push ax

mov dl,'-'
mov ah,2
int 21h

neg ax

else_label:

mov cx,0
mov bx,10

rep_loop:
mov dx,0
div bx
push dx
inc cx
cmp ax,0

jne rep_loop
mov ah,2


print_loop:
pop dx
add dl,30h
int 21h

loop print_loop
pop dx
pop bx
pop cx
pop ax

ret 
outdec endp

end main