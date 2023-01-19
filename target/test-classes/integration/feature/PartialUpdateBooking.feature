@FuncionalidadPartialUpdate @todo
Feature: Casos de prueba para validar funcionalidad de update partial Booking
	
	Background: Config feature
      Given url urlBase
      * def tokenLlamada = callonce read('classpath:integration/feature/Auth.feature@step')
      * def token = tokenLlamada.token
      * print token

  @SCN_17 @PartialUpdateBooking
  Scenario: Codigo de respuesta HTTP 200  ok
    Given path 'booking/2'
    And header Accept = '*/*'
    And header cookie = 'token=' + token
    And request {"firstname": "bryan", "lastname": "vasquez"}
    When method patch
    Then status 200

  @SCN_18 @PartialUpdateBooking
  Scenario: cuerpo de la solicitud no es nulo.
    Given path 'booking/2'
    And header Accept = '*/*'
    And header cookie = 'token=' + token
    And request {"firstname": "bryan", "lastname": "vasquez"}
    When method patch
    Then match response[*] == '#notnull'

  @SCN_19 @PartialUpdateBooking
  Scenario: Validacion de schema
    * def schema = {"firstname": "#string", "lastname": "#string","totalprice": "#number", "depositpaid": "#boolean", "bookingdates": "#object", "additionalneeds": "#string"}
    * def schemaObject = {"checkin": "#string", "checkout": "#string"}
    Given path 'booking/2'
    And header Accept = '*/*'
    And header cookie = 'token=' + token
    And request {"firstname": "bryan", "lastname": "vasquez"}
    When method patch
    And match response == schema
    And match response.bookingdates == schemaObject

  @SCN_20 @PartialUpdateBooking
  Scenario: Codigo de respuesta HTTP 403
    Given path 'booking/2'
    And header Accept = '*/*'
    And header cookie = 'token=' + 123
    And request {"firstname": "bryan", "lastname": "vasquez"}
    When method patch
    Then status 403
    And match response == 'Forbidden'