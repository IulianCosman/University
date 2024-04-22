;Berechnen Sie aus den Bytes A und B das Doppelwort C wie folgt:
;- die Bits 16-31 von C haben den Wert 1
;- die Bits 0-3 von C sind die gleichen wie die Bits 3-6 von B
;- die Bits 4-7 von C haben den Wert 0
;- die Bits 8-10 von C haben den Wert 110
;- die Bits 11-15 von C haben den gleichen Wert wie die Bits 0-4 von A

bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a db 01110111b
    b db 10011011b
; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov ebx, 0           ; Ergebnis in ebx
                             ; ebx-> 0000 0000 0000 0000 0000 0000 0000 0000b-> 00000000h
        
                             ; #1
                             
        or ebx, 11111111111111110000000000000000b
                             ; zwingen den Wert der Bits 16-31 des Ergebnisses auf den Wert 1
                             ; ebx-> 1111 1111 1111 1111 0000 0000 0000 0000b-> FFFF0000h
                             
                             ; #2
                             
        mov eax, 0
        mov al, [b]          ; al-> 1001 1011b-> 9Bh
        and al, 01111000b    ; isolieren die Bits 3-6 von b
                             ; al-> 0001 1000b-> 18h
        ror eax, 3           ; rotieren 3 Positionen nach rechts
                             ; eax-> 0000 0000 0000 0000 0000 0000 0000 0011b-> 00000003h
        or ebx, eax          ; fügen die Bits in das Ergebnis ein
                             ; ebx-> 1111 1111 1111 1111 0000 0000 0000 0011b-> FFFF0003h
        
                             ; #3
                             
        or ebx, 00000000000000000000001100000000b
                             ; zwingen den Wert der Bits 8-10 des Ergebnises auf den Wert 110
                             ; ebx-> 1111 1111 1111 1111 0000 0011 0000 0011b-> FFFF0303h
                             
                             ; #4
                             
        mov eax, 0
        mov al, [a]          ; al-> 0111 0111b-> 77h
        and al, 00011111b    ; isolieren die Bits 0-4 von a
                             ; al-> 0001 0111b-> 17h
        rol eax, 11          ; rotieren 11 Positionen nach links
                             ; eax-> 0000 0000 0000 0000 1011 1000 0000 0000b-> 0000B800h
        or ebx, eax          ; fügen die Bits in das Ergebnis ein
                             ; ebx-> 1111 1111 1111 1111 1011 1011 0000 0011b-> FFFFBB03h
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
