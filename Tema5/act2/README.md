## 3.2 Comprobamos

Abrimos una nueva terminal.

+ docker ps, nos muestra los contenedores en ejecución. Podemos apreciar que la última columna nos indica que el puerto 80 del contenedor está redireccionado a un puerto local 0.0.0.0.:PORT -> 80/tcp.

![](/imagenes/1.png)

+ Abrir navegador web y poner URL 0.0.0.0.:PORT. De esta forma nos conectaremos con el servidor Nginx que se está ejecutando dentro del contenedor.

![](/imagenes/2.png)



## 3.3 Migrar la imagen a otra máquina

Exportar imagen Docker a fichero tar:

+ docker save -o alumnoXXdocker.tar nombre-alumno/nginx1, guardamos la imagen "nombre-alumno/nginx1" en un fichero tar.

+ Intercambiar nuestra imagen exportada con la de un compañero de clase.

Importar imagen Docker desde fichero:

+ Coger la imagen de un compañero de clase.

+ Nos llevamos el tar a otra máquina con docker instalado, y restauramos.

+ docker load -i alumnoXXdocker.tar, cargamos la imagen docker a partir del fichero tar. Cuando se importa una imagen se muestra en pantalla las capas que tiene. Las capas las veremos en un momento.


+ docker images, comprobamos que la nueva imagen está disponible.

![](/imagenes/6.png)

En este caso fue con mi compañero abian ahi podemos ver su imagen.

## 4.2 Crear imagen a partir del Dockerfile

+ El fichero Dockerfile contiene toda la información necesaria para construir el contenedor, veamos:

+ cd dockerXXa, entramos al directorio con el Dockerfile.

+ docker build -t nombre-alumno/nginx2 ., construye una nueva imagen a partir del Dockerfile. OJO: el punto final es necesario.
![](/imagenes/5.png)
![](/imagenes/4.png)


## 4.3 Crear contenedor y comprobar

+ A continuación vamos a crear un contenedor con el nombre app4nginx2, a partir de la imagen nombre-alumno/nginx2. Probaremos con:

    Docker run --name=app4nginx2 -p 8082:80 -t nombre-alumno/nginx2

![](/imagenes/6.png)

Desde otra terminal:

+ docker ps, para comprobar que el contenedor está en ejecución y en escucha por el puerto deseado.
Comprobar en el navegador:

![](/imagenes/7.png)

URL http://localhost:PORTNUMBER

![](/imagenes/8.png)

URL http://localhost:PORTNUMBER/holamundo2.html

![](/imagenes/9.png)


+ Ahora que sabemos usar los ficheros Dockerfile, nos damos cuenta que es más sencillo usar estos ficheros para intercambiar con nuestros compañeros que las herramientas de exportar/importar que usamos anteriormente.

## 4.4 Usar imágenes ya creadas




+ Crea el directorio dockerXXb. Entrar al directorio.

Crear fichero holamundo3.html con:

    Proyecto: dockerXXb
    Autor: Nombre del alumno
    Fecha: Fecha actual
Crea el siguiente Dockerfile

    FROM nginx

    COPY holamundo3.html /usr/share/nginx/html
    RUN chmod 666 /usr/share/nginx/html/holamundo3.html

+ Poner el el directorio dockerXXb los ficheros que se requieran para construir el contenedor.

+ docker build -t nombre-alumno/nginx3 ., crear la imagen.

![](/imagenes/10.png)

+ docker run --name=app5nginx3 -d -p 8083:80 nombre-alumno/nginx3, crear contenedor.

![](/imagenes/11.png)

+ Comprobar el acceso a "holamundo3.html".

![](/imagenes/12.png)

# 5.Docker Hub

Ahora vamos a crear un contenedor "holamundo" y subirlo a Docker Hub.

Crear nuestra imagen "holamundo":

+ Crear carpeta dockerXXc. Entrar en la carpeta.
+ Crear un script (holamundoXX.sh) con lo siguiente:

      #!/bin/sh
      echo "Hola Mundo!"
      echo "nombre-del-alumnoXX"
      echo "Proyecto dockerXXc"
      date

+ Este script muestra varios mensajes por pantalla al ejecutarse.

   Crear fichero Dockerfile

    FROM busybox
    MAINTAINER nombre-del-alumnoXX 1.0

    COPY holamundoXX.sh /root
    RUN chmod 755 /root/holamundoXX.sh

    CMD ["/root/holamundoXX.sh"]

+ A partir del Dockerfile anterior crearemos la imagen nombre-alumno/holamundo.

   ![](/imagenes/15.png)

+ Comprobar que docker run nombre-alumno/holamundo se crea un contenedor que ejecuta el script.

   ![](/imagenes/16.png)

Subir la imagen a Docker Hub:
+ Registrarse en Docker Hub.
+ docker login -u USUARIO-DOCKER, para abrir la conexión.

   ![](/imagenes/14.png)

+ docker tag nombre-alumno/holamundo:latest USUARIO-DOCKER/holamundo:version1, etiquetamos la imagen con "version1".

+ docker push USUARIO-DOCKER/holamundo:version1, para subir la imagen (version1) a los repositorios de Docker.

   ![](/imagenes/17.png)
