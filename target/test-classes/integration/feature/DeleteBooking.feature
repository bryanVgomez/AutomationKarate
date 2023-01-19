@FuncionalidadDelete @todo
Feature: Casos de prueba para validar funcionalidad de delete Booking
	
	Background: Config feature
      Given url urlBase
      * def tokenLlamada = callonce read('classpath:integration/feature/Auth.feature@step')
      * def token = tokenLlamada.token
      * print token
      * def idBookingLlamada = callonce read('classpath:integration/feature/GetBooking.feature@step')
      * def idBooking = idBookingLlamada.idBooking
      * print idBooking

  @SCN_21 @DeleteBooking
  Scenario: Codigo de respuesta HTTP 201 created
    Given path 'booking', idBooking
    And header Accept = '*/*'
    And header cookie = 'token=' + token
    When method delete
    Then status 201
    And match response == 'Created'

  @SCN_22 @DeleteBooking
  Scenario: cuerpo de la solicitud no es nulo.
    Given path 'booking', idBooking
    And header Accept = '*/*'
    And header cookie = 'token=' + token
    When method delete
    Then match response == '#notnull'

  @SCN_23 @DeleteBooking
  Scenario: Codigo de respuesta HTTP 403
    Given path 'booking', idBooking
    And header Accept = '*/*'
    And header cookie = 'token=' + 123
    When method delete
    Then status 403
    And match response == 'Forbidden'

  @SCN_24 @DeleteBooking
  Scenario: Codigo de respuesta HTTP 201 created
    Given path 'booking/522222222'
    And header Accept = '*/*'
    And header cookie = 'token=' + token
    When method delete
    Then status 405
    And match response == 'Method Not Allowed'