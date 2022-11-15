# Base proyecto for docker and Laravel

Lista de requisitos obligatorios para levantar el proyecto:

**Habilita la virtualizacion en la BIOS**

## Descarga e instala docker
* **https://docs.docker.com/get-docker/**

NOTA: Si al instalar docker no te inicia y te da un mensaje pidiendote activar WSDL 2
sigue la guía que se muestra a continuación hasta el paso 5 (incluido):
* **https://docs.microsoft.com/es-es/windows/wsl/install-manual**

## Descarga e instala php
Descarga la version 8.x de php, la manera más sencilla es instalando XAMPP que ya trae php consigo (la ruta de instalacion es indiferente, puedes modificarla y no usar la por defecto):
* **https://downloadsapachefriends.global.ssl.fastly.net/8.1.6/xampp-windows-x64-8.1.6-0-VS16-installer.exe?from_af=true**

Una vez tengas php disponible en tu pc (para comprobar que lo tienes abre un terminal y escribe php -v tendra que responderte algo asi:

PHP 8.1.4 (cli) (built: Mar 16 2022 09:33:31) (ZTS Visual C++ 2019 x64)
) 

## Descarga e instala composer
Tenemos disponible un instalador (setup) para windows:
* **https://getcomposer.org/download/** 

## Descarga e instala NPM
Tambien es necesario NPM para compilar las fuentes del front (si procede):
* **https://docs.npmjs.com/downloading-and-installing-node-js-and-npm**

## Descarga e instala chocolatey:
Chocolatey es un programa que nos ayuda a descargar e instalar otros programas, vendria a ser parecido a los comandos npm install xxx o composer install xxx
* **https://chocolatey.org/**

## Descarga e instala Make a traves de chocolatey:
En nuestro caso usamos make para instalar una herramienta propia de sistemas linux.
* **https://community.chocolatey.org/packages/make**

## Instrucciones para levantar el proyecto en local:

Una vez tenemos todos los requisitos previos instalados y funcionando procederemos a hacer el clone del proyecto desde nuestro repositorio

Ejecutamos el script **init-script.bat** para que se copien los archivos de ejemplo necesarios (.env.example, nginx_example.conf, mysqld-example.conf, etc)

## Contruyendo y levantando los contenedores docker

Una vez hemos copiado estos dos ficheros de configuracion, podemos abrir un terminal en la ruta raiz del proyecto y ejecutar el comando
* **make up**

A continuacion se empezarán a crear las imagenes y contenedores docker, si no hay error ejecutamos el siguiente comando en la misma terminal
* **make composer-install**
* **make app-init**

y ya estarías listo para poder desarrollar y trabajar en nuestro back

## Lanzar phpUnit

Para lanzar los test unitarios debemos copiar el siguiente archivo:
* **./Track-Stars-back/application** <- entramos a esta ruta copiamos el fichero **phpunit.example.xml** y lo pegamos renombrandolo como **"phpunit.xml"**


* Despues ejecutamos el comando **make test**
tambien tenemos otros comandos disponibles como **make test-feature** para ejecutar solamente los tests de la carpeta Feature e ignorar los tests unitarios

## Autocompletado en IDE
Te recomendamos instalar en tu proyecto laravel la siguiente libreria para autocompletado de codigo **(barryvdh/laravel-ide-helper)**

