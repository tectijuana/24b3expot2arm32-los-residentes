
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
Febrero - Junio 2024

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

</p>

</pre>


¿Qué tipos de llamadas al sistema hay?
En principio, como se dijo arriba, todas las llamadas al sistema se pueden utilizar como unidades de control para la comunicación entre los procesos de aplicación y el sistema operativo o el hardware. Además, las llamadas al sistema establecidas también se pueden clasificar en diferentes categorías, por lo que se han establecido en particular estos cinco tipos:

Control de procesos: todos los procesos de un sistema informático deben controlarse para que en cualquier momento se puedan detener u otros procesos los puedan dirigir. Para esto, las llamadas al sistema de esta categoría supervisan, por ejemplo, el inicio o la ejecución o la detención/terminación de procesos.
Gestión de archivos: los programas de aplicación requieren este tipo de llamadas al sistema para acceder a las operaciones típicas con archivos. Estos métodos de manipulación de archivos incluyen la creación, eliminación, apertura, cierre, escritura y lectura (create, delete, open, close, write y read).
Gestión de dispositivos: la categoría “Gestión de dispositivos” incluye todas las llamadas al sistema que sirven para solicitar o administrar los recursos de hardware necesarios, como la potencia de computación o el espacio de almacenamiento.
Gestión de la información: los procesos tienen mucha información asociada, y la puntualidad y la integridad son muy importantes. Para intercambiar o solicitar información, los programas de aplicación utilizan llamadas al sistema para la gestión o el mantenimiento de la información.
Comunicación entre procesos: solo se puede garantizar una interacción fluida entre el sistema operativo y los distintos programas de aplicación si los procesos individuales están coordinados. Con este fin, es indispensable la comunicación a través de las correspondientes llamadas al sistema.

Windows y Linux: visión general de las llamadas al sistema
La medida en que los tipos de llamadas al sistema enumerados se pueden implementar o realizar depende principalmente del hardware y de la arquitectura del sistema utilizados, pero también del sistema operativo. En Linux, por ejemplo, las llamadas al sistema se almacenan directamente en el núcleo de Linux en la “Tabla de llamadas al sistema”. Cada entrada de esta tabla tiene asignados un número único y una función específica que se ejecutará en el modo núcleo. Para ejecutar cualquier llamada al sistema Linux, se carga el número en la memoria de la CPU y después se carga mediante una interrupción de software 128 (llamada a una subfunción del sistema operativo que interrumpe la ejecución del programa en el modo de usuario).

Estructura y funciones del sistema de E/S

Características generales de los dispositivos periféricos
 Los dispositivos periféricos presentan las siguientes características:
 Tienen formas de funcionamiento muy diferentes entre sí, debido a las diferentes
funciones que realizan y a los principios físicos en los que se basan
 La velocidad de transferencia de datos es también diferente entre sí y diferente de la
presentada por la CPU y la memoria
 Suelen utilizar datos con formatos y longitudes de palabra diferentes
 A pesar de sus diferencias, los dispositivos periféricos presentan las funciones comunes:
 Necesidad de una identificación única del dispositivo por parte de la CPU
 Capacidad de envío y/o recepción de datos
 Sincronización de la transmisión, exigida por la diferencia de velocidad de los
dispositivos dispositivos de E/S con la CPU

Funciones básicas de los dispositivos periféricos
 Las 3 funciones comunes de los dispositivos periféricos determinan su estructura básica:

![image](https://github.com/tectijuana/24b3expot2arm32-los-residentes/assets/158230637/5f477f79-bbfa-4ac2-aac9-38dda63e7f6b)

Estas funciones básicas se pueden realizar a través del bus del sistema que conecta la
memoria y la CPU, o bien se puede utilizar un bus específico para las operaciones de E/S
Dispositivo periférico
ecEC - IS
memoria y la CPU, o bien se puede utilizar un bus específico para las operaciones de E/S
 Estas alternativas se traducen en dos formas de organización de los espacios de direcciones

Espacio de direcciones de E/S ( ) 1
Dos alternativas:
1) Espacio de direcciones unificado con el espacio de memoria
 Existe un único bus al que se conectan los dispositivos de E/S y la memoria
 La memoria y los di iti spositivos de E/S comparten el espacio de di i recc ones


![image](https://github.com/tectijuana/24b3expot2arm32-los-residentes/assets/158230637/8588a755-121b-47a1-af9b-12333c26d3d5)

 En estos procesadores no existen instrucciones específicas de E/S
)
CPU Memoria de E/S 1 de E/S n
 Se utilizan las instrucciones de referencia a memoria tipo load/store (lw/sw


LOAD Ri, dir_E/S (CPU  Periférico)
STORE Ri, dir E_ /S (Periférico  CPU)

 Ejemplo: ARM
Cada registro de un módulo de E/S es una dirección de memoria dentro de un rango
reservado


Espacio de direcciones de E/S (2)
2) Espacio de direcciones independiente del de memoria (buses independientes)
 Existen buses independientes para la memoria y los dispositivos de E/S


