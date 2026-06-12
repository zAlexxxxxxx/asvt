.686
.model flat,stdcall
.stack 100h
.data
X dw 17
Y dw 5
Z dw 44
M dw ?
.code
ExitProcess PROTO STDCALL :DWORD
Start:
mov ax, Z ; переносим Z в ax
sub ax, X ; вычитаем X  из ax(Z)
sub ax, Y ; вычитаем Y из ax(X+Z)

shr ax, 1 ; деление ax(Z-X-Y) на 2

mov bx, X ; переносим X в bx
and bx, Y ; & bx(X) с Y

add ax, bx ; складываем ax((Z-X-Y)/2) с bx(X&Y)

mov M, ax ; переносим результат в ax

exit:
Invoke ExitProcess,1
End Start