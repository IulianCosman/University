;Zwei Folgen (von Bytes) S1 und S2 mit gleicher Länge werden angegeben. Erstelle die Folge D, indem man die Elemente der beiden Folgen interkaliert werden.
;Beispiel: S1: 1, 3, 5, 7 S2: 2, 6, 9, 4 D: 1, 2, 3, 6, 5, 9, 7, 4

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
    s1 db 1, 3, 5, 7        ; man deklariert die Folge s1 von Bytes
    s2 db 2, 6, 9, 4        ; man deklariert die Folge s2 von Bytes
    l equ $-s2              ; man berechnet die Länge der Folge s1/ s2 in l
    d times l*2 db 0        ; man reserviert l*2 Bytes für den Zielfolge und initialisiere ihn
; our code starts here
segment code use32 class=code
    start:
        ; ...
    mov ecx, l              ; wir setzen die Länge l in ECX, um die Schleife zu machen
    mov esi, 0
    mov edi, 0
    jecxz Sfarsit
    
    Repeta:                 ; die Schleife wird l-mal wiederholt
        mov al, [s1+esi]
        mov [d+edi], al
        inc edi
        mov al, [s2+esi]
        mov [d+edi], al
        inc edi
        inc esi              
    loop Repeta              ; 1-mal werden 1 und 2 von [s1+0] und [s2+0] in [d+0], bzw [d+1] versetzt
                             ; 2-mal werden 3 und 6 von [s1+1] und [s2+1] in [d+2], bzw [d+3] versetzt
                             ; 3-mal werden 5 und 9 von [s1+2] und [s2+2] in [d+4], bzw [d+5] versetzt
                             ; 4-mal werden 7 und 4 von [s1+3] und [s2+3] in [d+6], bzw [d+7] versetzt
    
    Sfarsit:                 ; Ende des Programms
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
