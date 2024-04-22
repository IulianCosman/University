;(a * b + 2) / (a + 7 - c) + d + x, wobei a, c Byte; b Word; d Doubleword; x Qword sind.

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
    c db 14
    b dw 9
    d dd 5
    x dq 5
; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov ax, 0
        mov al, [a]                                       ; ax<-a (word)                              2
        imul word [b]                                     ; dx:ax<-a*b (dword)                        2*9=18
        add ax, 2                                         ; dx:ax<-a*b+2 (dword)                      18+2=20
        mov bx, 0
        mov bl, [a]                                       ; bx<-a (word)                              2
        add bx, 7                                         ; bx<-a+7 (word)                            7+2=9
        mov cx, 0
        mov cl, [c]                                       ; cx<-c (word)           
        sub bx, cx                                        ; bx<-a+7-c (word)                          9-14=-5
        idiv bx                                           ; ax<-dx:ax/bx (word) dx<-dx:ax%bx (word)   
                                                          ; ax<-(a*b+2)/(a+7-c) (word)                20/(-5)=-4
        cwde                                              ; eax<-(a*b+2)/(a+7-c) (dword)                                              
        add eax, [d]                                      ; eax<-(a*b+2)/(a+7-c)+d (dword)            -4+5=1                                     
        cdq                                               ; edx:eax<-(a*b+2)/(a+7-c)+d (qword)
        add eax, dword[x+0]
        adc edx, dword[x+4]                               ; edx:eax<-(a*b+2)/(a+7-c)+d+x (qword)      1+5=6
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
