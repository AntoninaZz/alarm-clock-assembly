OutStr macro str ;������ ������ ������
push dx
mov ah,09h
lea dx,str
int 21h
pop dx
endm 
;----------------------------------------
OutChar macro char ;������ ������ �������
push ax
push dx
mov ah,06h
mov dl,char
add dl,30h
int 21h
pop dx
pop ax
endm
;-------------------------------------
Delay macro time ;������ ������� � ���
local ext,iter
push cx
mov cx,time
ext:
push cx
mov cx,5000
iter:
loop iter
pop cx
loop ext
pop cx
endm
;-----------------------------------------------------------
GotoXY macro x,y ;������ ��������� ������� ������� � �.(x,y)
push ax
push bx
push dx
mov ah,02 ;������ �� ��������� �������
mov bh,0 ;����� 0
mov dh,x ;������ 0
mov dl,y ;������� 0
int 10h ;�������� ���������� � BIOS
pop dx
pop bx
pop ax
endm
;--------------------------------
ClS macro ; ������ ������� ������
push ax
MOV AH, 0 ; ����� ������� ��������� ������ �������
MOV AL, 2 ; ��� ������ 80 * 25 �����-�����
INT 10H ; �������� ������
pop ax
endm
;------------------------------------------------------------------
ColorScreen macro color ; ������ ��������� ����� ����������� � ����
push ax
push bx
push cx
push dx
MOV AX, 0600H
MOV BH, color ;���� ��� �� ����������
MOV CX, 0000h
MOV DX, 184FH
INT 10H
pop ax
pop bx
pop cx
pop dx
endm
;----------------------------------------------------
GetTime macro ; ������ ������ �������� ������� � ����
push ax
push bx
push cx
push dx
xor ax,ax
mov ah,2h ;��������� �������
int 1Ah
;���������� ����������� ����� (16-����) �� �����
push bx
mov bh, ch ;������������ bx
mov bl, ch ;ch - ����
and bh, 11110000b
shr bh, 4h
and bl, 00001111b
add bh,30h
mov DATA_BUFFER, bh
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,1          ;����� ������������ ������
LEA  DX,DATA_BUFFER;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������
xor ax,ax
mov ah,2h ;��������� �������
int 1Ah
;���������� ����������� ����� (16-����) �� �����
push bx
mov bh, ch ;������������ bx
mov bl, ch ;ch - ����
and bh, 11110000b
shr bh, 4h
and bl, 00001111b
add bl,30h
mov DATA_BUFFER, bl
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,1          ;����� ������������ ������
LEA  DX,DATA_BUFFER;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,1          ;����� ������������ ������
LEA  DX,separator  ;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������
xor ax,ax
mov ah,2h ;��������� �������
int 1Ah
;���������� ����������� ����� (16-����) �� �����
mov bh, cl ;������������ bx
mov bl, cl ;cl - ������ (���� dh - �������)
and bh, 11110000b
shr bh, 4h
and bl, 00001111b
add bh,30h
mov DATA_BUFFER, bh
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,1          ;����� ������������ ������
LEA  DX,DATA_BUFFER;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������
xor ax,ax
mov ah,2h ;��������� �������
int 1Ah
;���������� ����������� ����� (16-����) �� �����
mov bh, cl ;������������ bx
mov bl, cl ;cl - ������ (���� dh - �������)
and bh, 11110000b
shr bh, 4h
and bl, 00001111b
add bl,30h
mov DATA_BUFFER, bl
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,1          ;����� ������������ ������
LEA  DX,DATA_BUFFER;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,2          ;����� ������������ ������
LEA  DX,newline    ;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������
pop ax
pop bx
pop cx
pop dx
endm
;-----------------------��������������----------------------
draw0 macro ; ������ ������ ������������� 0 ��� ����� (14�9)
add coll, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 6
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 10
sub line, 13
endm
;-----------------------------------------------------------
draw1 macro ; ������ ������ ������������� 1 ��� ����� (14�9)
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 2
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 2
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 2
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 8
sub line, 13
endm
;-----------------------------------------------------------
draw2 macro ; ������ ������ ������������� 2 ��� ����� (14�9)
add coll, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 11
sub line, 13
endm
;-----------------------------------------------------------
draw3 macro ; ������ ������ ������������� 3 ��� ����� (14�9)
add coll, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 6
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 10
sub line, 13
endm
;-----------------------------------------------------------
draw4 macro ; ������ ������ ������������� 4 ��� ����� (14�9)
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 3
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 4
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 4
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 6
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 6
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 4
sub line, 13
endm
;-----------------------------------------------------------
draw5 macro ; ������ ������ ������������� 5 ��� ����� (14�9)
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 11
sub line, 13
endm
;-----------------------------------------------------------
draw6 macro ; ������ ������ ������������� 6 ��� ����� (14�9)
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 11
sub line, 13
endm
;-----------------------------------------------------------
draw7 macro ; ������ ������ ������������� 7 ��� ����� (14�9)
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 11
sub line, 13
endm
;-----------------------------------------------------------
draw8 macro ; ������ ������ ������������� 8 ��� ����� (14�9)
add coll, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 6
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 6
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 6
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 6
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 6
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 6
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 10
sub line, 13
endm
;-----------------------------------------------------------
draw9 macro ; ������ ������ ������������� 9 ��� ����� (14�9)
add coll, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 6
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 6
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 6
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 6
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 7
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 7
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 6
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 10
sub line, 13
endm
;--------------------------------------------------------------------
draw_separator macro ; ������ ������ ������������� : ��� ����� (14�9)
add line, 4
GotoXY line,coll
OutChar '�'
add line, 5
GotoXY line,coll
OutChar '�'
sub line, 9
add coll, 3
endm
;-----------------------------------------------------------------------------
drawAlarm_separator macro ; ������ ������ ������������� : ��� ���������� (7�7)
add line, 2
GotoXY line,coll
OutChar '�'
add line, 2
GotoXY line,coll
OutChar '�'
sub line, 4
add coll, 2
endm
;---------------------------------------------------------------------
drawAlarm_0 macro ; ������ ������ ������������� 0 ��� ���������� (7�7)
add coll, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 4
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub line, 6
add coll, 7
endm
;---------------------------------------------------------------------
drawAlarm_1 macro ; ������ ������ ������������� 1 ��� ���������� (7�7)
add coll, 3
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 2
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 2
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 2
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub line, 6
add coll, 7
endm
;---------------------------------------------------------------------
drawAlarm_2 macro ; ������ ������ ������������� 2 ��� ���������� (7�7)
add coll, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 2
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub line, 6
add coll, 8
endm
;---------------------------------------------------------------------
drawAlarm_3 macro ; ������ ������ ������������� 3 ��� ���������� (7�7)
add coll, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 4
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub line, 6
add coll, 7
endm
;---------------------------------------------------------------------
drawAlarm_4 macro ; ������ ������ ������������� 4 ��� ���������� (7�7)
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub line, 6
add coll, 3
endm
;---------------------------------------------------------------------
drawAlarm_5 macro ; ������ ������ ������������� 5 ��� ���������� (7�7)
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 4
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub line, 6
add coll, 7
endm
;---------------------------------------------------------------------
drawAlarm_6 macro ; ������ ������ ������������� 6 ��� ���������� (7�7)
add coll, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 4
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub line, 6
add coll, 7
endm
;---------------------------------------------------------------------
drawAlarm_7 macro ; ������ ������ ������������� 7 ��� ���������� (7�7)
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub line, 6
add coll, 8
endm
;---------------------------------------------------------------------
drawAlarm_8 macro ; ������ ������ ������������� 8 ��� ���������� (7�7)
add coll, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 4
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 4
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub line, 6
add coll, 7
endm
;---------------------------------------------------------------------
drawAlarm_9 macro ; ������ ������ ������������� 9 ��� ���������� (7�7)
add coll, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub coll, 1
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 4
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
add coll, 4
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 5
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
add coll, 5
GotoXY line,coll
OutChar symbol
OutChar symbol
sub coll, 4
add line, 1
GotoXY line,coll
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
OutChar symbol
sub line, 6
add coll, 7
endm
;-------------------------------------


