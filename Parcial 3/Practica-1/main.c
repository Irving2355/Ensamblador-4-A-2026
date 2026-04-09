#include <stdio.h>

int suma_arreglo(const int* arr, int n);

int main(){
    int datos[] = {4,5,7,3,5,8,6,2,3};

    int n = sizeof(datos) / sizeof(datos[0]);

    int resultado = suma_arreglo(datos,n);

    printf("Elementos del arreglo: ");
    for(int i=0; i<n; i++){
        printf("%d", datos[i]);
        printf("  ");
    }
    printf("\nSuma total = %d\n",resultado);
    return 0;
}