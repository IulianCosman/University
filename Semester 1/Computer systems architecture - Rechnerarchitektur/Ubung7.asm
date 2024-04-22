;Lese zwei Zahlen a und b (in der Basis 10) von der Tastatur und berechne ihr Produkt. Dieser Wert wird in einer Variablen namens "result" (definiert im Datensegment) gespeichert. Die Werte werden in vorzeichenloser Darstellung betrachtet.

bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit, printf, scanf               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
import printf msvcrt.dll 
import scanf msvcrt.dll                         ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    
    a dd 0
    b dd 0 
    result dq 0
    message1 db "a=", 0
    message2 db "b=", 0
    format db "%d", 0
    
; our code starts here
segment code use32 class=code
    start:
        ; ...
        
    push dword message1                 ; liest a von der Tastatur
    call [printf]
    add esp, 4*1
    push dword a
    push dword format
    call [scanf]
    add esp, 4*2
    
    push dword message2                 ; liest b von der Tastatur
    call [printf]
    add esp, 4*1
    push dword b 
    push dword format
    call [scanf]
    add esp, 4*2
                                        ; wir berechnen a*b
    mov eax, [a]                        ; eax <- a
    mul dword [b]                       ; edx:eax <- a*b
    
    mov [result+0], edx
    mov [result+4], eax                 ; result <- edx:eax
    
    push dword [result+0]               ; schreibt result auf dem Bildschirm
    push dword format
    push dword [result+4]
    push dword format
    call [printf]
    add esp, 4*4
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
