@FuncionalidadGet @todo
Feature: Casos de prueba para validar funcionalidad de get Booking
	
	Background: Config feature
			Given url urlBase

  @SCN_05 @booking @step
  Scenario: Codigo de respuesta HTTP 200  ok
    Given path 'booking'
    When method get
    Then status 200
    * def idBooking = response[1].bookingid
    * print idBooking

  @SCN_06 @booking
  Scenario: El cuerpo de la solicitud no es nulo.
    Given path 'booking'
    When method get
    Then match response[*] == '#notnull'

  @SCN_07 @booking
  Scenario: Validacion de schema
    * def schema = {"bookingid": "#number"}
    Given path 'booking'
    When method get
    And match response[0] == schema

  @SCN_08 @booking
  Scenario: Validacion de schema
    * def schema = {"firstname": "#string", "lastname": "#string","totalprice": "#number", "depositpaid": "#boolean", "bookingdates": "#object", "additionalneeds": "#string"}
    * def schemaObject = {"checkin": "#string", "checkout": "#string"}
    Given path 'booking/2'
    And header Accept = '*/*'
    When method get
    And match response == schema
    And match response.bookingdates == schemaObject


