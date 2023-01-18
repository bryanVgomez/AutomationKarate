@get
Feature: Genera Token
	
	Background: Define URL 
			Given url 'https://bice-qa.apigee.net'
			
  Scenario: GeneraToken
    Given path '/edgemicro-auth/token'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And header x-rut-cliente = '0126415265|0085193333'
    And header x-rut-usuario = '0126415265'
    And header Authorization = 'Basic QVg1eXhzQ3ZHM3k0TVdHbkFSaHZrMXFUQUxBMWpFcXY6Vk9NYjFJeGtvb0VVc093Tw=='
    When method Post
    Then status 200