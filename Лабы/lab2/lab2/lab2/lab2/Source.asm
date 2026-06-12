.686 
.model flat, stdcall 
.stack 100h	
 
.data
	X dw 0CD5Bh
	Y dw 0E742h
	Z dw 09138h
	M dd 0
	R dd 0
 
.code 
ExitProcess PROTO STDCALL :DWORD 

Start:	
; очистка регистров:
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
; 1 задание:
; настройка цикла:	
	mov ecx, 3
	mov edx, offset X	; перенос адреса Х в регистр edx
; цикл на ecx итераций:
	loop1:
		mov bx, [edx]
		xor bx, 01100011000100001b
		mov [edx], bx
		add edx, 2
		loop loop1
; конец цикла
; 2 задание:
	xor eax, eax
	xor ebx, ebx
	mov ax, X
	mov bx, Y
	sub eax, ebx
	mov bx, Z
	add eax, ebx
	mov M, eax
; сравнение M и 019A8h:
	cmp M, 19A8h
	jle ne_bolshe	; переход к точке ne_bolshe, если M <= 19A8h
	and M, 9238h

	jmp end1	; переход к точке end1
	ne_bolshe:
	rcl M, 5		; циклический сдвиг влево на 5 разрядов с учётом CF

	end1:
	mov eax, M
	mov R, eax

; 3 задание:
	cmp R, 0	; сравнение R и 0
	jge bolshe	; переход к точке bolshe, если R > 0, где произойдёт вызов функции adr2
	call adr1	; вызов функции adr1
	jmp end2	; переход к точке end2
	bolshe:
	call adr2	; вызов функции adr2
	jmp end2	; переход к точке end2

; код функции adr1:
	adr1 PROC
		xor eax, eax
		xor ebx, ebx
		xor ecx, ecx

		mov edx, offset R
		mov bx, [edx]		; теперь в bx хранятся младшие 2 байта R
		mov cx, [edx+2]		; теперь в cx хранятся старшие 2 байта R

		and bx, 00FFh		; теперь в bх хранится мл.R
		and cx, 0FF00h		
		shr cx, 8			; теперь в сх хранится ст.R

		mov ax, [edx]
		and ax, 0FF00h
		add ax, cx
		mov [edx], ax
				
		mov ax, [edx+2]
		shl bx, 8
		and ax, 00FFh
		add ax, bx
		mov [edx+2], ax

		ret
	adr1 ENDP
; конец функции adr1

; код функции adr2:
	adr2 PROC
		sub R, 1
		ret
	adr2 ENDP
; конец функции adr2
	end2:


exit: 	
Invoke ExitProcess, R; здесь можно посмотреть финальное значение R
End Start