.model small
.stack 100h
.data
blink db 1b
symbol db 10000010b
color db 0Ah ;������� �� ������ ����
line db 11d
coll db 15d
INSTRUCNION DB 'You can select to [s]et the alarm or press Z for exit.$'
header db '. . . S E T T I N G   M O D E . . .$'
INSTRUCNION2 DB 'enter your time ---------------- hh:mm ---------------->$'
BYE_STRING     DB 'OK! GOOD BYE! $'
error_string db 'Oops.. Try again$'
erase_string db '                $'
separator db ':$'
newline db 13,10,'$'
str_start db 'Start.........................'
str_preskey db 'PressKey_s....................'
str_setalarm db 'SetAlarm......................'
str_alarmring db 'AlarmRing.....................'
str_end db 'End...........................'
PRESS_KEY_VALUE DB 0h
alarm_h_10 db 0d
alarm_h_01 db 7d
alarm_m_10 db 0d
alarm_m_01 db 0d
time_h_10 db 0d
time_h_01 db 0d
time_m_10 db 0d
time_m_01 db 0d
equal1 db 0b
equal2 db 0b
equal3 db 0b
equal4 db 0b
firstring db 1b
HANDLE dw 0
PATH DB 'journal.txt',0
DATA_BUFFER DB 100 DUP(?)
wrStr db 35 dup('_'),13,10 ; ������ ��� ������ ������� '_'
 
 
.code
.386
start:
mov ax,@DATA ;�������������
mov ds,ax
 
 
;---��������� ����
OPEN:
LEA  DX,PATH       ;DS:DX ��������� �� ����
MOV  AL,1          ;��� �������� ��� ������
MOV  AH,3DH        ;����� �������
INT  21H           ;��������� ����
JC   OPEN_ERROR    ;���� �� ������
MOV  HANDLE,AX     ;��������� ����� �����

