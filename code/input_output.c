#include <stdio.h>
#include <stdlib.h>

int main() {
    char buffer[100]; // Buffer para almacenar la cadena

    // Lee una cadena desde la entrada estándar
    printf("Introduce una cadena: ");
    fgets(buffer, sizeof(buffer), stdin);

    // Escribe la cadena en la salida estándar
    printf("Cadena introducida: %s", buffer);

    return 0;
}
