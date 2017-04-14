.model small
.stack 200h
.data
msg1 db 10,13,"its a digit $"
.code

main proc

;TAKING INPUT
mov ah,1
int 21h

;SEARCHING FOR UPPERCASE LETTER
cmp al,'A'
jge label1
jmp uppercase_notfound
label1:
cmp al,'Z'
jle upper_case
jmp uppercase_notfound

;CONVERTING UPPERCASE TO LOWERCASE AND PRINTING
upper_case:
	mov bl,al
	add bl,32
	mov dl,bl
	mov ah,2
	int 21h
	jmp end_program

;SEARCHING FOR LOWERCASE LETTER
uppercase_notfound:
cmp al,'a'
jge label2
jmp lowercase_notfound
label2:
cmp al,'z'
jle lower_case
jmp lowercase_notfound

;CONVERTING LOWERCASE TO UPPERCASE AND PRINTING
lower_case:
	mov bl,al
	sub bl,32
	mov dl,bl
	mov ah,2
	int 21h
	jmp end_program

;SEARCHING FOR DIGIT
lowercase_notfound:
cmp al,'0'
jge label3
jmp end_program
label3:
cmp al,'9'
jle digit
jmp end_program

;PRINTING MSG FOR DIGIT
digit:
	mov ah,9
	mov dx,offset msg1
	int 21h
	jmp end_program

end_program:
mov ah,4ch
int 21h
main endp
end main