;---��������� ��������� ��������� �� ����� �����
POINTER:
MOV  BX,AX         ;����� ����� � BX
MOV  CX,0          ;CX:DX ���� �������� ������������ �����
MOV  DX,0          ;
MOV  AL,2          ;��� ��� ����� �����
MOV  AH,42H        ;������� ��������� ���������
INT  21H           ;������������� ���������
JC   POINTER_ERROR ;�������� �� ������

;---������ � ����
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,37         ;����� ������������ ������
LEA  DX,wrStr      ;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������

;---������ � ����
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,30         ;����� ������������ ������
LEA  DX,str_start  ;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������
GetTime
jmp l1
 
OPEN_ERROR:
jmp OPEN

POINTER_ERROR:
jmp POINTER
 
 
l1:
ClS
ColorScreen color ;������� �� ������ ����
GotoXY 0,12
OutStr INSTRUCNION

GotoXY line,coll
xor ax,ax
mov ah,2h ;��������� �������
int 1Ah

;���������� ����������� ����� (16-����) �� �����
push bx
mov bh, ch ;������������ bx
mov bl, ch ;ch - ����
and bh, 11110000b
shr bh, 4h
and bl, 00001111b

;������������� ������ ����� � ����� �� ����� �������������
cmp bh, 0d
jne next_h0
add coll, 11
mov time_h_10, 0
cmp alarm_h_10,0
jne e
mov equal1, 1
jmp e
next_h0:
cmp bh, 1d
jne next_h10
draw1
mov time_h_10, 1
cmp alarm_h_10,1
jne e
mov equal1, 1
jmp e
next_h10:
draw2
mov time_h_10, 2
cmp alarm_h_10,2
jne e
mov equal1, 1

