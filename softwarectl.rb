#! /usr/bin/env ruby

def empty 
  print(" Utiliza el parámetro --help para visualizar la ayuda \n ")
end 

def help 
  print("Usage:
        systemctml [OPTIONS] [FILENAME]
Options:
        --help, mostrar esta ayuda.
        --version, mostrar información sobre el autor del script
                   y fecha de creacion.
        --status FILENAME, comprueba si puede instalar/desintalar.
        --run FILENAME, instala/desinstala el software indicado.
Description:
        Este script se encarga de instalar/desinstalar
        el software indicado en el fichero FILENAME.
        Ejemplo de FILENAME:
        tree:install
        nmap:install
        atomix:remove \n")
end

def show_version 

puts 'Hecho0 por quintin rguez el 22/2/21'
end 

option = ARGV[0]
file = ARGV[1]

 def status(line_spl)
  status = `whereis #{line_spl[0]} |grep bin |wc -l`.to_i

    if status == 0
      puts "#{line_spl[0]} no está instalado"
    elsif status == 1
      puts "#{line_spl[0]} está instalado"
    end

end

def run(line_spl)
  status = `whereis #{line_spl[0]} |grep bin |wc -l`.to_i
  command = "#{line_spl[1]}".to_s

  if command == "install"

    if status == 0
      `apt-get install -y #{line_spl[0]}`
      puts "#{line_spl[0]} Instalación completa "
    elsif status == 1
      puts "#{line_spl[0]} Ya está instalado"
    end

  elsif command == "remove"

    if status == 1
      `apt-get --purge remove -y #{line_spl[0]}`
      puts "#{line_spl[0]} Desinstalación completa"
    elsif status == 0
      puts "#{line_spl[0]} El programa no está instalado "
    end

  end

end

if ARGV[0] == nil 
  empty

elsif ARGV[0] == "--help"
  help

elsif ARGV[0] == "--version"
 show_version

elsif option == "--status"
  file = `cat #{file} `
  file_ln = file.split("\n")
  file_ln.each do |line|
    line_spl = line.split(":")
    status(line_spl)
    end
    
elsif option == "--run"
  user = `id -u`.to_i

  if user == 0
    file = `cat #{file} `
    file_ln = file.split("\n")
    file_ln.each do |line|
      line_spl = line.split(":")
      run(line_spl)
    end
    
  elsif user != 0
    puts "Debes ser usuario root"
    exit 1
  end
  
  
end 
