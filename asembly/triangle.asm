.model smal
.stack 200h
.code
main proc
mov ah,2
mov cx,5
L2:
mov dl,0ah
int 21h
mov dl,53
mov bx,cx
L1:
int 21h
dec dl
loop L1
mov cx,bx
loop L2
mov ah,4ch
int 21h
main endp
end main