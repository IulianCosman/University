//Man definiert 𝑃𝑖 als den Prozess, der bestimmt, wie oft der i-Buchstabe in einem Text vorkommt (die Häufigkeit des i-Auftretens). Schreiben Sie ein Programm, das eine Statistik darüber erstellt, wie oft jeder Buchstabe in einem vom Benutzer bereitgestellten Text vorkommt. Das Programm verwendet eine geeignete Anzahl von Prozessen, um die Aufgabe zu lösen.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include <sys/wait.h>

#define SIZE 1024

int main()
{
    char *buffer=malloc(SIZE);
    char letter;
    int letter_count[26] = {0};
    int i, j;
    pid_t pid;
    int status;

    printf("Geben Sie den Text ein: ");

    fgets(buffer,SIZE,stdin);

    for (i = 0; i < 26; i++){
        pid = fork();

        if (pid == 0) {
	    j=0;
            while(buffer[j]!='\n') {
		letter = tolower(buffer[j]);
                if (letter-'a' == i) {
                    letter_count[i]++;
                 }
		j++;
	     }
            exit(letter_count[i]);
        }
	else{
	    wait(&status);
	    letter_count[i] = WEXITSTATUS(status);
	}
    }


    printf("Buchstabenstatistik:\n");
    for (i = 0; i < 26; i++) {
        printf("%c: %d\n", 'a' + i, letter_count[i]);
    }

    return 0;
}
