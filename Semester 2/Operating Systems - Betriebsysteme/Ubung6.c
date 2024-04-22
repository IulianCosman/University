//Vergleichen Sie den Inhalt zweier Dateien. Die Dateinamen werden als Parameter in der Befehlszeile an das Programm übertragen. Der Vergleich wird an Blöcken von jeweils 1 KB durchgeführt. Das Programm zeigt in der Standardausgabe die Anzahl der Blöcke in jeder Datei und die Anzahl der gefundenen identischen Blöcke im folgenden Format an:
//
//Datei1: Anzahl_der_Blöcke_in_Datei_1
//Datei2: Anzahl_der_Blöcke_in_Datei_2
//Anzahl_identischer_Blöcke

#include <stdio.h>
#include <string.h>

#define KB_size 1024

int blocks(char* filename){

	FILE* file = fopen(filename, "rb");

	if(file == NULL){

		printf("Datei offnen ist nicht moglich\n");
		return -1;

	}

	int count = 0;

	char buffer[KB_size];

	while(1){

		size_t fileread = fread(buffer, 1, KB_size, file);

		if(fileread == 0){

			break;

		}

		count++;

	}

fclose(file);

return count;

}



int compare(char* filename1, char* filename2){

	FILE* file1 = fopen(filename1, "rb");
	FILE* file2 = fopen(filename2, "rb");

	if(file1 == NULL || file2 == NULL){

		printf("Datei offnen ist nicht moglich\n");
		return -1;

	}

	int equal_blocks = 0;

	char buffer1[KB_size];
	char buffer2[KB_size];

	while(1){

		size_t fileread1 = fread(buffer1, 1, KB_size, file1);
		size_t fileread2 = fread(buffer2, 1, KB_size, file2);

		if(fileread1 == 0 || fileread2 == 0){

			break;

		}

		if(memcmp(buffer1, buffer2, fileread1) == 0){

			equal_blocks++;

		}

	}

	fclose(file1);
	fclose(file2);

	return equal_blocks;

}



int main(int argc, char** argv){

if(argc!=3){
printf("Zwei Dateinamen werden gewunscht\n");
return 1;

}

char* filename1 = argv[1];
char* filename2 = argv[2];

int blocks1 = blocks(filename1);
int blocks2 = blocks(filename2);
int equal_blocks = compare(filename1, filename2);

printf("%s: %d\n", filename1, blocks1);
printf("%s: %d\n", filename2, blocks2);
printf("%d\n", equal_blocks);

return 0;

}
