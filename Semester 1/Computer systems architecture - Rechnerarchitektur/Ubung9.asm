;Erstellen Sie ein Programm, das Ihren Vornamen und Ihren Geburtsort aus einer Datei namens "personal_data.txt" liest. Zeigen Sie dann die gelesenen Daten auf dem Bildschirm in einem lesbaren Format an, z. B. "Mein Name ist [Vorname] und ich bin in [Stadt] geboren". Wenn die Datei nicht gefunden oder gelesen werden kann, geben Sie eine Fehlermeldung aus.
bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit, fopen, fread, fclose, printf             ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
import fopen msvcrt.dll    
import fread msvcrt.dll  
import fclose msvcrt.dll  
import printf msvcrt.dll  
                 ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    file_name db "personal_data.txt", 0 ; filename to be read
    access_mode db "r", 0 ; file access mode
    file_descriptor dd -1 ; variable to hold the file
    len equ 100 ; maximum number of characcters to read
    text times len db 0 ; string to hold the text which is read from the file
    text1 times len db 0
    text2 times len db 0
    format1 db "Mein Name ist %s" , 0
    format2 db " und ich bin in %s geboren", 0 
    
; our code starts here
segment code use32 class=code
    start:
        ; ...
        push dword access_mode ; call fopen() to create the file
        push dword file_name
        call [fopen]
        add esp, 4*2 ; clean-up the stack
        
        mov [file_descriptor], eax ; store the file descriptor returned by fopen

        
        cmp eax, 0
        je final ; check if fopen() has successfully created the file
     

        push dword [file_descriptor] ; read the text from file using fread()
        push dword len
        push dword 1
        push dword text
        call [fread]
        add esp, 4*4 ; clean-up the stack
        
        mov esi, 0         
        mov edi, 0
        
        vorname:
            cmp [text+esi], byte " " ; we create text1 containing the name by moving characters from text to text1, we stop when we find a space character
            je stop1
            mov al, [text+esi]
            mov [text1+edi], al
            inc esi
            inc edi
            jmp vorname
            
        stop1:
            inc esi ; we ignore the space character between the words
            
        mov edi, 0
            
        ort:
            cmp [text+esi], byte "" ; we create text2 containing the place by moving characters from text to text2, we stop when we reach the end of the string
            je stop2
            mov al, [text+esi]
            mov [text2+edi], al
            inc esi
            inc edi
            jmp ort 
            
        stop2:
        
        push dword text1 ; we print the first part of the message
        push dword format1
        call [printf]
        add esp, 4*2
        
        push dword text2 ; we print the second part of the message
        push dword format2
        call [printf]
        add esp, 4*2
        
        push dword [file_descriptor] ; ; call fclose() to close the file
        call [fclose]
        add esp, 4 ; clean-up the stack
        
        
        
        final:
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
