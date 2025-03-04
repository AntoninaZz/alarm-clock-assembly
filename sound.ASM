OutStr macro str ;ìàêðîñ âûâîäà ñòðîêè
push dx
mov ah,09h
lea dx,str
int 21h
pop dx
endm 
;----------------------------------------
OutChar macro char ;ìàêðîñ âûâîäà ñèìâîëà
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
Delay macro time ;ìàêðîñ çàäåæêè â ìêñ
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
GotoXY macro x,y ;ìàêðîñ óñòàíîâêè ïîçèöèè êóðñîðà â ò.(x,y)
push ax
push bx
push dx
mov ah,02 ;Çàïðîñ íà óñòàíîâêó êóðñîðà
mov bh,0 ;Ýêðàí 0
mov dh,x ;Ñòðîêà 0
mov dl,y ;Ñòîëáåö 0
int 10h ;Ïåðåäà÷à óïðàâëåíèÿ â BIOS
pop dx
pop bx
pop ax
endm
;--------------------------------
ClS macro ; ìàêðîñ î÷èñòêè ýêðàíà
push ax
MOV AH, 0 ; íîìåð ôóíêö³¿ óñòàíîâêè ðåæèìó äèñïëåÿ
MOV AL, 2 ; êîä ðåæèìó 80 * 25 ÷îðíî-á³ëîãî
INT 10H ; î÷èùåííÿ åêðàíà
pop ax
endm
;------------------------------------------------------------------
ColorScreen macro color ; ìàêðîñ óñòàíîâêè öâåòà èçîáðàæåíèÿ è ôîíà
push ax
push bx
push cx
push dx
MOV AX, 0600H
MOV BH, color ;êîë³ð òëà òà çîáðàæåííÿ
MOV CX, 0000h
MOV DX, 184FH
INT 10H
pop ax
pop bx
pop cx
pop dx
endm
;----------------------------------------------------
GetTime macro ; ìàêðîñ ïå÷àòè òåêóùåãî âðåìåíè â ôàéë
push ax
push bx
push cx
push dx
xor ax,ax
mov ah,2h ;ïîëó÷åíèå âðåìåíè
int 1Ah
;ðàçëîæåíèå äâóçíà÷íîãî ÷èñëà (16-íîãî) íà öèôðû
push bx
mov bh, ch ;èñïîëüçóåòñÿ bx
mov bl, ch ;ch - ÷àñû
and bh, 11110000b
shr bh, 4h
and bl, 00001111b
add bh,30h
mov DATA_BUFFER, bh
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,1          ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,DATA_BUFFER;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå
xor ax,ax
mov ah,2h ;ïîëó÷åíèå âðåìåíè
int 1Ah
;ðàçëîæåíèå äâóçíà÷íîãî ÷èñëà (16-íîãî) íà öèôðû
push bx
mov bh, ch ;èñïîëüçóåòñÿ bx
mov bl, ch ;ch - ÷àñû
and bh, 11110000b
shr bh, 4h
and bl, 00001111b
add bl,30h
mov DATA_BUFFER, bl
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,1          ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,DATA_BUFFER;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,1          ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,separator  ;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå
xor ax,ax
mov ah,2h ;ïîëó÷åíèå âðåìåíè
int 1Ah
;ðàçëîæåíèå äâóçíà÷íîãî ÷èñëà (16-íîãî) íà öèôðû
mov bh, cl ;èñïîëüçóåòñÿ bx
mov bl, cl ;cl - ìèíóòû (åñëè dh - ñåêóíäû)
and bh, 11110000b
shr bh, 4h
and bl, 00001111b
add bh,30h
mov DATA_BUFFER, bh
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,1          ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,DATA_BUFFER;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå
xor ax,ax
mov ah,2h ;ïîëó÷åíèå âðåìåíè
int 1Ah
;ðàçëîæåíèå äâóçíà÷íîãî ÷èñëà (16-íîãî) íà öèôðû
mov bh, cl ;èñïîëüçóåòñÿ bx
mov bl, cl ;cl - ìèíóòû (åñëè dh - ñåêóíäû)
and bh, 11110000b
shr bh, 4h
and bl, 00001111b
add bl,30h
mov DATA_BUFFER, bl
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,1          ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,DATA_BUFFER;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,2          ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,newline    ;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå
pop ax
pop bx
pop cx
pop dx
endm
;-----------------------ÇÍÀÊÎÃÅÍÅÐÀÒÎÐ----------------------
draw0 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 0 äëÿ ÷àñîâ (14õ9)
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
draw1 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 1 äëÿ ÷àñîâ (14õ9)
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
draw2 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 2 äëÿ ÷àñîâ (14õ9)
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
draw3 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 3 äëÿ ÷àñîâ (14õ9)
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
draw4 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 4 äëÿ ÷àñîâ (14õ9)
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
draw5 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 5 äëÿ ÷àñîâ (14õ9)
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
draw6 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 6 äëÿ ÷àñîâ (14õ9)
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
draw7 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 7 äëÿ ÷àñîâ (14õ9)
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
draw8 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 8 äëÿ ÷àñîâ (14õ9)
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
draw9 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 9 äëÿ ÷àñîâ (14õ9)
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
draw_separator macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè : äëÿ ÷àñîâ (14õ9)
add line, 4
GotoXY line,coll
OutChar '¯'
add line, 5
GotoXY line,coll
OutChar '¯'
sub line, 9
add coll, 3
endm
;-----------------------------------------------------------------------------
drawAlarm_separator macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè : äëÿ áóäèëüíèêà (7õ7)
add line, 2
GotoXY line,coll
OutChar '¯'
add line, 2
GotoXY line,coll
OutChar '¯'
sub line, 4
add coll, 2
endm
;---------------------------------------------------------------------
drawAlarm_0 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 0 äëÿ áóäèëüíèêà (7õ7)
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
drawAlarm_1 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 1 äëÿ áóäèëüíèêà (7õ7)
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
drawAlarm_2 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 2 äëÿ áóäèëüíèêà (7õ7)
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
drawAlarm_3 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 3 äëÿ áóäèëüíèêà (7õ7)
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
drawAlarm_4 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 4 äëÿ áóäèëüíèêà (7õ7)
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
drawAlarm_5 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 5 äëÿ áóäèëüíèêà (7õ7)
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
drawAlarm_6 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 6 äëÿ áóäèëüíèêà (7õ7)
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
drawAlarm_7 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 7 äëÿ áóäèëüíèêà (7õ7)
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
drawAlarm_8 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 8 äëÿ áóäèëüíèêà (7õ7)
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
drawAlarm_9 macro ; ìàêðîñ ïå÷àòè ïñåâäîãðàôèêè 9 äëÿ áóäèëüíèêà (7õ7)
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
color db 0Ah ;çåëåíûé íà ÷åðíîì ôîíå
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
wrStr db 35 dup('_'),13,10 ; ñòðîêà äëÿ çàïèñè çàáèòàÿ '_'
 
 
.code
.386
start:
mov ax,@DATA ;èíèöèàëèçàöèÿ
mov ds,ax
 
 
;---îòêðûâàåì ôàéë
OPEN:
LEA  DX,PATH       ;DS:DX óêàçûâàþò íà ïóòü
MOV  AL,1          ;êîä îòêðûòèÿ äëÿ çàïèñè
MOV  AH,3DH        ;íîìåð ôóíêöèè
INT  21H           ;îòêðûâàåì ôàéë
JC   OPEN_ERROR    ;óõîä ïî îøèáêå
MOV  HANDLE,AX     ;ñîõðàíÿåì íîìåð ôàéëà

