
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
**Introducción**
		
Las llamadas al sistema, las interrupciones y el mapeo de periféricos en memoria son conceptos fundamentales en el desarrollo de software y sistemas en Linux. Estos elementos son esenciales para entender cómo interactúan los programas con el núcleo del sistema operativo y cómo se gestionan los dispositivos de hardware. En esta presentación, exploraremos cada uno de estos temas en detalle para comprender su funcionamiento y su importancia en el contexto de Linux.

**Llamadas al sistema en Linux**

Las llamadas al sistema son la interfaz entre los programas en el espacio de usuario y el núcleo del sistema operativo. Permiten a los programas solicitar servicios al sistema operativo, como la creación de procesos, la gestión de archivos, la comunicación con dispositivos de hardware, entre otros. En Linux, las llamadas al sistema se realizan mediante una interrupción de software, donde el programa solicita al núcleo que ejecute una rutina específica para llevar a cabo una determinada tarea.

Es importante comprender las diferentes categorías de llamadas al sistema en Linux, que incluyen operaciones de archivos (como abrir, cerrar, leer y escribir), gestión de procesos (como crear, terminar y suspender procesos) y operaciones de red (como conectarse a través de sockets). Estas llamadas proporcionan acceso seguro y controlado a recursos del sistema, garantizando la estabilidad y la seguridad del sistema operativo.

En esta sección, exploraremos ejemplos concretos de llamadas al sistema en C, mostrando cómo se pueden utilizar en la práctica para realizar diversas tareas, desde la gestión de archivos hasta la comunicación en red.

**Interrupciones para operaciones de entrada/salida**

Las interrupciones son señales asincrónicas que el hardware o el software pueden generar para indicar la necesidad de atención inmediata por parte del procesador. En el contexto de Linux, las interrupciones son fundamentales para gestionar operaciones de entrada/salida de dispositivos de hardware, como teclados, ratones, discos duros, etc.

El kernel de Linux utiliza un sistema de manejo de interrupciones para responder a estas señales de manera eficiente y oportuna. Cuando un dispositivo de hardware necesita atención, genera una interrupción que detiene temporalmente la ejecución del programa en curso y activa un controlador de interrupciones específico en el kernel. Este controlador se encarga de procesar la interrupción, realizar la operación de entrada/salida necesaria y luego reanudar la ejecución del programa.

Es esencial comprender cómo se utilizan las interrupciones para gestionar las operaciones de entrada/salida en Linux, ya que esto afecta directamente al rendimiento y la eficiencia del sistema. En esta sección, examinaremos en detalle cómo funciona este proceso, desde la generación de una interrupción por parte del hardware hasta la respuesta del kernel y la finalización de la operación de entrada/salida.

**Mapeo de periféricos en memoria**

El mapeo de periféricos en memoria es un mecanismo que permite a los dispositivos de hardware comunicarse directamente con la CPU y el software mediante el acceso a regiones específicas de la memoria del sistema. En Linux, los periféricos se pueden mapear en memoria para facilitar su acceso y control desde el espacio de usuario, lo que simplifica el desarrollo de controladores de dispositivos y aplicaciones que interactúan con hardware específico.

El proceso de mapeo de periféricos implica asignar direcciones de memoria física a registros de control y datos en el dispositivo, lo que permite a los programas acceder a ellos como si fueran variables en la memoria del sistema. Esto proporciona una interfaz coherente y estandarizada para interactuar con diferentes dispositivos de hardware, independientemente de su fabricante o modelo.

En esta sección, exploraremos cómo se realiza el mapeo de periféricos en memoria en Linux, incluyendo ejemplos prácticos de dispositivos comunes como puertos USB, tarjetas de red, etc. Mostraremos cómo acceder y controlar estos dispositivos desde el espacio de usuario utilizando técnicas de mapeo de memoria, lo que permite desarrollar aplicaciones más eficientes y flexibles.

	</p>

</pre>
