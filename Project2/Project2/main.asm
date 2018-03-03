; main.asm - Project 2 - https://projecteuler.net/problem=2
ExitProcess PROTO

.code
main PROC

	MOV RDI, 1
	MOV RBX, 2
	MOV RCX, 0
	MOV RSI, 2

L1:
	cmp RCX, 3999999
	jae EXIT
	MOV R8, RDI
	ADD R8, RBX
	MOV RCX, R8


	; Division: RDX:RAX = Dividendo, REG = Divisor, RDX = Resto, RAX = Cociente
	MOV RDX, 0
	MOV RAX, RCX
	MOV R9, 2
	DIV R9
	CMP RDX, 0
	JNZ CONTINUE
	ADD RSI, RCX
CONTINUE:
	MOV RDI, RBX
	MOV RBX, RCX
	JMP L1
EXIT:
	call ExitProcess
main ENDP

END