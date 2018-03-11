; Problem 7 - https://projecteuler.net/problem=7

NUMERO_PRIMO = 10001

ExitProcess PROTO

.DATA
prime QWORD 0

.code
main PROC
	MOV R8, 1
	MOV RBX, 0

L1: 
	INC R8
	MOV RCX, R8
	DEC RCX

L2:
	CMP RCX, 1
	JE L3
	MOV RDX, 0
	MOV RAX, R8
	DIV RCX
	CMP RDX, 0                   ; No es primo 
	JE L1

L3:
	LOOP L2

	CMP RDX, 0
	JE L1
	INC RBX
	CMP RBX, NUMERO_PRIMO
	JE EXIT
	
	JMP L1

EXIT: 
	MOV prime, R8
	call ExitProcess
main ENDP

END