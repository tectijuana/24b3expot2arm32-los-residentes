; Título: Llamadas al sistema y entrada y salida
; Archivo: tee.s
; Descripción: Copiado de cadena de la entrada estándar a la salida estándar
; Entrada: Cadena arbitraria por medio de stdin
; Salida: La misma cadena por medio de stdout
;
;---------------------------------------------------------------------------;
;                          LENGUAJE DE ALTO NIVEL                           ;
;---------------------------------------------------------------------------;
; Implementación en lenguaje de alto nivel (C)
;
; ;include<sys/types.h>
; ;include<unistd.h>
;
; int main()
; {
; 	char buf[64];
;
; 	while (1)
; 	{
; 		ssize_t bytes = read(STDIN_FILENO, buf, sizeof(buf));
;
; 		if (bytes <= 0)
; 			return 0;
;
; 		char *p=buf;
;
; 		do
; 		{
; 			ssize_t written = write(STDOUT_FILENO, p, bytes);
;
; 			if (written <= 0)
; 				return 0;
;
; 			p += written;
; 			bytes -= written;
;
; 		} while (bytes != 0);
; 	}
; }

;---------------------------------------------------------------------------;
;                               DEFINICIONES                                ;
;---------------------------------------------------------------------------;
; Definiciones de constantes necesarias para el programa

SYSCALL_READ	= 0x3
SYSCALL_WRITE	= 0x4

STDIN_FILENO	= 0
STDOUT_FILENO	= 1

;---------------------------------------------------------------------------;
;                                   DATOS                                   ;
;---------------------------------------------------------------------------;
; Variables usadas por el programa

.section .data

; búffer para la lectura y escritura de los datos en stdin y stdout
buf:
.fill 64, 1, 0
bufend:

; definición útil para la llamada al sistema
buflen = bufend - buf

; puntero a los datos restantes de escribir
current:
	.long 0

; contador de bytes por escribir
count:
	.long 0

;---------------------------------------------------------------------------;
;                             SECCIÓN DE CÓDIGO                             ;
;---------------------------------------------------------------------------;
; En esta sección se escribe el código del programa

.global _start

.section .text

_start:
loop:
	; Parámetros para la llamada read(2)
	; 	r0 = $STDIN_FILENO
	; 	r1 = buf*
	; 	r2 = count
	; 	r7 = $SYSCALL_READ

	mov r0, $STDIN_FILENO
	ldr r1, =buf
	mov r2, $buflen
	mov r7, $SYSCALL_READ
	swi $0

	; error o eof
	cmp r0, $0
	ble endproc

	; se guarda la cuenta de los bytes leídos en las variables
	ldr r8, =count
	str r0, [r8]
	mov r2, r0

	ldr r1, =buf
	ldr r6, =current
	str r1, [r6]

writeloop:
	; Parámetros para la llamada a write(2)
	; 	r0 = $STDOUT_FILENO
	; 	r1 = buf*
	; 	r2 = count
	; 	r7 = $SYSCALL_WRITE
	mov r0, $STDOUT_FILENO
	mov r7, $SYSCALL_WRITE
	swi $0

	; error o eof
	cmp r0, $0
	ble endproc

	; count -= r0
	ldr r8, =count
	ldr r2, [r8]
	subs r2, r0
	; si count == 0, se salta de regreso a loop
	beq loop
	str r1, [r8]

	; current += r0
	ldr r6, =current
	ldr r1, [r6]
	add r1, r0
	str r1, [r6]

	; aún quedan bytes por escribir
	b writeloop

endproc:
	; exit(2)
	mov r1, $0
	mov r7, $1
	swi $0
	b .

