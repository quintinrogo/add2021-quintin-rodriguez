## 3.3 Comprobar

+ Vamos a crear una MV nueva y la vamos a iniciar usando Vagrant:

+ Debemos estar dentro de vagrantXX-celtics.

+ vagrant up, para iniciar una nueva instancia de la máquina.

+ vagrant ssh: Conectar/entrar en nuestra máquina virtual usando SSH

## 5.2 Comprobar

Para confirmar que hay un servicio a la escucha en 4567, desde la máquina real podemos ejecutar los siguientes comandos:

+ En el HOST-CON-VAGRANT (Máquina real). Comprobaremos que el puerto 4567 está a la escucha.

+ vagrant port para ver la redirección de puertos de la máquina Vagrant.

+ En HOST-CON-VAGRANT, abrimos el navegador web con el URL http://127.0.0.1:4567. En realidad estamos accediendo al puerto 80 de nuestro sistema virtualizado.

## 6.1 Proyecto Lakers

Ahora vamos a suministrar a la MV un pequeño script para instalar Apache.

+ Crear directorio vagrantXX-lakers para nuestro proyecto.
+ Entrar en dicha carpeta.
+ Crear la carpeta html y crear fichero html/index.html con el siguiente contenido:

      <h1>Proyecto Lakers</h1>
      <p>Curso202021</p>
      <p>Nombre-del-alumno</p>

+ Crear el script install_apache.sh, dentro del proyecto con el siguiente contenido:

      #!/usr/bin/env bash

      apt-get update
      apt-get install -y apache2

Incluir en el fichero de configuración Vagrantfile lo siguiente:

+ config.vm.hostname = "nombre-alumnoXX-lakers"

+ config.vm.provision :shell, :path => "install_apache.sh", para indicar a Vagrant que debe ejecutar el script install_apache.sh dentro del entorno virtual.

+ config.vm.synced_folder "html", "/var/www/html", para sincronizar la carpeta exterior html con la carpeta interior. De esta forma el fichero "index.html" será visible dentro de la MV.

+ vagrant up, para crear la MV.


+ Para verificar que efectivamente el servidor Apache ha sido instalado e iniciado, abrimos navegador en la máquina real con URL http://127.0.0.1:4567.

## 6.2 Proyecto Raptors (Suministro mediante Puppet)

Se pide hacer lo siguiente.

+ Crear directorio vagrantXX-raptors como nuevo proyecto Vagrant.

+ Modificar el archivo Vagrantfile de la siguiente forma:

      Vagrant.configure("2") do |config|
      ...
      config.vm.hostname = "nombre-alumnoXX-raptors"
      ...
      #Nos aseguramos de tener Puppet en la MV antes de usarlo.
      config.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install -y puppet"

      #Hacemos aprovisionamiento con Puppet
      config.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "nombre-del-alumnoXX.pp"
      end


+ Crear la carpeta manifests.

+ Crear el fichero manifests/nombre-del-alumnoXX.pp, con las órdenes/instrucciones Puppet necesarias para instalar el software que elijamos (Cambiar PACKAGENAME por el paquete que queramos). Ejemplo:

      package { 'PACKAGENAME':
      ensure => 'present',
      }

Con la MV encendida

+ vagrant reload, recargar la configuración.

+ vagrant provision, volver a ejecutar la provisión.


## 7.2 Crear caja Vagrant

Una vez hemos preparado la máquina virtual ya podemos crear el box.

+ Vamos a crear una nueva carpeta vagrantXX-bulls, para este nuevo proyecto vagrant.

+ VBoxManage list vms, comando de VirtualBox que muestra los nombres de nuestras MVs. Elegir una de las máquinas (VMNAME).

+ Nos aseguramos que la MV de VirtualBox VMNAME está apagada.
vagrant package --base VMNAME --output nombre-alumnoXX.box, parar crear nuestra propia caja.

+ Comprobamos que se ha creado el fichero nombre-alumnoXX.box en el directorio donde hemos ejecutado el comando.

+ vagrant box add nombre-alumno/bulls nombre-alumnoXX.box, añadimos la nueva caja creada por nosotros, al repositorio local de cajas vagrant de nuestra máquina.

+ vagrant box list, consultar ahora la lista de cajas Vagrant disponibles.
