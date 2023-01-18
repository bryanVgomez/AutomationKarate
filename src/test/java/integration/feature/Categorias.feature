@get
Feature: Consulta Categorías
	
	Background: Define URL 
			Given url 'https://ms-categorias-finanzas-personales-100-srv-con.apps.ocp-qa.bice.local'
			
  Scenario: RUT CORRECT
    Given path 'finanzas-personales/categorias/v1', ''
    And header Accept = 'application/json'
    And header x-rut-usuario = '126415265'
    When method Get
    Then status 200
    And match response.estado.codEstado == "0"
    And match response.estado.glsEstado == "Operacion Exitosa."
    
  Scenario: RUT INCORRECT
    Given path 'finanzas-personales/categorias/v1', ''
    And header Accept = 'application/json'
    And header x-rut-usuario = '126415267'
    When method Get
    Then status 400
    And match response.codigo == "COD_ERR_VAL"