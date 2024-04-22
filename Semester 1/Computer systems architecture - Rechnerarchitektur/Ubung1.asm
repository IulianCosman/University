;2 / (a + b * c - 9) + e - d, wobei a, b, c Byte; d Doubleword; e Qword sind.

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
    a db 2
    b db 3
    c db 3
    d dd 3
    e dq 5
; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov al, [b]                  ; al<-b (byte)                                  3
        mul byte [c]                 ; ax<-b*c (word)                                3*3=9
        mov bx, 0
        mov bl, [a]                  ; bx<-a (word)
        add ax, bx                   ; ax<-a+b*c (word)                              9+2=11
        sub ax, 9                    ; ax<-a+b*c-9 (word)                            11-9=2
        mov bx, ax                   ; bx<-a+b*c-9 (word)     
        mov dx, 0
        mov ax, 2                    ; dx:ax<-2 (dword)
        div bx                       ; ax<-dx:ax/bx (word) dx<-dx:ax%bx (word)
                                     ; ax<-2/(a+b*c-9) (word)                        2/2=1
        mov ebx, dword[e+0]
        mov ecx, dword[e+4]          ; ecx:ebx<-e (qword)
        cwde                         ; eax<-ax (dword)
        cdq                          ; edx:eax<-eax (qword)
        add eax, ebx
        adc edx, ecx                 ; edx:eax<-edx:eax+ecx:ebx (qword)
                                     ; edx:eax<-2/(a+b*c-9)+e                        1+5=6
        mov ecx, 0
        mov ebx, [d]                 ; ecx:ebx<-d (qword)
        sub eax, ebx
        sbb edx, ecx                 ; edx:eax<-edx:eax-ecx:ebx (qword)
                                     ; edx:eax<-2/(a+b*c-9)+e-d (qword)              6-3=3
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
