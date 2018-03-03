; main.asm - Problem 3 - https://projecteuler.net/problem=3

ExitProcess PROTO

.code
main PROC
	MOV RBX, 600851475143
	; MOV RBX, 48
	MOV R8, RBX         ; Temporal 
	MOV RSI, 2          ; Divisor
	MOV RCX, 0
	
L1:
	; Dividendo
	MOV RDX, 0
	MOV RAX, RBX

	; Division
	DIV RSI
	CMP RDX, 0

	JNE FACTORNOTFOUND
	; Factor is found...
	PUSH RSI
	INC RCX
FACTORISSAVED:
	MOV RBX, RAX
	MOV R8, RAX
	MOV RSI, 2
	JMP ENDCYCLE
FACTORNOTFOUND:
	MOV RBX, R8
	INC RSI
	MOV RDX, 0
ENDCYCLE:
	CMP RBX, 1
	JE EXIT

	JMP L1

EXIT:
	pop RAX
	loop EXIT




	call ExitProcess
main ENDP

END