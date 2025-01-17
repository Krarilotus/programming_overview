.8086
.model small
.stack 100h

.data
    n dw 10  ; Hier die Fibonacci-Zahl ändern (z.B. 10 -> 25 für fib(25))
    
    msgTitle db "Fibonacci(n) = $"
    newline  db 0Dh,0Ah,'$'

    outBuf   db 6 dup(?)  ; Puffer für die Ausgabe (max. 5-stellige Fibonacci-Zahlen)

.code
main proc
    mov  ax, @data
    mov  ds, ax

    ;---------------------------------------------------------
    ; 1) Lade n aus Speicher
    ;---------------------------------------------------------
    mov  cx, [n]    ; CX = n (Anzahl der Fibonacci-Schritte)
    mov  ax, 0      ; F(0) = 0
    mov  bx, 1      ; F(1) = 1

fib_loop:
    cmp  cx, 0
    je   convert    ; Falls CX = 0, springe zur Ausgabe
    add  ax, bx     ; F(n) = F(n-1) + F(n-2)
    xchg ax, bx     ; Werte tauschen (AX=F(n-1), BX=F(n))
    dec  cx
    jmp  fib_loop

convert:
    ;---------------------------------------------------------
    ; 2) Konvertiere AX (Zahl) in ASCII für die Ausgabe
    ;---------------------------------------------------------
    mov  si, OFFSET outBuf + 5  ; Pufferende (für Rückwärts-Schreiben)
    mov  byte ptr [si], '$'     ; String-Ende setzen
    dec  si

convert_loop:
    xor  dx, dx
    mov  bx, 10
    div  bx                    ; AX / 10, Rest in DX
    add  dl, '0'               ; Rest in ASCII umwandeln
    mov  [si], dl              ; Speichern
    dec  si
    cmp  ax, 0
    jne  convert_loop
    inc  si                    ; SI auf erste Ziffer setzen

print_result:
    ;---------------------------------------------------------
    ; 3) Ausgabe: "Fibonacci(n) = "
    ;---------------------------------------------------------
    mov  dx, OFFSET msgTitle
    mov  ah, 09h
    int  21h

    ;---------------------------------------------------------
    ; 4) Ausgabe der Fibonacci-Zahl
    ;---------------------------------------------------------
    mov  dx, si
    mov  ah, 09h
    int  21h

    ; Zeilenumbruch ausgeben
    mov  dx, OFFSET newline
    mov  ah, 09h
    int  21h

    ;---------------------------------------------------------
    ; 5) Programm beenden
    ;---------------------------------------------------------
    mov  ah, 4Ch
    int  21h

main endp
end main
