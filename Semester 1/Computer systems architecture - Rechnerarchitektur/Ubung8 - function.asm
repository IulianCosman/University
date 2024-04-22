;Lesen Sie von der Konsole eine Liste von Zahlen zur Basis 10. Schreiben Sie nur die Primzahlen auf die Konsole.

bits 32
global start
 
extern exit, scanf, printf
extern primzahl
import exit msvcrt.dll
import scanf msvcrt.dll
import printf msvcrt.dll
 
segment data use32 class = data
    zahl dd 0
    result dd 0
    format db "%d", 0 ;basis 10=%d
    space db " ", 0
    len equ 100
    numbers times len dd 0
segment code use32 class = code
    start:
        mov edi, 0
        lesen:
            push dword zahl ;wir geben auf den Bildschirm die Zahlen in der basis 10
            push dword format
            call [scanf]
            add esp, 4 * 2
 
            mov edx, [zahl] ;edx bekommt welche zahlen wir geben von der tastatur an 
            cmp edx, 0 ;wenn edx=0 dann geht zu final 
            je final
                push dword result ;
                push dword [zahl]
                call primzahl ;wir rufen die Funktion 
                add esp, 4 * 2
 
                mov edx, [result]
                cmp edx, 0
                je n_prime 
                    mov edx, [zahl]
                    mov [numbers + edi], edx
                    add edi, 4
                n_prime:
        jmp lesen
        final:
        mov esi, edi
        mov edi, 0
 
        schreiben:
            mov eax, [numbers + edi]
 
            push eax
            push dword format 
            call [printf]
            add esp, 4 * 2
 
            add edi, 4
 
            push dword space
            call [printf]
            add esp, 4 * 1
 
        cmp edi, esi
        jl schreiben
 
        push dword 0
        call [exit]