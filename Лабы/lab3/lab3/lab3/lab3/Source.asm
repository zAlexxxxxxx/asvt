; 17 вариант
.686 
.model flat, stdcall 
.stack 100h
 
.data
	mA dword		2,	41,	21, 6,	12, 4,	64
	mB dword		7,	3,	9,	19, 9,	10, 2
	mS dword 0, 0, 0, 0, 0, 0, 0
	N word 7
	buffer dword 0
	buffer_i dword 0
	buffer1 dword 0
	j word 0
  
.code 
ExitProcess PROTO STDCALL :DWORD 

Start:
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	xor esi, esi	
	
	mov ebx, offset mA
	mov edx, offset mB
	mov eax, offset mS
	
	mov cx, N
	cycl:
		finit
		fild dword ptr [edx]
		fild dword ptr [ebx]
		; st(0)=A_i, st(1)=B_i
		fmul st(0), st(1)
		fist dword ptr [eax]

		add ebx, 4
		add edx, 4
		add eax, 4
		loop cycl
	; сейчас полностью рассчитан массив площадей mS
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx

	mov cx, N
	cycl_i:
		call func1

		loop cycl_i
	; сейчас все массивы (mA, mB, mS) отсортированы по убыванию площади (mS)
	jmp exit

exit:
	func1 PROC
		mov edx, offset mS
		mov bx, cx
		;mov cx, N
		mov ax, N
		mov j, ax
		sub j, bx
		mov buffer, 0
		mov buffer_i, 0
		cycl_j:
			xor eax, eax
			mov ax, j
			shl ax, 2	; умножение на 4
			mov eax, [edx+eax]
			cmp eax, buffer
			ja bolshe
			jmp end1
			bolshe:
				mov buffer, eax
				xor eax, eax
				mov ax, N
				sub ax, cx
				mov buffer_i, eax
			end1:
			add edx, 4
			loop cycl_j
		mov cx, bx

		; сейчас по buffer_i хранится номер максимума из оставшегося массива
		
		mov buffer1, offset mS
		call sort
		mov buffer1, offset mA
		call sort
		mov buffer1, offset mB
		call sort
		ret
	func1 ENDP
	sort PROC
		mov eax, buffer_i
		shl ax, 2 ; умножение на 4
		mov ebx, buffer1
		add eax, ebx
		xor ebx, ebx
		mov ebx, [eax]	; в ebx хранится максимум из оставшегося массива
						; в eax хранится адрес этого максимума

		xor edx, edx
		xor esi, esi
		mov dx, j
		shl dx, 2
		add edx, buffer1	; в edx хранится адрес первого элемента оставшегося массива (позиция j)
		mov esi, [edx]
		mov [edx], ebx	; тек.макс -> тек.первый
		mov [eax], esi	; тек.первый -> тек.макс
		ret
	sort ENDP


Invoke ExitProcess, 1 
End Start