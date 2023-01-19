@FuncionalidadCreate @todo
Feature: Casos de prueba para validar funcionalidad de create Booking
	
	Background: Config feature
			Given url urlBase

  @SCN_09 @Createbooking
  Scenario: Codigo de respuesta HTTP 200  ok
    Given path 'booking'
    And header Accept = '*/*'
    And request {"firstname": "bryan", "lastname": "vasquez","totalprice": "1000", "depositpaid": "true","bookingdates": {"checkin": "2018-01-01", "checkout": "2019-01-01"}, "additionalneeds": "nothing"}
    When method post
    Then status 200

  @SCN_10 @Createbooking
  Scenario: cuerpo de la solicitud no es nulo.
    Given path 'booking'
    And header Accept = '*/*'
    And request {"firstname": "bryan", "lastname": "vasquez","totalprice": "1000", "depositpaid": "true","bookingdates": {"checkin": "2018-01-01", "checkout": "2019-01-01"}, "additionalneeds": "nothing"}
    When method post
    Then match response[*] == '#notnull'

  @SCN_11 @Createbooking
  Scenario: Validacion de schema
    * def schemaId = {"bookingid": "#number", "booking": "#object"}
    * def schema = {"firstname": "#string", "lastname": "#string","totalprice": "#number", "depositpaid": "#boolean", "bookingdates": "#object", "additionalneeds": "#string"}
    * def schemaObject = {"checkin": "#string", "checkout": "#string"}
    Given path 'booking'
    And header Accept = '*/*'
    And request {"firstname": "bryan", "lastname": "vasquez","totalprice": "1000", "depositpaid": "true","bookingdates": {"checkin": "2018-01-01", "checkout": "2019-01-01"}, "additionalneeds": "nothing"}
    When method post
    And match response == schemaId
    And match response.booking == schema
    And match response.booking.bookingdates == schemaObject

  @SCN_12 @Createbooking
  Scenario: Codigo de respuesta HTTP 500 internal server error
    Given path 'booking'
    And header Accept = '*/*'
    And request {"firstname": "bryan", "depositpaid": "true","bookingdates": {"checkin": "2018-01-01", "checkout": "2019-01-01"}, "additionalneeds": "nothing"}
    When method post
    Then status 500


