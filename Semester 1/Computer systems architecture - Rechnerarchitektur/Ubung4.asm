;Berechnen Sie aus dem Doppelwort M das Doppelwort MNew wie folgt:
;- die Bits 0-3 a von MNew sind die gleichen wie die Bits 5-8 a von M
;- die Bits 4-7 a von MNew haben den Wert 1
;- die Bits 27-31 a von MNew haben den Wert 0
;- die Bits 8-26 von MNew haben den gleichen Wert wie die Bits 8-26 a von M

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
    m dd 11011011011011001011101100000011b
; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov ebx, 0           ; Ergebnis in ebx
                             ; ebx-> 0000 0000 0000 0000 0000 0000 0000 0000b-> 00000000h
                             ; #1
                             
        mov eax, [m]         ; eax-> 1101 1011 0110 1100 1011 1011 0000 0011b-> DB6CBB03h
        and eax, 00000000000000000000000111100000b
                             ; isolieren die Bits 5-8 von m
                             ; eax-> 0000 0000 0000 0000 0000 0001 0000 0000b-> 00000100h
        ror eax, 5           ; rotieren 5 Positionen nach rechts
                             ; eax-> 0000 0000 0000 0000 0000 0000 0000 1000b-> 00000008h
        or ebx, eax          ; fügen die Bits in das Ergebnis ein
                             ; ebx-> 0000 0000 0000 0000 0000 0000 0000 1000b-> 00000008h
        
                             ; #2
                             
        or ebx, 00000000000000000000000011110000b
                             ; zwingen den Wert der Bits 4-7 des Ergebnises auf den Wert 1
                             ; ebx-> 0000 0000 0000 0000 0000 0000 1111 1000b-> 000000F8h
                             
                             ; #3
                   
        mov eax, [m]         ; eax-> 1101 1011 0110 1100 1011 1011 0000 0011b-> DB6CBB03h
        and eax, 00000111111111111111111100000000b
                             ; isolieren die Bits 8-26 von m
                             ; eax-> 0000 0011 0110 1100 1011 1011 0000 0000b-> 036CBB00h
        or ebx, eax          ; fügen die Bits in das Ergebnis ein
                             ; ebx-> 0000 0011 0110 1100 1011 1011 1111 1000b-> 036CBBF8h
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
