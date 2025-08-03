Feature:
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para actualizar un usuario de la base de datos de usuarios.

  Background:
    And def consulta200_6 = read('classpath:schema/cosultaUsuario/consulta200_6.json')
    And def consulta201 = read('classpath:schema/cosultaUsuario/consulta201.json')
    And def consulta400_1 = read('classpath:schema/cosultaUsuario/consulta400_1.json')

  Scenario Outline: Caso 01 - Código HTTP 200 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev'
    And path 'usuarios', '<_id>'
    And request {"nome":"<nome>","email":"<email>","password":"<password>","administrador":"<administrador>"}
    When method PUT
    Then status 200
    And print response
    * match response == consulta200_6
    Examples:
      | caso_prueba        | nome                | email                | password | administrador | _id              |
      | Usuario actulizado | Usuario ACT con PUT | usuarioACT@qa.com.br | prueba   | true          | CajWsmMp6OvFUszQ |

  Scenario Outline: Caso 02 - Código HTTP 201 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev'
    And path 'usuarios', '<_id>'
    And request {"nome":"<nome>","email":"<email>","password":"<password>","administrador":"<administrador>"}
    When method PUT
    Then status 201
    And print response
    * match response == consulta201
    Examples:
      | caso_prueba                | nome                  | email                  | password | administrador | _id              |
      | Usuario registrado con PUT | Nuevo usuario con PUT | nuevoUsuario@qa.com.br | prueba   | true          | 1234567890123456 |

  Scenario Outline: Caso 03 - Código HTTP 400 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev'
    And path 'usuarios', '<_id>'
    And request {"nome":"<nome>","email":"<email>","password":"<password>","administrador":"<administrador>"}
    When method PUT
    Then status 400
    And print response
    * match response == consulta400_1
    Examples:
      | caso_prueba                              | nome                      | email                  | password | administrador | _id              |
      | ID existente, pero email de otro usuario | Itento de edición con PUT | nuevoUsuario@qa.com.br | prueba   | true          | CajWsmMp6OvFUszQ |
