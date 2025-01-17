;========================================================
; File: hello.asm
; Assemble with: 
;   tasm hello.asm
; Link with:
;   tlink hello.obj
; Run:
;   hello.exe
;========================================================

.model small ; We are using the small memory model (code and data in different segments, but each <64KB).
.stack 100h ; Reserves 256 bytes of stack.

.data
    msg db "Hello, World!", 0Dh, 0Ah, '$'  ; Message to print

.code
main proc
    mov ax, @data       ; Initialize DS
    mov ds, ax

    ; DOS function 9 - print string
    mov ah, 09h
    mov dx, OFFSET msg
    int 21h

    ; DOS function 4Ch - exit to DOS
    mov ah, 4Ch
    int 21h
main endp

end main
