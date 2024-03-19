
<!---
   Para comentarios usar este bloque para documentar pendientes, secuencias, etc.
--->

https://www.fceia.unr.edu.ar/~diegob/so/material/Llamadas_al_Sistema.pdf
![](https://s3.amazonaws.com/videos.pentesteracademy.com/videos/badges/low/arm-assembly.png)

Borrar y modificar README

# Utilizar los dos directorios

- code  - ahi depositar sus programas los ***archivos extensión *.s****  (Source File) algunos autores en x86 de ponen .asm y en otras plataformas ARM compatibles la extension *.s
- Todo programa lleva su comentario en la parte de arriba, objetivo y nombre del programador minimo, como templete
- images  - de haber algo de pantallas ahi se presentaran, su busca documentarlas en MARKDOWN el código es:

``` ![](images/---archivo.jpg---) recordar que no lleva espacios```

<!---
  Los nombres de las imagenes no deben cambiar de preferenci el nombre del programa como:  KIOSKO.cpp (su pantallas serian KISOCO.jpg, KIOSCO-1.jpg, KIOSCO-2.jpg ... )
  Y asi procurar estar agrupados.
--->



- Programa en MarkDown es inicia con tres tildes * (`) sin espacio, seguido de el lenguaje de programacion, al final del codigo se poner otra vez los mismos tilder..

No se usan espacios en nombres de archivos, usar los nombres estilo camelCase (primera palabra minusculas, mayuscula solo la 1ra letra de cada palabra subsecuente):  ejemplo: sensorHumo, etc.

Suerte.



------

<pre>

	<p align=center>

Tecnológico Nacional de México
Instituto Tecnológico de Tijuana

Departamento de Sistemas y Computación
Ingeniería en Sistemas Computacionales

Semestre:
Febrero - Junio 2022

Materia:
Lenguajes de interfaz

Docente:
M.C. Rene Solis Reyes 

Unidad:
1

Título del trabajo:
Llamadas al sistema y entrada/salida
		
Estudiante:
Bonilla Castañeda Nestor Miguel - 2121192 
Casales Crus Josue Jacob - 21211927
Sotelo Rubio Rodrigo - 21212053 
Flores Ramirez Emiliano Rafael - 20212404


	</p>

</pre>

<pre>

	<p align=left>

Introducción (3 mins)

Explicar los modos kernel y usuario en procesadores modernos:
Modo kernel: Acceso sin restricciones a todas las instrucciones y funcionalidades del procesador. Aquí corre el núcleo del S.O.
Modo usuario: Sólo un subconjunto de instrucciones están disponibles. Aquí corren los procesos de usuario.
Rol del S.O. en administrar recursos y procesos:
El S.O. es responsable de administrar los recursos del sistema (memoria, hardware, etc.)
También gestiona los procesos que se ejecutan en el sistema.
Necesidad de comunicación entre procesos y el núcleo:
Los procesos necesitan solicitar recursos del S.O. (archivos, memoria, etc.)
Debe existir un mecanismo de comunicación entre procesos y el núcleo del S.O.
Llamadas al Sistema en Linux (10 mins)

Definición de llamadas al sistema como interfaz con el kernel:
Son funciones implementadas por el núcleo del S.O.
Permiten a los procesos solicitar servicios y recursos del kernel.
Cambio de modo usuario a kernel para ejecutarlas:
El procesador alterna constantemente entre modos usuario y kernel.
Las llamadas al sistema se ejecutan en modo kernel.
Ejemplos de uso: acceso a archivos, manejo de memoria, dispositivos, etc.
open/read/write para archivos y dispositivos
Llamadas para asignar/liberar memoria
Ejemplos de lectura de teclado, datos de /proc, etc.
Mostrar ejemplos en C vs ensamblador:
En C se usan funciones de librería que internamente hacen las llamadas.
En ensamblador se usa la interrupción 0x80 y registros para parámetros.
Analizar código de ejemplos:
Ejemplo de lectura de archivo con open/read
Obtener fecha/hora con gettimeofday
Estadísticas del sistema con sysinfo
Interrupciones de Entrada/Salida (5 mins)

Interrupciones de hardware para atender eventos de E/S:
Los dispositivos generan interrupciones de hardware cuando necesitan atención.
Señal asíncrona al procesador para atender el evento.
Controladores de interrupción en el kernel:
El kernel tiene controladores que manejan cada interrupción.
Realizan las operaciones necesarias para el dispositivo (lectura, etc.)
Ventajas de manejar E/S de forma asíncrona:
Evita sondear continuamente los dispositivos.
Mejora el rendimiento y eficiencia.
Ejemplo de controlador de interrupción para leer desde teclado:
Mostrar extracto de código del controlador del teclado.
Explicar cómo atiende la interrupción y almacena los datos leídos.
Mapeo de Periféricos en Memoria (4 mins)

Asignar regiones de memoria a registros de control de dispositivos:
Direcciones de memoria son mapeadas a registros de E/S de los dispositivos.
Mantener tablas de mapeo de direcciones:
El kernel tiene tablas que asocian direcciones con puertos de E/S.
Acceso eficiente a dispositivos de E/S desde kernel:
El kernel accede a esas direcciones mapeadas para comunicarse con dispositivos.
Evita instrucciones especiales de E/S.
Ejemplo de mapeo de puertos para dispositivo de entrada:
Código que obtiene dirección mapeada para puerto de teclado.
Leer/escribir datos directamente en esa dirección.
Otros Usos de Llamadas (2 mins)

Establecer/consultar límites de recursos con getrlimit/setrlimit
Manipular cuotas de disco con quotactl
Estadísticas de uso de recursos con getrusage
Controlar asignación de memoria con mlock
Resumen (1 min)

Recapitular los conceptos clave:
Llamadas al sistema como interfaz con el kernel
Cambio de modos usuario/kernel
Interrupciones para E/S asíncrona
Mapeo de memoria para acceso eficiente a dispositivos


	</p>

</pre>
