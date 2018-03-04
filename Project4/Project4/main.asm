;------------------------------------------------------------------------------
; main.asm - Problem 4 - https://projecteuler.net/problem=4
;
; Descripcion: Este programa calclula el producto de dos numeros y devuelve el
; mayor numero palindromo.
;
;
;
;------------------------------------------------------------------------------

ExitProcess PROTO
NumberIsPalindrome PROTO 
ConvertNumberToArray PROTO
.data

NUMBERS BYTE '0','1','2','3','4','5','6','7','8','9',0
ARRAY_OF_NUMBERS BYTE 10 DUP(0)
NUMBER BYTE '9009', 0
MAX DWORD 0


.code
main PROC
	MOV R13,0 
	MOV R14, 0

	MOV R11, 999
	MOV R12, 999

L1:

	MOV R12, 999
L2:
	MOV RAX, R11
	MUL R12
	MOV R14, RAX
	MOV RDI, OFFSET ARRAY_OF_NUMBERS
	call ConvertNumberToArray

	; RCX ahora tiene la longitud del array.
	; RSI tiene el offset del array.
	call NumberIsPalindrome 
	CMP RAX,0
	JE NOTPALINDROME
	; Guardar solo el mayor cuando es palindromo.
	MOV RAX, R14
	CMP R13, RAX
	JAE NOTPALINDROME
	MOV R13, RAX
NOTPALINDROME:
	DEC R12
	CMP R12, 0
	JNE L2
	DEC R11 
	CMP R11, 0
	JNE L1
	

	call ExitProcess
main ENDP

; ------------------------------------------------------------------------------
; Verifica si un numero es palindromo o no...
;
; Entrada: Un String con el numero en RAX.
; Salida: Un string con el offset a un array de bytes en RDI.
; ------------------------------------------------------------------------------
ConvertNumberToArray PROC
	MOV RDX, 0
	MOV RCX, 0
DIVIDE:
	MOV RDX, 0
	MOV R8, 10
	DIV R8
	MOV [RDI], RDX
	INC RDI
	INC RCX
	CMP RAX, 0
	JNE DIVIDE
	ret
ConvertNumberToArray ENDP


;------------------------------------------------------------------------------
; Verifica si un numero es palindromo o no...
;
; Entrada: Un String con el numero en RSI.
; Salida: Indicador de si es palindromo o no en RAX.
; ------------------------------------------------------------------------------
NumberIsPalindrome PROC
	MOV RBX, RCX
	DEC RBX
	MOV RAX, RCX
	MOV RDX, 0
	MOV R8, 2
	DIV R8
	CMP RDX, 0
	JE NUMBER_IS_PAIR
	INC RAX
NUMBER_IS_PAIR:
	MOV RCX, RAX

	MOV RSI, OFFSET ARRAY_OF_NUMBERS
	MOV RDI, OFFSET ARRAY_OF_NUMBERS
	ADD RDI, RBX
	
L1:
	MOV RAX, 0
	MOV RBX, [RDI]
	CMP BL, BYTE PTR [RSI]
	JNE EXIT
	MOV RAX, 1
	INC RSI
	DEC RDI
	LOOP L1
EXIT:

	ret
NumberIsPalindrome ENDP

END