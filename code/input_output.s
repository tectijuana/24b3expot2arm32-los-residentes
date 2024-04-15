.data
buffer: .space 100     #Reserva espacio para el buffer

.equ stdout, 1         #Define la salida estándar como 1

.equ SYS_read, 3       #Número de llamada al sistema para leer
.equ SYS_write, 4      #Número de llamada al sistema para escribir
.equ SYS_exit, 1      # Número de llamada al sistema para salir

.equ STDIN_FILENO, 0   # Descriptor de archivo para la entrada estándar

.equ BUF_SIZE, 100     # Tamaño del buffer

.text
.global _start

_start:
    # Imprime el mensaje "Introduce una cadena: "
    ldr r0, =message
    bl printf

    # Lee la cadena desde la entrada estándar
    ldr r0, =buffer
    mov r1, #BUF_SIZE
    bl fgets

    # Imprime la cadena introducida
    ldr r0, =format
    ldr r1, =buffer
    bl printf

    # Salir del programa
    mov r0, #0
    bl exit

printf:
    # Llamada al sistema para printf
    ldr r7, =SYS_write
    mov r1, stdout
    svc 0
    bx lr

fgets:
    # Llamada al sistema para fgets
    ldr r7, =SYS_read
    mov r1, STDIN_FILENO
    svc 0
    bx lr

exit:
    # Llamada al sistema para salir del programa
    ldr r7, =SYS_exit
    svc 0

.data
message:
    .asciz "Introduce una cadena: "
format:
    .asciz "Cadena introducida: %s\n"
