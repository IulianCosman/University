;Lesen Sie von der Konsole eine Liste von Zahlen zur Basis 10. Schreiben Sie nur die Primzahlen auf die Konsole.

bits 32
 
global primzahl
 
segment code use32 class = code public 
    primzahl:
        mov ecx, 1 ;ecx= result 
 
        mov esi, 2   
        mov ebx, [esp + 4] ;ebx bekommt zahl an
        cmp ebx, 2
        je prime
        cmp ebx, 1
        je not_prime
        ;for i in range(2, n): wobei i=esi und n=ebx 
        while:
            mov eax, ebx ;wir tuen zahl in eax 
            mov edx, 0   ;verzeichenlose Umwandlung von eax zu edx:eax(Quadwort)
            div esi      
 
            cmp edx, 0 ;edx =rest von der Division 
            jne prime ;wenn edx !=0 dann geht zu not_prime
            not_prime:
            mov ecx, 0 ;wenn edx 0 ist dann bekommt ecx 0 und die Zahl ist nicht prim
            prime:
 
            inc esi ;wir incrementieren esi 
            cmp esi, ebx ;wir vergliechen esi mit ebx und wenn < ist dann geht zu while wieder 
        jl while
 
        mov esi, [esp + 8] ;ESI = the offset of the source string mov edi, [esp+12]
        mov [esi], ecx ;das Ergebnis wird in esi 
        ret