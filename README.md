
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

¿Qué es una llamada al sistema (syscall)?

Una llamada al sistema o system call es un método utilizado por los programas de aplicación para comunicarse con el núcleo del sistema. En los sistemas operativos modernos, esto es necesario cuando una aplicación o proceso de usuario necesita transmitir a o leer información del hardware, de otros procesos o del propio núcleo. De este modo, la llamada es el punto de enlace entre el modo de usuario y el modo de núcleo, los dos modos cruciales de privilegio y seguridad para el procesamiento de las instrucciones de la CPU en los sistemas informáticos.

Antes de que la llamada al sistema termine de procesarse y se transmitan o reciban los datos correspondientes, el núcleo del sistema toma el control del programa o proceso. 

¿Para qué se necesitan las system calls?
Las system calls están estrechamente ligadas al modelo moderno de sistema operativo con modo usuario y modo núcleo, que se introdujo en respuesta al creciente número de procesos que se ejecutan simultáneamente en la memoria principal (RAM) de los ordenadores. De este modo, cada proceso individual tiene sus propios datos con derechos de acceso especiales y, solo si se distribuyen los recursos correctamente, el sistema y los programas pueden ejecutarse según lo esperado.

El modo núcleo de mayor privilegio es aquí la instancia de control decisiva, porque, como mencionamos, en este no solo se ejecutan todos los servicios y procesos del sistema en sí, sino también las acciones críticas del sistema de los programas de aplicación que en el modo usuario están bloqueadas.

¿Qué tipos de llamadas al sistema hay?
En principio, como se dijo arriba, todas las llamadas al sistema se pueden utilizar como unidades de control para la comunicación entre los procesos de aplicación y el sistema operativo o el hardware. Además, las llamadas al sistema establecidas también se pueden clasificar en diferentes categorías, por lo que se han establecido en particular estos cinco tipos:

Control de procesos: todos los procesos de un sistema informático deben controlarse para que en cualquier momento se puedan detener u otros procesos los puedan dirigir. Para esto, las llamadas al sistema de esta categoría supervisan, por ejemplo, el inicio o la ejecución o la detención/terminación de procesos.
Gestión de archivos: los programas de aplicación requieren este tipo de llamadas al sistema para acceder a las operaciones típicas con archivos. Estos métodos de manipulación de archivos incluyen la creación, eliminación, apertura, cierre, escritura y lectura (create, delete, open, close, write y read).
Gestión de dispositivos: la categoría “Gestión de dispositivos” incluye todas las llamadas al sistema que sirven para solicitar o administrar los recursos de hardware necesarios, como la potencia de computación o el espacio de almacenamiento.
Gestión de la información: los procesos tienen mucha información asociada, y la puntualidad y la integridad son muy importantes. Para intercambiar o solicitar información, los programas de aplicación utilizan llamadas al sistema para la gestión o el mantenimiento de la información.
Comunicación entre procesos: solo se puede garantizar una interacción fluida entre el sistema operativo y los distintos programas de aplicación si los procesos individuales están coordinados. Con este fin, es indispensable la comunicación a través de las correspondientes llamadas al sistema.

Windows y Linux: visión general de las llamadas al sistema
La medida en que los tipos de llamadas al sistema enumerados se pueden implementar o realizar depende principalmente del hardware y de la arquitectura del sistema utilizados, pero también del sistema operativo. En Linux, por ejemplo, las llamadas al sistema se almacenan directamente en el núcleo de Linux en la “Tabla de llamadas al sistema”. Cada entrada de esta tabla tiene asignados un número único y una función específica que se ejecutará en el modo núcleo. Para ejecutar cualquier llamada al sistema Linux, se carga el número en la memoria de la CPU y después se carga mediante una interrupción de software 128 (llamada a una subfunción del sistema operativo que interrumpe la ejecución del programa en el modo de usuario).