;������������� ������ ����� � ����� �� ����� �������������
e:
cmp bl, 0d
jne next_h00
draw0
mov time_h_01, 0
cmp alarm_h_01,0
jne e1
mov equal2, 1
jmp e1
next_h00:
cmp bl, 1d
jne next_h01
draw1
mov time_h_01, 1
cmp alarm_h_01,1
jne e1
mov equal2, 1
jmp e1
next_h01:
cmp bl, 2d
jne next_h02
draw2
mov time_h_01, 2
cmp alarm_h_01,2
jne e1
mov equal2, 1
jmp e1
next_h02:
cmp bl, 3d
jne next_h03
draw3
mov time_h_01, 3
cmp alarm_h_01,3
jne e1
mov equal2, 1
jmp e1
next_h03:
cmp bl, 4d
jne next_h04
draw4
mov time_h_01, 4
cmp alarm_h_01,4
jne e1
mov equal2, 1
jmp e1
next_h04:
cmp bl, 5d
jne next_h05
draw5
mov time_h_01, 5
cmp alarm_h_01,5
jne e1
mov equal2, 1
jmp e1
next_h05:
cmp bl, 6d
jne next_h06
draw6
mov time_h_01, 6
cmp alarm_h_01,6
jne e1
mov equal2, 1
jmp e1
next_h06:
cmp bl, 7d
jne next_h07
draw7
mov time_h_01, 7
cmp alarm_h_01,7
jne e1
mov equal2, 1
jmp e1
next_h07:
cmp bl, 8d
jne next_h08
draw8
mov time_h_01, 8
cmp alarm_h_01,8
jne e1
mov equal2, 1
jmp e1
next_h08:
draw9
mov time_h_01, 9
cmp alarm_h_01,9
jne e1
mov equal2, 1
e1:
pop bx

;������� �����������
cmp blink, 1b
jne no_blink
draw_separator
mov blink, 0b
jmp min
no_blink:
add coll, 3
mov blink, 1b
jmp min

;���������� ����������� ����� (16-����) �� �����
min:
push bx
mov bh, cl ;������������ bx
mov bl, cl ;cl - ������ (���� dh - �������)
and bh, 11110000b
shr bh, 4h
and bl, 00001111b

;������������� ������ ����� � ����� �� ����� �������������
cmp bh, 0d
jne next_m0
draw0
mov time_m_10, 0
cmp alarm_m_10,0
jne e2
mov equal3, 1
jmp e2
next_m0:
cmp bh, 1d
jne next_m10
draw1
mov time_m_10, 1
cmp alarm_m_10,1
jne e2
mov equal3, 1
jmp e2
next_m10:
cmp bh, 2d
jne next_m20
draw2
mov time_m_10, 2
cmp alarm_m_10,2
jne e2
mov equal3, 1
jmp e2
next_m20:
cmp bh, 3d
jne next_m30
draw3
mov time_m_10, 3
cmp alarm_m_10,3
jne e2
mov equal3, 1
jmp e2
next_m30:
cmp bh, 4d
jne next_m40
draw4
mov time_m_10, 4
cmp alarm_m_10,4
jne e2
mov equal3, 1
jmp e2
next_m40:
draw5
mov time_m_10, 5
cmp alarm_m_10,5
jne e2
mov equal3, 1

;������������� ������ ����� � ����� �� ����� �������������
e2:
cmp bl, 0d
jne next_m00
draw0
mov time_m_01, 0
cmp alarm_m_01,0
jne e3
mov equal4, 1
jmp e3
next_m00:
cmp bl, 1d
jne next_m01
draw1
mov time_m_01, 1
cmp alarm_m_01,1
jne e3
mov equal4, 1
jmp e3
next_m01:
cmp bl, 2d
jne next_m02
draw2
mov time_m_01, 2
cmp alarm_m_01,2
jne e3
mov equal4, 1
jmp e3
next_m02:
cmp bl, 3d
jne next_m03
draw3
mov time_m_01, 3
cmp alarm_m_01,3
jne e3
mov equal4, 1
jmp e3
next_m03:
cmp bl, 4d
jne next_m04
draw4
mov time_m_01, 4
cmp alarm_m_01,4
jne e3
mov equal4, 1
jmp e3
next_m04:
cmp bl, 5d
jne next_m05
draw5
mov time_m_01, 5
cmp alarm_m_01,5
jne e3
mov equal4, 1
jmp e3
next_m05:
cmp bl, 6d
jne next_m06
draw6
mov time_m_01, 6
cmp alarm_m_01,6
jne e3
mov equal4, 1
jmp e3
next_m06:
cmp bl, 7d
jne next_m07
draw7
mov time_m_01, 7
cmp alarm_m_01,7
jne e3
mov equal4, 1
jmp e3
next_m07:
cmp bl, 8d
jne next_m08
draw8
mov time_m_01, 8
cmp alarm_m_01,8
jne e3
mov equal4, 1
jmp e3
next_m08:
draw9
mov time_m_01, 9
cmp alarm_m_01,9
jne e3
mov equal4, 1
e3:
pop bx


