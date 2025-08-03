Feature:
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para eliminar un usuario de la base de datos de usuarios por ID.

  Background:
    And def consulta200_4 = read('classpath:schema/cosultaUsuario/consulta200_4.json')
    And def consulta200_5 = read('classpath:schema/cosultaUsuario/consulta200_5.json')
    And def consulta400_3 = read('classpath:schema/cosultaUsuario/consulta400_3.json')

  Scenario Outline: Caso 01 - Código HTTP 200 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev'
    And path 'usuarios', '<_id>'
    When method DELETE
    Then status 200
    And print response
    * match response == consulta200_4
    Examples:
      | caso_prueba                           | _id              |
      | Eliminación exitosa de usuario por ID | hrYmqHmtnk3Wh54U |

  Scenario Outline: Caso 02 - Código HTTP 200 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev'
    And path 'usuarios', '<_id>'
    When method DELETE
    Then status 200
    And print response
    * match response == consulta200_5
    Examples:
      | caso_prueba                                              | _id              |
      | Inexistencia del usuario en la base de datos de usuarios | hrYmqHmtnk3Wh54U |

  Scenario Outline: Caso 03 - Código HTTP 400 - Caso de Prueba <caso_prueba>
    Given url 'https://serverest.dev'
    And path 'usuarios', '<_id>'
    When method DELETE
    Then status 400
    And print response
    * match response == consulta400_3
    Examples:
      | caso_prueba                              | _id              |
      | No se puede eliminar usuario con carrito | 0uxuPY0cbmQhpEz1 |
