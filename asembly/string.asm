.model small
.stack 200h
.data 
source db "     this is a string:$"
target db sizeof source dup(?)
.code
main proc
mov ax,@data
mov ds,ax
mov si,0
mov di,lengthof source
sub di,1
l1:
mov dl,source[di]
mov target[si],dl
inc si
dec di
loop l1

mov ah,9
mov dx,offset target

;mov di,lengthof target
;add di,1
mov dl,'$'
mov target[si],dl


int 21h
mov ah,4ch
int 21h
main endp
end main