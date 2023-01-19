@FuncionalidadAuth @todo
Feature: Casos de prueba para validar funcionalidad de AUTH
	
	Background: Config feature
			Given url urlBase
      * def username = "admin"
      * def password = "password123"

  @SCN_01 @auth @step
  Scenario: Codigo de respuesta HTTP 200  ok
    Given path 'auth'
    And request {"username":'#(username)',"password":'#(password)'}
    When method post
    Then status 200
    * def token = response.token

  @SCN_02 @auth
  Scenario: El cuerpo de la solicitud no es nulo.
    Given path 'auth'
    And request {"username":'#(username)',"password":'#(password)'}
    When method post
    Then match response[*] == '#notnull'

  @SCN_03 @auth
  Scenario: Enviar solicitud con usuario y contraseña invalido
    Given path 'auth'
    And request {"username":'jose123',"password":'22233'}
    When method post
    Then status 200
    And match response.reason == 'Bad credentials'

  @SCN_04 @auth
  Scenario: Validacion de schema
    * def schema = {"token": "#string"}
    Given path 'auth'
    And request {"username":'#(username)',"password":'#(password)'}
    When method post
    And match response == schema
