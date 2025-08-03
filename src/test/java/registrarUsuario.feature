Feature:
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para registrar un usuario a la base de datos de usuarios.

  Background:
    And def consulta201 = read('classpath:schema/cosultaUsuario/consulta201.json')
    And def consulta400_1 = read('classpath:schema/cosultaUsuario/consulta400_1.json')
    And def consulta400_2 = read('classpath:schema/cosultaUsuario/consulta400_2.json')

  Scenario Outline: Caso 01 - Código HTTP 201 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev/usuarios'
    And request {"nome":"<nome>","email":"<email>","password":"<password>","administrador":"<administrador>"}
    When method POST
    Then status 201
    And print response
    * match response == consulta201
    Examples:
      | caso_prueba                 | nome    | email                 | password | administrador |
      | Registro exitoso de usuario | QA Test | qatest123@example.com | 123456   | true          |

  Scenario Outline: Caso 02 - Código HTTP 400 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev/usuarios'
    And request {"nome":"<nome>","email":"<email>","password":"<password>","administrador":"<administrador>"}
    When method POST
    Then status 400
    And print response
    * match response == consulta400_1
    Examples:
      | caso_prueba                | nome    | email                 | password | administrador |
      | Email ya está siendo usado | QA Test | qatest123@example.com | 123456   | true          |

  Scenario Outline: Caso 03 - Código HTTP 400 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev/usuarios'
    And request {"nome":"<nome>","email":"<email>","password":"<password>","administrador":"<administrador>"}
    When method POST
    Then status 400
    And print response
    * match response == consulta400_2
    Examples:
      | caso_prueba                     | nome    | email                 | password | administrador |
      | Valor de administrador inválido | QA Test | qatest123@example.com | 123456   | Other         |
