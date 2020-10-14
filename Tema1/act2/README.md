# Acceso remoto SSH

## 2.2 Primera conexión SSH desde cliente GNU/Linux

  Ir al cliente clientXXg.

  Hacer un ping serverXXg, comprobar la conectividad con el servidor.

![](./imagenes/Screenshot_12.png)

  nmap -Pn serverXXg, comprobar los puertos abiertos en el servidor (SSH debe estar open).

Debe mostrarnos que el puerto 22 está abierto. Debe aparecer una línea como "22/tcp open ssh". Si esto falla, debemos comprobar en el servidor la configuración del cortafuegos.
