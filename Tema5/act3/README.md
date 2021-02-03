## 3.4 Comprobamos conectividad

Desde el Máster comprobamos:

    Conectividad hacia los Minions.

      salt '*' test.ping
      minionXXg:
      True

* Versión de Salt instalada en los Minions


      salt '*' test.version
      minionXXg:
      3000
![](/imagenes/2.png)
![](/imagenes/3.png)

# 4.5 Aplicar el nuevo estado

Ir al Master:

Consultar los estados en detalle y verificar que no hay errores en las definiciones.

salt '*' state.show_lowstate

salt '*' state.show_highstate



salt '*' state.apply apache, para aplicar el nuevo estado en todos los minions. OJO: Esta acción puede tardar un tiempo.

![](/imagenes/4.png)
![](/imagenes/5.png)


## 5.1 Crear estado "users"

+ Vamos a crear un estado llamado users que nos servirá para crear un grupo y usuarios en las máquinas Minions (ver ejemplos en el ANEXO).

+ Crear directorio /srv/salt/base/users.
+ Crear fichero /srv/salt/base/users/init.sls con las definiciones para crear los siguiente:
    + Grupo mazingerz
    + Usuarios kojiXX, drinfiernoXX dentro de dicho grupo.

![](/imagenes/6.png)

+ Aplicar el estado.

![](/imagenes/7.png)
![](/imagenes/8.png)
![](/imagenes/9.png)
![](/imagenes/10.png)

## 5.2 Crear estado "dirs"


* Crear estado dirs para crear las carpetas private (700), public (755) y group (750) en el HOME del usuario koji (ver ejemplos en el ANEXO).

* Aplicar el estado dirs.

![](/imagenes/11.png)
![](/imagenes/12.png)