;---óñòàíîâêà ôàéëîâîãî óêàçàòåëÿ íà êîíåö ôàéëà
POINTER:
MOV  BX,AX         ;íîìåð ôàéëà â BX
MOV  CX,0          ;CX:DX äàþò ñìåùåíèå îòíîñèòåëüíî êîíöà
MOV  DX,0          ;
MOV  AL,2          ;êîä äëÿ êîíöà ôàéëà
MOV  AH,42H        ;ôóíêöèÿ óñòàíîâêè óêàçàòåëÿ
INT  21H           ;óñòàíàâëèâàåì óêàçàòåëü
JC   POINTER_ERROR ;ïðîâåðêà íà îøèáêó

;---çàïèñü â ôàéë
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,37         ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,wrStr      ;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå

;---çàïèñü â ôàéë
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,30         ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,str_start  ;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå
GetTime
jmp l1
 
OPEN_ERROR:
jmp OPEN

POINTER_ERROR:
jmp POINTER
 
 
l1:
ClS
ColorScreen color ;çåëåíûé íà ÷åðíîì ôîíå
GotoXY 0,12
OutStr INSTRUCNION

GotoXY line,coll
xor ax,ax
mov ah,2h ;ïîëó÷åíèå âðåìåíè
int 1Ah

;ðàçëîæåíèå äâóçíà÷íîãî ÷èñëà (16-íîãî) íà öèôðû
push bx
mov bh, ch ;èñïîëüçóåòñÿ bx
mov bl, ch ;ch - ÷àñû
and bh, 11110000b
shr bh, 4h
and bl, 00001111b

