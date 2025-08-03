# karate-reto
Este proyecto contiene la solución al reto de automatización utilizando el framework de pruebas Karate.

### Requisitos Previos

Asegúrate de tener instalado lo siguiente en tu sistema:

* **Java Development Kit (JDK) 17 o superior:** Necesario para ejecutar Maven y el proyecto.
* **Maven:** Para gestionar las dependencias del proyecto y ejecutar las pruebas.
* **Git:** Para clonar el repositorio.

### Clonar el Repositorio

Para obtener una copia local del proyecto, abre una terminal y ejecuta el siguiente comando:

En CMD, bash o powershell
git clone [https://github.com/Marekyleitor/karate-reto.git](https://github.com/Marekyleitor/karate-reto.git)

Navega a la carpeta del proyecto:

En CMD, bash o powershell
cd karate-reto

### Estructura del Proyecto
El proyecto posee la siguiente estructura:

- src/test/java: Contiene:
  * Los archivos .feature de Karate
  * El archivo logback-test.xml para limpieza de mensajes de la consola
  * El archivo karateRunner.java, responsable de especificar que feature ejecutar
  * El package schema.cosultaUsuario, que tiene dentro los schemas de json con los cuales se validan las respuesta

- pom.xml: Archivo de configuración de Maven con las dependencias del proyecto.

### Configuración y Ejecución
Para ejecutar las pruebas de automatización, utiliza Maven. Asegúrate de estar en la raíz del proyecto y ejecuta el siguiente comando:

- Ingresar al archivo karateRunner.java y en la línea que muestra:

  * return Karate.run("classpath:actualizarUsuario.feature");
  
- Reemplaza actualizaUsuario por cualquier feature que necesites ejecutar.

- Hacer clic derecho sobre el archivo karateRunner.java y dar a ´Run 'karateRunner'´.

  * La lista de features son:
    - listarUsuario.feature
    - buscarUsuarioPorId.feature
    - registrarUsuario.feature
    - eliminarUsuario.feature
    - actualizarUsuario.feature

### Visualización de Reportes
Después de la ejecución, Maven generará un reporte de los resultados de las pruebas. Lo puedes encontrar en la siguiente ruta:

- target/surefire-reports/karate-summary.html

Simplemente abre este archivo en tu navegador web para ver los detalles de la ejecución de tus pruebas.