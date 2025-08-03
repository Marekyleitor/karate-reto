Feature:
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar el listado de la base de datos de usuarios.

  Background:
    And def schema200 = read('classpath:schema/cosultaUsuario/consulta200.json')
    And def usuarioSchema = read('classpath:schema/cosultaUsuario/usuarioSchema.json')
    And def consulta200_1 = read('classpath:schema/cosultaUsuario/consulta200_1.json')
    And def consulta200_2 = read('classpath:schema/cosultaUsuario/consulta200_2.json')
    And def consulta400 = read('classpath:schema/cosultaUsuario/consulta400.json')

  Scenario: Caso 01 - Código HTTP 200 - Listar todos los usuarios del sistema
    Given url 'https://serverest.dev/usuarios'
    #And request {"nome":"QA Test","email":"qatest123@example.com","password":"123456","administrador":"true"}
    When method GET
    Then status 200
    And print response
    * match response == schema200

  Scenario Outline: Caso 02 - Código HTTP 200 - Listar todos los usuarios del sistema por correo <caso_prueba>
    Given url 'https://serverest.dev/usuarios'
    And params {"email": '<correo>'}
    When method GET
    Then status 200
    And print response
    * match response == consulta200_1
    * def validoEstado = function(response) {var codes = response.usuarios.map(x => x.administrador);return codes.every(code => code === '<estado_administrador>');}
    * assert validoEstado(response)
    Examples:
      | caso_prueba            | correo           | estado_administrador |
      | Email con status true  | fulano@qa.com    | true                 |
      | Email con status false | novo@usuario.com | false                |

  Scenario Outline: Caso 03 - Código HTTP 200 - Listar todos los usuarios del sistema por nombre <caso_prueba>
    Given url 'https://serverest.dev/usuarios'
    And params {"nome": '<nombre>'}
    When method GET
    Then status 200
    And print response
    * match response == schema200
    * def validoEstado = function(response) {var codes = response.usuarios.map(x => x.administrador);return codes.every(code => code === '<estado_administrador>');}
    * assert validoEstado(response)
    Examples:
      | caso_prueba             | nombre          | estado_administrador |
      | Nombre con status true  | Fulano da Silva | true                 |
      | Nombre con status false | Alex            | false                |

  Scenario Outline: Caso 04 - Código HTTP 200 - Consulta de usuario sin data registrada <caso_prueba>
    Given url 'https://serverest.dev/usuarios'
    And params {"nome": '<nombre>'}
    When method GET
    Then status 200
    And print response
    * match response == consulta200_2
    Examples:
      | caso_prueba           | nombre  |
      | Usuario no registrado | Fulanox |

  Scenario Outline: Caso 05 - Código HTTP 400 - Error al enviar parámetros no válidos <caso_prueba>
    Given url 'https://serverest.dev/usuarios'
    And params {"nomex": "<nombre>"}
    When method GET
    Then status 400
    And print response
    * match response == consulta400
    And match response.nomex contains "nomex não é permitido"
    Examples:
      | caso_prueba                   | nombre  |
      | Envio de parámetro no válidos | Fulanox |
