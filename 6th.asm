TITLE CHANGE TO UPPERCASE
	.MODEL SMALL
	.DATA
S DB "Hello this is 8086programming",'$'
LEN DB $-S-1
	.STACK
	.CODE
MAIN PROC FAR 
	MOV AX,@DATA
	MOV DS,AX
	
	
	MOV CX,LEN+1
	MOV AX,'a'-'A'
RE: MOV BX,CX
	CMP S[BX-1],'a'
	JB SKIP
	CMP S[BX-1],'z'
	JA SKIP
	SUB S[BX-1],AX
SKIP:LOOP RE

	MOV AH,02H
	MOV DL,0DH
	INT 21H
	MOV AH,02H
	MOV DL,0AH
	INT 21H
	MOV AH,09H
	LEA DX,S
	INT 21H
	MOV AX, 4C00H
	INT 21H
MAIN ENDP
END MAIN