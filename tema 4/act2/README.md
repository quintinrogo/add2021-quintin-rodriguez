# 2. Configurar autenticación LDAP
## 2.1 Crear conexión con servidor

Vamos a configurar de la conexión del cliente con el servidor LDAP.

+ Ir a la MV cliente.
+ No aseguramos de tener bien el nombre del equipo y nombre de dominio (/etc/hostname, /etc/hosts)
+ Ir a Yast -> Cliente LDAP y Kerberos.
+ Configurar como la imagen de ejemplo:
    + BaseDN: dc=ldapXX,dc=curso2021
    + DN de usuario: cn=Directory Manager
    + Contraseña: CLAVE del usuario cn=Directory Manager


+ Al final usar la opción de Probar conexión

## 2.2 Comprobar con comandos

+ Vamos a la consola con usuario root, y probamos lo siguiente:

        id mazinger
        su -l mazinger   # Entramos con el usuario definido en LDAP

        getent passwd mazinger          # Comprobamos los datos del usuario
        cat /etc/passwd | grep mazinger # El usuario NO es local
