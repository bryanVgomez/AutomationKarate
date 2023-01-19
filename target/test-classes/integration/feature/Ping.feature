@FuncionalidadPing @todo
Feature: Casos de prueba para validar funcionalidad de ping
	
	Background: Config feature
			Given url urlBase

  @SCN_25 @ping
  Scenario: Codigo de respuesta HTTP 200  ok
    Given path 'ping'
    When method get
    Then status 201
    And match response == 'Created'