;ðàñïîçíàâàíèå ïåðâîé öèôðû è âûâîä íà ýêðàí ïñåâäîãðàôèêè
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

;ðàñïîçíàâàíèå âòîðîé öèôðû è âûâîä íà ýêðàí ïñåâäîãðàôèêè
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

;ìèãàíèå ðàçäåëèòåëÿ
cmp blink, 1b
jne no_blink
draw_separator
mov blink, 0b
jmp min
no_blink:
add coll, 3
mov blink, 1b
jmp min

;ðàçëîæåíèå äâóçíà÷íîãî ÷èñëà (16-íîãî) íà öèôðû
min:
push bx
mov bh, cl ;èñïîëüçóåòñÿ bx
mov bl, cl ;cl - ìèíóòû (åñëè dh - ñåêóíäû)
and bh, 11110000b
shr bh, 4h
and bl, 00001111b

;ðàñïîçíàâàíèå ïåðâîé öèôðû è âûâîä íà ýêðàí ïñåâäîãðàôèêè
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

;ðàñïîçíàâàíèå âòîðîé öèôðû è âûâîä íà ýêðàí ïñåâäîãðàôèêè
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


;ïå÷àòàåì áóäèëüíèê ìàëåíüêèìè öèôðàìè
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
 
 
mov ah,01h ;ïðîâåðêà áóôåðà êëàâèàòóðû
int 16h ;ôëàã íóëÿ zf=0 åñëè áûëà íàæàòà êëàâèøà
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
;---çàïèñü â ôàéë
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,30         ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,str_alarmring  ;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå
GetTime
mov firstring,0
 
AlarmRing:
mov color, 0Ch ; êðàñíûé íà ÷åðíîì ôîíå
 
; ãåíåðàòîð çâóêà
mov al, 10110110b              ; êàíàë 2, ðåæèì 3
out 43h, al
mov al, 2ah         ; ñîõðàíÿåì ìëàäøèé áàéò ÷àñòîòû
out 42h, al
mov al, 4h          ; ñîõðàíÿåì ñòàðøèé áàéò ÷àñòîòû
out  42h, al        
in al, 61h          ; òåêóùåå ñîñòîÿíèå ïîðòà 61h â AL
or  al, 00000011b              ; óñòàíîâëåíèÿ áèòîâ äëÿ ðàçðåøåíèÿ ðàáîòû äèíàìèêà è âêëþ÷åíèå åãî
out 61h, al         ; âêëþ÷àåì äèíàìèê
                
mov bx,2            ; äëèòåëüíîñòü ïèêà
xor ah, ah
int 1ah             ; ïîëó÷åíèå òåêóùåãî âðåìåíè
add  dx, bx         ; äîáîâëÿåì ê íåìó äëèíó ïèêà
mov bx, dx          ; è ñîõðàíèåì
_m1:
int 1ah             ; ñíîâà ïîëó÷àåì âðåìÿ
cmp dx, bx          ; è ñðàâíèâàåì ïðîøëî ëè íóæíîå âðåìÿ, åñëè íåò, öèêëèìñÿ ñíîâà
jb _m1
                
