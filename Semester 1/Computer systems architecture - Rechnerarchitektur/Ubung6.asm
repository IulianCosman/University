;Ein Dateiname (definiert im Datensegment) wird gegeben. Erstelle eine Datei mit dem angegebenen Namen, lese dann Zahlen von der Tastatur und schreibe nur die durch 7 teilbaren Zahlen in die Datei, bis der Wert '0' von der Tastatur gelesen wird.

bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit, fopen, fprintf, fclose, printf, scanf               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
import fopen msvcrt.dll
import fclose msvcrt.dll
import fprintf msvcrt.dll
import printf msvcrt.dll 
import scanf msvcrt.dll  
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    
    file_name db "10.txt", 0
    access_mode db "w", 0
    file_descriptor dd -1
    message db "n=", 0
    n dd 0
    format db "%d", 0
    space db " ", 0
    
; our code starts here
segment code use32 class=code
    start:
        ; ...
    push dword access_mode               ; kreiert die Datei
    push dword file_name
    call [fopen]
    add esp, 4*2
    
    mov [file_descriptor], eax
    
    cmp eax, 0                           ; uberpruft, ob die Datei erfolgreich kreiert wird 
    je Final                             ; wenn das nicht passiert, das Programm stoppt
    
    Repeta:                              ; liest Zahlen von der Tastatur, die Schleife wiederholt bis der Wert 0 gegeben wird
    
    push dword message                   ; liest eine Zahl
    call [printf]
    add esp, 4*1
    push dword n
    push dword format
    call [scanf]
    add esp, 4*2
    
    mov ebx, [n]                         
    cmp ebx, 0                           ; uberpruft, ob die Zahl nicht 0 ist
    je StopRepeta                        ; wenn 0 gegeben wird, das Programm stoppt
    
    mov ax, word [n+0]                   ; versetzt die Zahl in dx:ax 
    mov dx, word [n+2]
    mov cx, 7                            ; teilt durch 7
    div cx                               ; uberpruft, ob die Zahl durch 7 teilbar ist 
    cmp dx, 0                            ; (nachdem die Zahl durch 7 durchgeteilt wird, uberpruft, ob der Rest 0 ist)
    jne Repeta                           ; wenn das nicht passiert, die Schleife wiederholt und eine andere Zahl wird gelesen
    
    push dword ebx                       ; wenn die Zahl durch 7 teilbar ist, geht es weiter und die Zahl wird in der Datei geschrieben
    push dword format                    ; schreibt eine Zahl in der Datei
    push dword [file_descriptor]
    call [fprintf]
    add esp, 4*3
    
    push dword space                     ; schreibt " ", sodass es Platz zwischen Zahlen gibt 
    push dword [file_descriptor]
    call [fprintf]
    add esp, 4*2
 
    jmp Repeta                           ; die Schleife wiederholt 
    
    StopRepeta:
    
    push dword [file_descriptor]         ; schliesst die Datei
    call [fclose]
    add esp, 4*1
    
    Final:
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
