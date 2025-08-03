Feature:
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar un usuario de la base de datos de usuarios por ID.

  Background:
    And def consulta200_3 = read('classpath:schema/cosultaUsuario/consulta200_3.json')
    And def consulta400_4 = read('classpath:schema/cosultaUsuario/consulta400_4.json')
    And def consulta400_5 = read('classpath:schema/cosultaUsuario/consulta400_5.json')

  Scenario Outline: Caso 01 - Código HTTP 200 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev'
    And path 'usuarios', '<_id>'
    When method GET
    Then status 200
    And print response
    * match response == consulta200_3
    Examples:
      | caso_prueba            | _id              |
      | Obtener usuario por id | 0uxuPY0cbmQhpEz1 |

  Scenario Outline: Caso 02 - Código HTTP 400 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev'
    And path 'usuarios', '<_id>'
    When method GET
    Then status 400
    And print response
    * match response == consulta400_4
    Examples:
      | caso_prueba                             | _id              |
      | ID no tiene 16 caracteres alfanuméricos | 0000             |
      | ID con 16 caracteres pero un @          | 123456789012345@ |
      | ID con 16 caracteres pero un #          | 123456789012345# |
      | ID con 16 caracteres pero un *          | 123456789012345* |
      | ID con 16 caracteres pero un &          | 123456789012345& |

  Scenario Outline: Caso 01 - Código HTTP 400 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev'
    And path 'usuarios', '<_id>'
    When method GET
    Then status 400
    And print response
    * match response == consulta400_5
    Examples:
      | caso_prueba           | _id              |
      | Usuario no encontrado | 1234567890123456 |
