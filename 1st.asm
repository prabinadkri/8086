TITLE TO ADD NUMBERS LYING BETWEEN 50 AND 150
        .MODEL SMALL
        .DATA
TAB DW 10,100,67,340,22,149,11,153,53,66
SUM DW ?
        .STACK
        .CODE
MAIN PROC FAR
        MOV AX,@DATA
        MOV DS,AX
        MOV AX,0
        LEA BX,TAB
        MOV CX,10
NEXT:   CMP WORD PTR [BX],50
        JBE SKIP
        CMP WORD PTR [BX],150
        JAE SKIP
        ADD AX,[BX]
SKIP:   INC BX
		INC BX
        LOOP NEXT
        MOV SUM,AX
		;converting to decimal
		MOV CX,00H
		MOV BX,10
L1:		MOV DX,0
		DIV BX
		ADD DX,30H
		PUSH DX
		INC CX
		CMP AX,0
		JA L1
		
		MOV AH,02H
DISP:	POP DX
		INT 21H
		LOOP DISP
		
		MOV AX,4C00H
		INT 21H
MAIN	ENDP
END MAIN
		
		
		
		
		




