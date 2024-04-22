//Implementieren Sie das folgende Prozesssystem. Die Kanten zeigen, wie die Prozesse kommunizieren:
//1 - Liest von der Standardeingabe einen Text und schreibt je 10 Bytes an jeden Ausgang {2, 3, 4}. Zur Verdeutlichung: Bei diesem Vorgang werden Daten in 10-Byte-Blöcken an drei verschiedene Empfänger gesendet. Der erste Empfänger erhält die ersten 10 Bytes, der zweite Empfänger erhält die nächsten 10 Bytes und der dritte Empfänger erhält die folgenden 10 Bytes. Dieser Sendevorgang wird wiederholt, wobei der erste Empfänger die nächsten 10 Bytes erhält und in der gleichen Reihenfolge fortgefahren wird.
//2 - Addiert die Ziffern.
//3 - Ersetzt die Buchstaben (Klein- und Großbuchstaben) durch 'Z'.
//4 - Sortiert das Ergebnis (nach ASCII-Code) und zeigt dieses in der Standardausgabe an.
//5 - Zeigt in der Standardausgabe an.
//           1
//         / | \
//         2 3 4
//         \ |
//          5

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#define BLOCK_SIZE 10


int compare(const void *a, const void *b) {
    return (*(char *)a - *(char *)b);
}
int main() {
    int pipe1__2[2], pipe1__3[2], pipe1__4[2], pipe2__5[2], pipe3__5[2];

    if (pipe(pipe1__2) < 0 || pipe(pipe1__3) < 0 || pipe(pipe1__4) < 0 || pipe(pipe2__5) < 0 || pipe(pipe3__5) < 0) {
        printf("Pipes were not created \n");
        exit(1);
    }

    char reading_buffer[1000];
    int i = 2;

    printf("Write text: ");
    fgets(reading_buffer, sizeof(reading_buffer), stdin);
    int length = strlen(reading_buffer);
    int number_of_blocks = length / BLOCK_SIZE;

    for (int j = 0; j < number_of_blocks; j++) {
        if (i == 2) {
            write(pipe1__2[1], &reading_buffer[j * BLOCK_SIZE], BLOCK_SIZE);
        } else if (i == 3) {
            write(pipe1__3[1], &reading_buffer[j * BLOCK_SIZE], BLOCK_SIZE);
        } else if (i == 4) {
            write(pipe1__4[1], &reading_buffer[j * BLOCK_SIZE], BLOCK_SIZE);
        }
        i++;
        if (i > 4) {
            i = 2;
        }
    }

    close(pipe1__2[1]);
    close(pipe1__3[1]);
    close(pipe1__4[1]);

    pid_t pid2, pid3, pid4, pid5;

    //The second process

    if ((pid2 = fork()) < 0) {
        printf("No process was created \n");
        exit(1);

    } else if (pid2 == 0) {

        close(pipe1__3[0]);
        close(pipe1__4[0]);
        close(pipe3__5[1]);
        close(pipe1__2[1]);
        close(pipe1__3[1]);
        close(pipe1__4[1]);

        int total = 0;
        char buf[1024];
        ssize_t nrBytes;

        while ((nrBytes = read(pipe1__2[0], buf, sizeof(buf))) > 0) {
            for (int i = 0; i < nrBytes; i++) {
                char c = buf[i];
                if (c >= '0' && c <= '9') {
                    total += (c - '0');
                }
                else if (c == '\0') {
                    break;
                }
            }
        }
        write(pipe2__5[1], &total, sizeof(total));


        close(pipe1__2[0]);
        close(pipe2__5[1]);

        exit(0);
    }

    //The third process

    if ((pid3 = fork()) < 0) {
        printf("No process was created\n");
        exit(1);
    } else if (pid3 == 0) {

        close(pipe1__4[0]);
        close(pipe1__2[1]);
        close(pipe1__3[1]);
        close(pipe1__4[1]);
        close(pipe1__2[0]);
        close(pipe2__5[1]);
        char c;

        while (read(pipe1__3[0], &c, 1) > 0) {
            if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
                c = 'Z';
            }

            write(pipe3__5[1], &c, 1);
        }

        close(pipe1__3[0]);
        close(pipe3__5[1]);

        exit(0);
    }

    //The fourth process

    if ((pid4 = fork()) < 0) {
        printf("No process was created\n");
        exit(1);

    } else if (pid4 == 0) {

        close(pipe1__2[1]);
        close(pipe1__3[1]);
        close(pipe1__4[1]);
        close(pipe1__2[0]);
        close(pipe2__5[1]);
        close(pipe1__3[0]);
        close(pipe3__5[1]);
        close(pipe2__5[1]);
        close(pipe3__5[1]);
        char buffer[10000];
        int bytes_read;

        bytes_read = read(pipe1__4[0], buffer, 10000);

        // qsort using a compare function
        qsort(buffer, bytes_read, sizeof(char), compare);

        buffer[bytes_read]=0;
        printf("Process 4 output: %s \n", buffer);

        close(pipe1__4[0]);
        exit(0);
    }

    waitpid(pid2, NULL, 0);
    waitpid(pid3, NULL, 0);

    if((pid5= fork()) < 0) {
        printf("No process was created\n");
        exit(1);
    } else if (pid5==0) {

        close(pipe1__4[0]);
        close(pipe1__2[1]);
        close(pipe1__3[1]);
        close(pipe1__4[1]);
        close(pipe1__2[0]);
        close(pipe2__5[1]);
        close(pipe1__3[0]);
        close(pipe3__5[1]);
        int nr;
        char buf[10];
        printf("total(Process 2): ");
        if (read(pipe2__5[0], &nr, sizeof(nr)) > 0) {
            printf("%d\n", nr);
        }


        printf("Convert to uppercase(Process 3): ");
        while (read(pipe3__5[0], buf, 1) > 0) {
            printf("%s", buf);
        }

        close(pipe2__5[1]);
        close(pipe3__5[1]);
        exit(0);
    }

    close(pipe2__5[1]);
    close(pipe3__5[1]);

    waitpid(pid4, NULL, 0);
    waitpid(pid5, NULL, 0);

    return 0;
}