;�������� ��������� ���������� �������
mov line, 2d
mov coll, 21d

cmp alarm_h_10, 0d
jne alrm_h0
add coll, 8
jmp j
alrm_h0:
cmp alarm_h_10, 1d
jne alrm_h10
drawAlarm_1
jmp j
alrm_h10:
drawAlarm_2

j:
cmp alarm_h_01, 0d
jne alrm_h00
drawAlarm_0
jmp j1
alrm_h00:
cmp alarm_h_01, 1d
jne alrm_h01
drawAlarm_1
jmp j1
alrm_h01:
cmp alarm_h_01, 2d
jne alrm_h02
drawAlarm_2
jmp j1
alrm_h02:
cmp alarm_h_01, 3d
jne alrm_h03
drawAlarm_3
jmp j1
alrm_h03:
cmp alarm_h_01, 4d
jne alrm_h04
drawAlarm_4
jmp j1
alrm_h04:
cmp alarm_h_01, 5d
jne alrm_h05
drawAlarm_5
jmp j1
alrm_h05:
cmp alarm_h_01, 6d
jne alrm_h06
drawAlarm_6
jmp j1
alrm_h06:
cmp alarm_h_01, 7d
jne alrm_h07
drawAlarm_7
jmp j1
alrm_h07:
cmp alarm_h_01, 8d
jne alrm_h08
drawAlarm_8
jmp j1
alrm_h08:
drawAlarm_9
j1:

drawAlarm_separator

cmp alarm_m_10, 0d
jne alrm_m0
drawAlarm_0
jmp j2
alrm_m0:
cmp alarm_m_10, 1d
jne alrm_m10
drawAlarm_1
jmp j2
alrm_m10:
cmp alarm_m_10, 2d
jne alrm_m20
drawAlarm_2
jmp j2
alrm_m20:
cmp alarm_m_10, 3d
jne alrm_m30
drawAlarm_3
jmp j2
alrm_m30:
cmp alarm_m_10, 4d
jne alrm_m40
drawAlarm_4
jmp j2
alrm_m40:
drawAlarm_5

j2:
cmp alarm_m_01, 0d
jne alrm_m00
drawAlarm_0
jmp j3
alrm_m00:
cmp alarm_m_01, 1d
jne alrm_m01
drawAlarm_1
jmp j3
alrm_m01:
cmp alarm_m_01, 2d
jne alrm_m02
drawAlarm_2
jmp j3
alrm_m02:
cmp alarm_m_01, 3d
jne alrm_m03
drawAlarm_3
jmp j3
alrm_m03:
cmp alarm_m_01, 4d
jne alrm_m04
drawAlarm_4
jmp j3
alrm_m04:
cmp alarm_m_01, 5d
jne alrm_m05
drawAlarm_5
jmp j3
alrm_m05:
cmp alarm_m_01, 6d
jne alrm_m06
drawAlarm_6
jmp j3
alrm_m06:
cmp alarm_m_01, 7d
jne alrm_m07
drawAlarm_7
jmp j3
alrm_m07:
cmp alarm_m_01, 8d
jne alrm_m08
drawAlarm_8
jmp j3
alrm_m08:
drawAlarm_9
j3:


