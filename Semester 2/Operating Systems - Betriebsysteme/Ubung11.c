//Schreiben Sie ein Client-Server-Programm, das DELTA einer quadratischen Gleichung berechnet. Der Client sendet drei Zahlen an den Server: a, b, c. Der Server gibt die Lösungen der quadratischen Gleichung mit den Koeffizienten a, b, c zurück oder schickt eine Nachricht dem Client, falls DELTA < 0. Der Client zeigt dann das empfangene Ergebnis an. Stellen Sie sicher, dass Sie Ausnahmen in Ihrer Lösung behandeln.
//Zusätzliche Anforderungen:
//1. Die Zahlen sollen ganze Zahlen sein.
//2. Behandeln Sie Ausnahmen für den Fall DELTA < 0.
//3. Behandeln Sie Ausnahmen für ungültige Eingaben: nicht-numerische Werte.

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>

#define READ 0
#define WRITE 1
#define BUFFER_SIZE 256
#define INVALID_INPUT -1.0

float delta(float a, float b, float c) {
    return b*b-4*a*c;
}

float first(float a, float b, float delta){
    return (-b+sqrt(delta))/(2*a);
}

float second(float a, float b, float delta){
    return (-b-sqrt(delta))/(2*a);
}

int main() {
    int fd1[2], fd2[2];

    pipe(fd1);
    pipe(fd2);
    pid_t pid = fork();

    if (pid > 0) {
        close(fd1[READ]);
        close(fd2[WRITE]);

        char buffer[BUFFER_SIZE];
        float a, b, c;
        char *endptr;

        printf("a = ");
        fgets(buffer, BUFFER_SIZE, stdin);
        a = strtof(buffer, &endptr);

        printf("b = ");
        fgets(buffer, BUFFER_SIZE, stdin);
        b = strtof(buffer, &endptr);

        printf("c = ");
        fgets(buffer, BUFFER_SIZE, stdin);
        c = strtof(buffer, &endptr);

        write(fd1[WRITE], &a, sizeof(a));
        write(fd1[WRITE], &b, sizeof(b));
        write(fd1[WRITE], &c, sizeof(c));

        float x1, x2;
        int status_code;
        read(fd2[READ], &x1, sizeof(x1));
        read(fd2[READ], &x2, sizeof(x2));
        read(fd2[READ], &status_code, sizeof(status_code));

        if(status_code == INVALID_INPUT) {
            printf("Es gibt keine reele Losungen\n");
        } else {
            printf("Die Losungen sind: %f, %f\n", x1, x2);
        }

        close(fd1[WRITE]);
        close(fd2[READ]);
    } else if (pid == 0) {

        close(fd1[WRITE]);
        close(fd2[READ]);

        float a, b, c, d;
        int status_code = 0;

        read(fd1[READ], &a, sizeof(a));
        read(fd1[READ], &b, sizeof(b));
        read(fd1[READ], &c, sizeof(c));

        d = delta(a,b,c);
        if(d<0) {
            printf("Delta < 0\n");
            float invalid = INVALID_INPUT;
            // If the input is invalid, set the status code to INVALID_INPUT
            status_code = INVALID_INPUT;
            write(fd2[WRITE], &invalid, sizeof(invalid));
            write(fd2[WRITE], &invalid, sizeof(invalid));
            write(fd2[WRITE], &status_code, sizeof(status_code));
            exit(1);
        }

        float x1 = first(a,b,d);
        float x2 = second(a,b,d);
        printf("Losungen: %f, %f\n", x1, x2);
	write(fd2[WRITE], &x1, sizeof(x1));
        write(fd2[WRITE], &x2, sizeof(x2));
        write(fd2[WRITE], &status_code, sizeof(status_code));

        // Close the remaining ends of the pipes
        close(fd1[READ]);
        close(fd2[WRITE]);
    } else {
        // Fork failed
        printf("Fork failed\n");
        return 1;
    }

    return 0;
}
