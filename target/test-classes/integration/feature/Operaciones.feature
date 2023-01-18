@get
Feature: Consulta Operaciones

	@operaciones		
  Scenario: Operaciones codigo 186 
    Given url 'https://srv-operaciones-120-operaciones.apps.ocp-qa.bice.local/operaciones/pendientes/v1/935%2C800%2C810%2C186/ZUHI-Pi0/Mah-KnEF?fechaFinal=2021-08-30&fechaInicial=2021-08-24'           
    And header Accept = '*/*'
    When method Get
    Then status 200
    And match response.listaOperaciones[0].codigoServicio == 186