![image](https://github.com/tectijuana/24b3expot2arm32-los-residentes/assets/158230637/f6ca3a96-3af2-4571-b398-8077ef72759e)

En estos procesadores sí existe un grupo de instrucciones específico para la E/S
IN dir_E/S, Ri (CPU  Periférico)
OUT Ri, di E r_ /S (P ifé i (Periférico  CPU)


Ejemplo: Intel x86
Cada registro de un módulo de E/S es un puerto


Módulos de E/S y controladores
 Para solventar la variedad de dispositivos periféricos, la unidad de E/S de un computador se
organiza organiza en torno a dos tipos de elementos elementos:
 Módulos de E/S: soportan las características comunes a muchos dispositivos
 Controladores de dispositivo: son específicos para cada periférico

![image](https://github.com/tectijuana/24b3expot2arm32-los-residentes/assets/158230637/b39d9608-315c-49d4-8e44-0f9fc3675de2)

 Los módulos de E/S permiten que el procesador gestione una amplia gama de dispositivos
periféricos
 El controlador se adapta a las peculiaridades específicas del periférico, actuando sobre
elementos electromecánicos (impresoras de línea), sobre elementos ópticos (CD‐ROM), o
magnéticos (discos), etc

Estructura de un módulo de E/S
 Se conecta al procesador a través de un conjunto de líneas de datos, dirección y control.
 Los datos que se transfieren se almacenan temporalmente en un registro de datos.
 El estado del módulo se refleja en los bits de un registro de estado.
 El registro de control permite programar diferentes funciones en el módulo.

![image](https://github.com/tectijuana/24b3expot2arm32-los-residentes/assets/158230637/015a4706-630b-40f5-a8e0-885abd906586)

Módulos de E/S serie y paralelo
 La conexión entre módulo y dispositivo se puede realizar en forma serie o paralela
 La E/S serie
 Se emplea cuando módulo y dispositivo están a una distancia media o larga y el coste del
medio de transmisión resulta importante
 Utiliza una única línea de transmisión
 La transmi iós n tiene lugar hi d ac en o que la línea ad i qu era sucesivamente a lo largo d l e
tiempo el estado de cada uno de los bits constitutivos del mensaje
 El tiempo asignado a cada bit determina la velocidad de transmisión en bits/segundo

![image](https://github.com/tectijuana/24b3expot2arm32-los-residentes/assets/158230637/f4fe2ec9-5826-4e0b-8315-56f40f436991)


 La E/S paralela
 Se utiliza para conectar módulos de E/S que se encuentran relativamente cerca
del dispositivo periférico
 Utiliza un conjunto de líneas por las que se transmiten en paralelo los bits del mensaje

![image](https://github.com/tectijuana/24b3expot2arm32-los-residentes/assets/158230637/c76b1695-20b5-48c0-89ae-32b7e345583a)



 Sincronización de la E/S

 Sincronización: mecanismos básicos
 Las diferencias de velocidad entre la CPU y los periféricos de E/S, y la no
previsibilidad previsibilidad del tiempo de respuesta respuesta de estos últimos, últimos, hace necesario necesario un
mecanismo de sincronismo que permita coordinar adecuadamente las transferencias
de datos entre ambas unidades
 Antes de enviar/recibir enviar/recibir datos a/desde a/desde un periférico periférico hay que asegurarse asegurarse de que el
dispositivo está preparado para realizar la transferencia, es decir, hay que
sincronizarlo
 Existen dos mecanismos básicos para sincronizar las operaciones de E/S con las de
la CPU: sincronización por programa (E/S programada) y sincronización por
interrupción
 La E/S programada es la más sencilla de implementar, pero presenta el
inconveniente de la pérdida de tiempo: el computador no realiza trabajo útil en el
bucle de espera
 La E/S por interrupción aprovecha mejor el tiempo de CPU, permitiendo la
ejecución concurrente de un programa principal y la operación de E/S







 E/S programada

Operación básica
Cada vez que la CPU quiere realizar
una transferencia:
1. Entra en un bucle en el que lee
l i d
Leer el estado
del módulo
E/S  CPU
una y otra vez el registro de
estado del periférico (encuesta
o “polling”) hasta que esté
preparado para realizar la
no
i
¿estado indica
preparado?
Bucle de
sincronización
preparado para realizar la
transferencia
2. Realiza la transferencia

 ![image](https://github.com/tectijuana/24b3expot2arm32-los-residentes/assets/158230637/eef7f17b-88f5-42b5-9783-d06ca7a7c1cf)

 Problemas de la E/S programada
 La CPU no hace trabajo útil durante el bucle de espera
• Con dispositivos lentos el bucle podría repetirse miles/millones de veces
 La dinámica del programa se detiene durante la operación de E/S
• Ejemplo: Ejemplo: en un vídeo‐juego no se puede detener detener la dinámica dinámica del juego a
espera que el usuario pulse una tecla
 Dificultades para atender a varios periféricos
• Mientras se espera a que un periférico esté listo para transmitir, no se puede
atender a otro


¿Hay margen de mej ?

/S programada:
Orden de
lectura al
módulo de E/S
CPU  E/S
 E/S programada:
– El bucle de SINCRONIZACIÓN ejecuta
instrucciones inútiles

Leer el estado
del módulo
E/S  CPU
 ¿Y si el dispositivo avisase a la CPU
cuando haya terminado su operación?
– La CPU podría hacer trabajo útil
mientras el periférico hace la operación
no ¿estado indica
preparado?
solicitada
– Sólo tendría que retomar el control de
la operación cuando el periférico
hubiese terminado
 Este mecanismo se denomina E/S por
interrupciones

![image](https://github.com/tectijuana/24b3expot2arm32-los-residentes/assets/158230637/8cf205d2-7ede-4748-aead-62bd755f8a82)




