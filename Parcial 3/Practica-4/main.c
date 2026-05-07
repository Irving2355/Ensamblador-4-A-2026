#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    char nombre[32];
    int edad;
    int calificacion;
} Alumno; //tamaño aprox en memoria 40 bytes

int contar_aprobados(Alumno *alumnos, int n, int calif_min);
int mejor_indice(Alumno *alumnos, int n);
void subir_puntos(Alumno *alumnos, int n, int puntos);

void imprimir(Alumno *alumnos, int n){
    printf("%-15s %-8s %-12s\n", "Nombre","Edad","Califiacion"); 
    for(int i=0; i<n; i++){
        printf("%-15s %-8d %-12d\n",
            alumnos[i].nombre,
            alumnos[i].edad,
            alumnos[i].calificacion
        );
    }
}


int main(){

    Alumno grupo[] = {
        {"Ana 1", 20, 85},
        {"Ana 2", 21, 80},
        {"Ana 3", 22, 70},
        {"Ana 4", 22, 95},
        {"Ana 5", 21, 05},
        {"Ana 6", 20, 80},
        {"Ana 7", 22, 74}, 
        {"Ana 8", 21, 85}
    };

    int n = sizeof(grupo) / sizeof(grupo[0]);

    int aprobados, indice_mejor;

    printf("Grupo original: \n\n");
    imprimir(grupo, n);

    aprobados = contar_aprobados(grupo,n,65);
    indice_mejor = mejor_indice(grupo,n);

    printf("\nResultados:\n");
    printf("Alumnos aprobados: %d\n", aprobados);

    if(indice_mejor >= 0){
        printf("Mejor alumno: %s\n", grupo[indice_mejor].nombre);
        printf("Mayor calificacion: %d\n", grupo[indice_mejor].calificacion);
    }

    printf("\nSubiendo la calificacion a todos\n");
    subir_puntos(grupo,n,10);

    printf("\nActualizacion del grupo: \n");
    imprimir(grupo,n);
    
    system("pause");
    return 0;
}