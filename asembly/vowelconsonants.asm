.model small
.stack 200h
.data
str1 db "pasha$"
vcount db 0
ccount db 0
.code
main proc

mov ax,@data
mov ds,ax
mov cx, lengthof str1
sub cx,1
mov si,0

l1:
	mov al,str1[si]
	cmp al,'a'
	jge label1
	label1:
	cmp al,'z'
	jle label2
	
	label2:
	cmp al,'a'
	je isvowel
	cmp al,'e'
	je isvowel
	cmp al,'i'
	je isvowel
	cmp al,'o'
	je isvowel
	cmp al,'u'
	je isvowel
	
	inc ccount
	jmp label3
	isvowel:
	inc vcount12:33 PM 3/29/2016
	label3:
	inc si
loop l1

add vcount,'0'
add ccount,'0'

mov ah,2
mov dl,vcount
int 21h

mov dl,0ah
int 21h

mov ah,2
mov dl,ccount
int 21h

mov ah,4ch
int 21h
main endp
end main