; Problem 5 - https://projecteuler.net/problem=5

ExitProcess PROTO

.data
numero QWORD 0

.code
main PROC
	mov rbx, 20
	
L1:
	INC RBX
	MOV RCX, 20
L2:
	MOV RDX, 0
	MOV RAX, RBX
	DIV RCX
	CMP RDX, 0
	JNE L1
	LOOP L2

	MOV numero, RBX


	call ExitProcess
main ENDP

END