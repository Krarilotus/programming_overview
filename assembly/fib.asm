.8086
.model small
.stack 100h

.data
    ; Hard-coded n (change to whatever integer you want)
    n dw 10

    msgTitle db "Fibonacci(n) = ",0
    newline  db 0Dh,0Ah,'$'

    ; We'll store up to 5 ASCII digits + null terminator
    outBuf   db 6 dup(?)

.code
main proc
    mov  ax, @data
    mov  ds, ax

    ;-----------------------------------------------------------------
    ; 1) Load n into BX
    ;-----------------------------------------------------------------
    mov  bx, [n]

    ;-----------------------------------------------------------------
    ; 2) Compute fib(n) -> AX
    ;    fib(0)=0, fib(1)=1, fib(n)=fib(n-1)+fib(n-2)
    ;    We'll do an iterative approach for n >= 2.
    ;-----------------------------------------------------------------
    mov  ax, bx      ; AX = n
    cmp  ax, 0
    jne  fib_not_zero
    ; if n = 0 => fib(0)=0
    mov  ax, 0
    jmp  fib_display

fib_not_zero:
    cmp  ax, 1
    jne  fib_iter
    ; if n = 1 => fib(1)=1
    mov  ax, 1
    jmp  fib_display

fib_iter:
    ; iterative approach
    ; f0=0, f1=1
    xor  si, si  ; si = 0 => f0
    mov  di, 1   ; di = 1 => f1
    mov  cx, bx  ; cx = n
    dec  cx      ; we've already accounted for f1 => start from i=2

fib_loop:
    cmp  cx, 1
    jl   fib_done
    mov  ax, si  ; ax=f0
    add  ax, di  ; ax=f0+f1
    mov  si, di  ; f0=f1
    mov  di, ax  ; f1=ax (f2)
    dec  cx
    jmp  fib_loop

fib_done:
    mov  ax, di  ; final fib(n) in ax

fib_display:
    ;-----------------------------------------------------------------
    ; 3) Convert AX -> decimal ASCII in outBuf
    ;-----------------------------------------------------------------
    mov  bx, 10                 ; base=10
    mov  si, OFFSET outBuf+5    ; point si to end of buffer
    mov  byte ptr [si], 0       ; store null terminator
    dec  si

conv_dec_loop:
    xor  dx, dx
    div  bx                     ; AX/10 => AX=quotient, DX=remainder
    add  dl, '0'                ; remainder => ASCII
    mov  [si], dl
    dec  si
    cmp  ax, 0
    jne  conv_dec_loop
    inc  si                     ; si => first digit

    ;-----------------------------------------------------------------
    ; 4) Print "Fibonacci(n) = "
    ;-----------------------------------------------------------------
    mov  dx, OFFSET msgTitle
    mov  ah, 9                  ; DOS function 9, print '$'-terminated
    int  21h

    ;-----------------------------------------------------------------
    ; 5) Print the converted number
    ;-----------------------------------------------------------------
    mov  dx, si
    mov  ah, 9
    int  21h

    ; Print newline
    mov  dx, OFFSET newline
    mov  ah, 9
    int  21h

    ;-----------------------------------------------------------------
    ; 6) Exit
    ;-----------------------------------------------------------------
    mov  ah, 4Ch
    int  21h

main endp
end main