in al, 61h
and al, 11111100b              ; îáíóëÿåì áèòû
out 61h, al         ; âûêëþ÷àåì äèíàìèê
 
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
mov color, 0Ah ; çåëåíûé íà ÷åðíîì ôîíå
mov firstring,1
Delay 500
jmp l1
 
 
settings:
GotoXY 1, 75
MOV AH, 1 ; íîìåð ôóíêö³¿ DOS óâåäåííÿ ç ëóíîþ â³äîáðàæåííÿ íà òåðì³íàë³
INT 21H ; îòðèìàííÿ ñèìâîëó
MOV PRESS_KEY_VALUE, AL ; çáåðåæåííÿ(çàïàì'ÿòîâóâàííÿ) ñèìâîëó
ClS
ColorScreen 03h ;cyan íà ÷åðíîì ôîíå
CMP PRESS_KEY_VALUE, 5Ah ;Z
JE BYE ; ïåðåõ³ä äî çàê³í÷åííÿ ðîáîòè
CMP PRESS_KEY_VALUE, 73h ;s
JE SET ; âèêëèê ïåðåõîäó äî ï³äïðîãðàìè âñòàíîâëåííÿ áóäèëüíèêà
GotoXY 10,30
OutStr error_string
jmp settings

bye:
GotoXY 10,30
OutStr erase_string
GotoXY 10,30
OutStr BYE_STRING
OutChar 'Ò'
jmp exit

set:
;---çàïèñü â ôàéë
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,30         ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,str_preskey  ;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå
GetTime
set_:
GotoXY 0,22
OutStr header
GotoXY 1,10
OutStr INSTRUCNION2
GotoXY 1, 75
MOV AH, 1 ; íîìåð ôóíêö³¿ DOS óâåäåííÿ ç ëóíîþ â³äîáðàæåííÿ íà òåðì³íàë³
INT 21H ; îòðèìàííÿ ñèìâîëó äåñÿòê³â ãîäèí
MOV PRESS_KEY_VALUE, AL ; çáåðåæåííÿ(çàïàì'ÿòîâóâàííÿ) ñèìâîëó
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
MOV AH, 1 ; íîìåð ôóíêö³¿ DOS óâåäåííÿ ç ëóíîþ â³äîáðàæåííÿ íà òåðì³íàë³
INT 21H ; îòðèìàííÿ ñèìâîëó îäèíèöü ãîäèí
MOV PRESS_KEY_VALUE, AL ; çáåðåæåííÿ(çàïàì'ÿòîâóâàííÿ) ñèìâîëó
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
MOV AH, 1 ; íîìåð ôóíêö³¿ DOS óâåäåííÿ ç ëóíîþ â³äîáðàæåííÿ íà òåðì³íàë³
INT 21H ; îòðèìàííÿ ñèìâîëó äåñÿòê³â õâèëèí
MOV PRESS_KEY_VALUE, AL ; çáåðåæåííÿ(çàïàì'ÿòîâóâàííÿ) ñèìâîëó
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
MOV AH, 1 ; íîìåð ôóíêö³¿ DOS óâåäåííÿ ç ëóíîþ â³äîáðàæåííÿ íà òåðì³íàë³
INT 21H ; îòðèìàííÿ ñèìâîëó îäèíèöü õâèëèí
MOV PRESS_KEY_VALUE, AL ; çáåðåæåííÿ(çàïàì'ÿòîâóâàííÿ) ñèìâîëó
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
;---çàïèñü â ôàéë
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,30         ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,str_setalarm  ;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå
GetTime
mov firstring,1
jmp l1

CLOSE_ERROR:
JMP CLOSE

exit:
;---çàïèñü â ôàéë
MOV  AH,40H        ;íîìåð ôóíêöèè çàïèñè â ôàéë
MOV  BX,HANDLE     ;íîìåð ôàéëà â BX
MOV  CX,30         ;÷èñëî çàïèñûâàåìûõ áàéòîâ
LEA  DX,str_end    ;DS:DX óêàçûâàþò íà áóôåð äàííûõ
INT  21H           ;äîáàâëÿåì äàííûå
GetTime
;---çàêðûòèå ôàéëà
CLOSE:
MOV  AH,3EH       ;íîìåð ôóíêöèè
MOV  BX,HANDLE    ;íîìåð ôàéëà
INT  21H          ;çàêðûâàåì ôàéë
JC   CLOSE_ERROR  ;óõîä íà îáðàáîòêó îøèáêè

mov ax,4C00h
int 21h
END start