mov line, 11d
mov coll, 15d
GotoXY 1, 75
 
 
mov ah,01h ;�������� ������ ����������
int 16h ;���� ���� zf=0 ���� ���� ������ �������
jnz settings
 
 
cmp equal1, 1
jne norm
cmp equal2, 1
jne norm
cmp equal3, 1
jne norm
cmp equal4, 1
jne norm
 
 
cmp firstring,1
jne AlarmRing
;---������ � ����
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,30         ;����� ������������ ������
LEA  DX,str_alarmring  ;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������
GetTime
mov firstring,0
 
AlarmRing:
mov color, 0Ch ; ������� �� ������ ����
 
; ��������� �����
mov al, 10110110b              ; ����� 2, ����� 3
out 43h, al
mov al, 2ah         ; ��������� ������� ���� �������
out 42h, al
mov al, 4h          ; ��������� ������� ���� �������
out  42h, al        
in al, 61h          ; ������� ��������� ����� 61h � AL
or  al, 00000011b              ; ������������ ����� ��� ���������� ������ �������� � ��������� ���
out 61h, al         ; �������� �������
                
mov bx,2            ; ������������ ����
xor ah, ah
int 1ah             ; ��������� �������� �������
add  dx, bx         ; ��������� � ���� ����� ����
mov bx, dx          ; � ���������
_m1:
int 1ah             ; ����� �������� �����
cmp dx, bx          ; � ���������� ������ �� ������ �����, ���� ���, �������� �����
jb _m1
                
in al, 61h
and al, 11111100b              ; �������� ����
out 61h, al         ; ��������� �������
 
