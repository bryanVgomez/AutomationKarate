@FuncionalidadUpdate @todo
Feature: Casos de prueba para validar funcionalidad de update Booking
	
	Background: Config feature
      Given url urlBase
      * def tokenLlamada = callonce read('classpath:integration/feature/Auth.feature@step')
      * def token = tokenLlamada.token
      * print token

  @SCN_13 @UpdateBooking
  Scenario: Codigo de respuesta HTTP 200  ok
    Given path 'booking/2'
    And header Accept = '*/*'
    And header cookie = 'token=' + token
    And request {"firstname": "bryan", "lastname": "vasquez","totalprice": "1000", "depositpaid": "true","bookingdates": {"checkin": "2018-01-01", "checkout": "2019-01-01"}, "additionalneeds": "nothing"}
    When method put
    Then status 200

  @SCN_14 @UpdateBooking
  Scenario: cuerpo de la solicitud no es nulo.
    Given path 'booking/2'
    And header Accept = '*/*'
    And header cookie = 'token=' + token
    And request {"firstname": "bryan", "lastname": "vasquez","totalprice": "1000", "depositpaid": "true","bookingdates": {"checkin": "2018-01-01", "checkout": "2019-01-01"}, "additionalneeds": "nothing"}
    When method put
    Then match response[*] == '#notnull'

  @SCN_15 @Createbooking
  Scenario: Validacion de schema
    * def schema = {"firstname": "#string", "lastname": "#string","totalprice": "#number", "depositpaid": "#boolean", "bookingdates": "#object", "additionalneeds": "#string"}
    * def schemaObject = {"checkin": "#string", "checkout": "#string"}
    Given path 'booking/2'
    And header Accept = '*/*'
    And header cookie = 'token=' + token
    And request {"firstname": "bryan", "lastname": "vasquez","totalprice": "1000", "depositpaid": "true","bookingdates": {"checkin": "2018-01-01", "checkout": "2019-01-01"}, "additionalneeds": "nothing"}
    When method put
    And match response == schema
    And match response.bookingdates == schemaObject

  @SCN_16 @UpdateBooking
  Scenario: Codigo de respuesta HTTP 403
    Given path 'booking/2'
    And header Accept = '*/*'
    And header cookie = 'token=' + 1213
    And request {"firstname": "bryan", "lastname": "vasquez","totalprice": "1000", "depositpaid": "true","bookingdates": {"checkin": "2018-01-01", "checkout": "2019-01-01"}, "additionalneeds": "nothing"}
    When method put
    Then status 403
    And match response == 'Forbidden'