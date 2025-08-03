# Informe de Estrategia de Automatización y Patrones de Diseño
El proyecto utiliza **Karate DSL** para automatizar pruebas de la API del servidor `serverest.dev`. La estrategia se centra en un enfoque **BDD (Behavior-Driven Development)**, donde los archivos `.feature` describen el comportamiento esperado de la API en un formato legible.

## Estrategia de Automatización

La estrategia se basa en los siguientes puntos clave:

### Enfoque de BDD:
Cada archivo `.feature` actúa como una especificación ejecutable. El proyecto está organizado en archivos que describen funcionalidades específicas como la gestión de usuarios. Esto permite que tanto el equipo técnico como los interesados de negocio puedan entender el propósito de cada prueba.

### Pruebas de Integración y Casos de Borde:
La automatización no solo valida los casos de éxito (códigos HTTP 200 y 201) sino que también cubre escenarios negativos y de borde. Por ejemplo, se prueba la eliminación de un usuario inexistente y la respuesta al enviar parámetros inválidos en una consulta.

### Reutilización de Componentes:
Se utiliza la sección Background para cargar variables y esquemas JSON que se usan en múltiples escenarios. Esto evita la duplicación de código y simplifica el mantenimiento.


## Patrones de Diseño Aplicados

Para mantener el código limpio, escalable y fácil de mantener, se aplicaron los siguientes patrones:

### Data-Driven Testing (DDT):
El patrón más destacado es el uso de `Scenario Outline` con la sección `Examples`. Esto permite ejecutar el mismo escenario de prueba con diferentes conjuntos de datos, lo que es crucial para validar múltiples casos de prueba de forma eficiente, como la validación de formatos de ID inválidos o la búsqueda de usuarios con distintos parámetros.

### Validación de Esquema de Respuesta (Contract Testing):
Se utiliza el patrón de **Validación de Contrato**. A través del uso de la función 

`read` para cargar esquemas JSON, se verifica que la estructura y el tipo de datos de la respuesta de la API sean consistentes con lo esperado, utilizando 

`* match response == consulta200_3`.

### Assertion personalizada:
Se implementó una lógica de validación avanzada en el archivo de `listarUsuario.feature` con una función de JavaScript llamada `validoEstado`. Esto demuestra la capacidad de crear aserciones personalizadas más allá de las validaciones de esquema o valores simples, lo cual es una práctica avanzada y recomendada.


## En resumen
 La estrategia combina la legibilidad del BDD con patrones de diseño de software probados, lo que resulta en un conjunto de pruebas de API robusto, mantenible y escalable.