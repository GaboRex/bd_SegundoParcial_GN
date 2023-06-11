# **Segundo Parcial BD - Implementación  Nuevo Sistema De Almacenes Para Los Medicamentos Controlados Para La Ceass**.👨‍⚕️🏥

## **Descripción de la entidad y los requisitos**🏢.

_La CEASS (Central de Abastecimiento y Suministros de Salud) es una institución destacada en el suministro de medicamentos esenciales en Bolivia. Su principal misión es garantizar el abastecimiento de medicamentos esenciales y suministros médicos de calidad, a precios asequibles, a todos los establecimientos de salud de los subsectores público y de la seguridad social de corto plazo en el país._

_Lo que se busca con esta propuesta es tener una base de datos la cual nos permita verificar y registrar los clientes, medicamentos, proveedores, ventas, compras, movimientos de almacenes, entre otros._

_Con el objetivo de automatizar y gestionar de manera eficiente los alamacenes, inventarios, registros, stocks de medicamentos. entre otros._

## **Diagrama propuesto de Base Datos** ☁🤖.


## **Requisitos técnicos**🖥💻.
### Windows.
_Para ejecutar Docker Compose en Windows, necesitarás:_

* _Sistema operativo: Windows 10 64-bit: Pro, Enterprise o Education (con la versión 1607 o posterior) o Windows Server 2016.
* Docker Desktop: Debes tener instalado Docker Desktop para Windows. Puedes descargarlo e instalarlo desde el sitio web oficial de Docker.
* Git: Para poder clonar nuestro repositorio.  (https://git-scm.com/download/win)
### MAC.
_Para ejecutar Docker Compose en macOS (Mac), necesitarás:_

* Sistema operativo: macOS 10.13 o superior.
* Docker Desktop: Debes tener instalado Docker Desktop para macOS. Puedes descargarlo e instalarlo desde el sitio web oficial de Docker.
* Git: Para poder clonar nuestro repositorio. (https://git-scm.com/download/mac)

Es importante tener en cuenta que Docker Desktop incluye Docker Engine, Docker Compose y otras herramientas relacionadas. Una vez que hayas instalado Docker Desktop correctamente en tu sistema, podrás ejecutar comandos de Docker Compose en la línea de comandos de tu sistema operativo, ya sea Windows o macOS.

## **¿Cómo podemos levantarlo localmente? 🤓**

1. Abre una terminal o línea de comandos en tu sistema operativo.Clona el repositorio utilizando el siguiente comando:

        git clone https://github.com/GaboRex/bd_GabrielNeme.git

2. Guardalo en una carpeta nueva para evitar conflictos, localiza la misma y ejecuta un:

        cd <nombre_carpeta>
3. Verifica que el archivo docker-comp.yml y la carpeta master-scripts esten presentes en la carpeta. Puedes usar el siguiente comando para listar los archivos en la ubicación actual:

        ls
4. Una vez que te encuentres en la ubicación correcta del repositorio y el archivo docker-comp.yml y la carpeta master-cripts esten presentes, puedes ejecutar el siguiente comando para levantar los servicios definidos en tu archivo docker-comp.yml:

        docker-compose up

**OJO**

Esto solo funcionara si nos ecnontramos en ese directorio. Si es que no debemos ejecutar el mismo comando pero con la ruta correspondiente del archivo docker-comp.yml.

        docker-compose </ruta> up

5. Si deseas detener los servicios y eliminar los contenedores, puedes utilizar el siguiente comando en la terminal:

        docker-compose down


## Autor:✒️

* **Gabriel Neme** -[GaboRex](https://github.com/GaboRex)
* **Codigo:** 56189