mov equal1, 0
mov equal2, 0
mov equal3, 0
mov equal4, 0 
Delay 500
jmp l1
 
 
norm:
mov equal1, 0
mov equal2, 0
mov equal3, 0
mov equal4, 0
mov color, 0Ah ; ������� �� ������ ����
mov firstring,1
Delay 500
jmp l1
 
 
settings:
GotoXY 1, 75
MOV AH, 1 ; ����� ������� DOS �������� � ����� ����������� �� �������
INT 21H ; ��������� �������
MOV PRESS_KEY_VALUE, AL ; ����������(�����'����������) �������
ClS
ColorScreen 03h ;cyan �� ������ ����
CMP PRESS_KEY_VALUE, 5Ah ;Z
JE BYE ; ������� �� ��������� ������
CMP PRESS_KEY_VALUE, 73h ;s
JE SET ; ������ �������� �� ���������� ������������ ����������
GotoXY 10,30
OutStr error_string
jmp settings

bye:
GotoXY 10,30
OutStr erase_string
GotoXY 10,30
OutStr BYE_STRING
OutChar '�'
jmp exit

set:
;---������ � ����
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,30         ;����� ������������ ������
LEA  DX,str_preskey  ;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������
GetTime
set_:
GotoXY 0,22
OutStr header
GotoXY 1,10
OutStr INSTRUCNION2
GotoXY 1, 75
MOV AH, 1 ; ����� ������� DOS �������� � ����� ����������� �� �������
INT 21H ; ��������� ������� ������� �����
MOV PRESS_KEY_VALUE, AL ; ����������(�����'����������) �������
CMP PRESS_KEY_VALUE, 30h ;0
JNE next_num1
mov alarm_h_10, 0
GotoXY 10,30
OutStr erase_string
jmp next_char
next_num1:
CMP PRESS_KEY_VALUE, 31h ;1
JNE next_num2
mov alarm_h_10, 1
GotoXY 10,30
OutStr erase_string
jmp next_char
next_num2:
CMP PRESS_KEY_VALUE, 32h ;2
JNE error_msg
mov alarm_h_10, 2
GotoXY 10,30
OutStr erase_string
jmp next_char
error_msg:
GotoXY 10,30
OutStr error_string
jmp set_
next_char:
GotoXY 1, 76
MOV AH, 1 ; ����� ������� DOS �������� � ����� ����������� �� �������
INT 21H ; ��������� ������� ������� �����
MOV PRESS_KEY_VALUE, AL ; ����������(�����'����������) �������
cmp alarm_h_10, 2
jne ifH01
CMP PRESS_KEY_VALUE, 30h ;0
JNE next_num01_
mov alarm_h_01, 0
GotoXY 10,30
OutStr erase_string
jmp next_min
ifH01:
jmp H01
next_num01_:
CMP PRESS_KEY_VALUE, 31h ;1
JNE next_num02_
mov alarm_h_01, 1
GotoXY 10,30
OutStr erase_string
jmp next_min
next_num02_:
CMP PRESS_KEY_VALUE, 32h ;2
JNE next_num03_
mov alarm_h_01, 2
GotoXY 10,30
OutStr erase_string
jmp next_min
next_num03_:
CMP PRESS_KEY_VALUE, 33h ;3
JNE error_msg1_
mov alarm_h_01, 3
GotoXY 10,30
OutStr erase_string
jmp next_min
error_msg1_:
GotoXY 10,30
OutStr error_string
jmp next_char
H01:
CMP PRESS_KEY_VALUE, 30h ;0
JNE next_num01
mov alarm_h_01, 0
GotoXY 10,30
OutStr erase_string
jmp next_min
next_num01:
CMP PRESS_KEY_VALUE, 31h ;1
JNE next_num02
mov alarm_h_01, 1
GotoXY 10,30
OutStr erase_string
jmp next_min
next_num02:
CMP PRESS_KEY_VALUE, 32h ;2
JNE next_num03
mov alarm_h_01, 2
GotoXY 10,30
OutStr erase_string
jmp next_min
next_num03:
CMP PRESS_KEY_VALUE, 33h ;3
JNE next_num04
mov alarm_h_01, 3
GotoXY 10,30
OutStr erase_string
jmp next_min
next_num04:
CMP PRESS_KEY_VALUE, 34h ;4
JNE next_num05
mov alarm_h_01, 4
GotoXY 10,30
OutStr erase_string
jmp next_min
next_num05:
CMP PRESS_KEY_VALUE, 35h ;5
JNE next_num06
mov alarm_h_01, 5
GotoXY 10,30
OutStr erase_string
jmp next_min
next_num06:
CMP PRESS_KEY_VALUE, 36h ;6
JNE next_num07
mov alarm_h_01, 6
GotoXY 10,30
OutStr erase_string
jmp next_min
next_num07:
CMP PRESS_KEY_VALUE, 37h ;7
JNE next_num08
mov alarm_h_01, 7
GotoXY 10,30
OutStr erase_string
jmp next_min
next_num08:
CMP PRESS_KEY_VALUE, 38h ;8
JNE next_num09
mov alarm_h_01, 8
GotoXY 10,30
OutStr erase_string
jmp next_min
next_num09:
CMP PRESS_KEY_VALUE, 39h ;9
JNE error_msg1
mov alarm_h_01, 9
GotoXY 10,30
OutStr erase_string
jmp next_min
error_msg1:
GotoXY 10,30
OutStr error_string
jmp next_char
next_min:
GotoXY 1, 77
OutStr separator
MOV AH, 1 ; ����� ������� DOS �������� � ����� ����������� �� �������
INT 21H ; ��������� ������� ������� ������
MOV PRESS_KEY_VALUE, AL ; ����������(�����'����������) �������
CMP PRESS_KEY_VALUE, 30h ;0
JNE next_minnum1
mov alarm_m_10, 0
GotoXY 10,30
OutStr erase_string
jmp next_minchar
next_minnum1:
CMP PRESS_KEY_VALUE, 31h ;1
JNE next_minnum2
mov alarm_m_10, 1
GotoXY 10,30
OutStr erase_string
jmp next_minchar
next_minnum2:
CMP PRESS_KEY_VALUE, 32h ;2
JNE next_minnum3
mov alarm_m_10, 2
GotoXY 10,30
OutStr erase_string
jmp next_minchar
next_minnum3:
CMP PRESS_KEY_VALUE, 33h ;3
JNE next_minnum4
mov alarm_m_10, 3
GotoXY 10,30
OutStr erase_string
jmp next_minchar
next_minnum4:
CMP PRESS_KEY_VALUE, 34h ;4
JNE next_minnum5
mov alarm_m_10, 4
GotoXY 10,30
OutStr erase_string
jmp next_minchar
next_minnum5:
CMP PRESS_KEY_VALUE, 35h ;5
JNE error_msg2
mov alarm_m_10, 5
GotoXY 10,30
OutStr erase_string
jmp next_minchar
error_msg2:
GotoXY 10,30
OutStr error_string
jmp next_min
next_minchar:
GotoXY 1, 79
MOV AH, 1 ; ����� ������� DOS �������� � ����� ����������� �� �������
INT 21H ; ��������� ������� ������� ������
MOV PRESS_KEY_VALUE, AL ; ����������(�����'����������) �������
CMP PRESS_KEY_VALUE, 30h ;0
JNE next_minnum01
mov alarm_m_01, 0
GotoXY 10,30
OutStr erase_string
jmp AlarmSetted
next_minnum01:
CMP PRESS_KEY_VALUE, 31h ;1
JNE next_minnum02
mov alarm_m_01, 1
GotoXY 10,30
OutStr erase_string
jmp AlarmSetted
next_minnum02:
CMP PRESS_KEY_VALUE, 32h ;2
JNE next_minnum03
mov alarm_m_01, 2
GotoXY 10,30
OutStr erase_string
jmp AlarmSetted
next_minnum03:
CMP PRESS_KEY_VALUE, 33h ;3
JNE next_minnum04
mov alarm_m_01, 3
GotoXY 10,30
OutStr erase_string
jmp AlarmSetted
next_minnum04:
CMP PRESS_KEY_VALUE, 34h ;4
JNE next_minnum05
mov alarm_m_01, 4
GotoXY 10,30
OutStr erase_string
jmp AlarmSetted
next_minnum05:
CMP PRESS_KEY_VALUE, 35h ;5
JNE next_minnum06
mov alarm_m_01, 5
GotoXY 10,30
OutStr erase_string
jmp AlarmSetted
next_minnum06:
CMP PRESS_KEY_VALUE, 36h ;6
JNE next_minnum07
mov alarm_m_01, 6
GotoXY 10,30
OutStr erase_string
jmp AlarmSetted
next_minnum07:
CMP PRESS_KEY_VALUE, 37h ;7
JNE next_minnum08
mov alarm_m_01, 7
GotoXY 10,30
OutStr erase_string
jmp AlarmSetted
next_minnum08:
CMP PRESS_KEY_VALUE, 38h ;8
JNE next_minnum09
mov alarm_m_01, 8
GotoXY 10,30
OutStr erase_string
jmp AlarmSetted
next_minnum09:
CMP PRESS_KEY_VALUE, 39h ;9
JNE error_msg3
mov alarm_m_01, 9
GotoXY 10,30
OutStr erase_string
jmp AlarmSetted
error_msg3:
GotoXY 10,30
OutStr error_string
jmp next_minchar

AlarmSetted:
;---������ � ����
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,30         ;����� ������������ ������
LEA  DX,str_setalarm  ;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������
GetTime
mov firstring,1
jmp l1

CLOSE_ERROR:
JMP CLOSE

exit:
;---������ � ����
MOV  AH,40H        ;����� ������� ������ � ����
MOV  BX,HANDLE     ;����� ����� � BX
MOV  CX,30         ;����� ������������ ������
LEA  DX,str_end    ;DS:DX ��������� �� ����� ������
INT  21H           ;��������� ������
GetTime
;---�������� �����
CLOSE:
MOV  AH,3EH       ;����� �������
MOV  BX,HANDLE    ;����� �����
INT  21H          ;��������� ����
JC   CLOSE_ERROR  ;���� �� ��������� ������

mov ax,4C00h
int 21h
END start