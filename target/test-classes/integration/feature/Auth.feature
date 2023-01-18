@get
Feature: Casos de prueba para validar funcionalidad de AUTH
	
	Background: Config feature
			Given url urlBase
      * def username = "admin"
      * def password = "password123"

  @mutual-fund-document @auth
  Scenario: Codigo de respuesta HTTP 200  ok
    Given path 'auth'
    And request {"username":'#(username)',"password":'#(password)'}
    #And def reqToken = call token {'rut':'#(rut)'}
    When method post
    Then status 200




  Scenario: RUT CORRECT
    Given path 'finanzas-personales/categorias/v1', ''
    And header Accept = 'application/json'
    And header x-rut-usuario = '126415265'
    When method Get
    Then status 200
    And match response.estado.codEstado == "0"
    And match response.estado.glsEstado == "Operacion Exitosa."