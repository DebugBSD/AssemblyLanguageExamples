; Problem 6 - https://projecteuler.net/problem=6

ExitProcess PROTO

.data 

numero QWORD 0

.code
main PROC
	MOV R8, 0
	MOV R9, 0
	MOV RCX, 100

L1:
	ADD R8, RCX
	MOV RDX, 0
	MOV RAX, RCX
	MUL RCX
	ADD R9, RAX
	LOOP L1

	MOV RDX,0
	MOV RAX, R8
	MUL R8
	SUB RAX, R9

	MOV numero, RAX

	call ExitProcess
main ENDP

END