PUBLIC file_asm_f1
EXTRN fc_f1:PROC

.data
	i qword 0
	N qword 0
	mass qword 0



.code 

	file_asm_f1 PROC
		;sub rsp, 80

		mov N, rcx
		mov mass, rdx
		
		xor rax, rax
		xor rbx, rbx
		xor rcx, rcx
		xor rdx, rdx

		mov rcx, N
		mov rdx, mass
		l1:
			movsd xmm0, qword ptr [rdx]

			mov r13, rdx
			mov r14, rcx
			sub rsp, 8
			call fc_f1
			add rsp, 8
			mov rdx, r13
			mov rcx, r14


			movsd qword ptr [rdx], xmm0
			inc i
			add rdx, 8
			loop l1

		;add rsp, 80
		ret
	file_asm_f1 ENDP

End