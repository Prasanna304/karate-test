@testpost
Feature: Test demo API 1

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def basepath = 'file:src/test/resources/com/api/post/'

  Scenario: Run a sample Post API
    * def basefilepath = basepath+'postFeature.json'
    * def inputPayload = read(basefilepath)
    * print inputPayload
    Given path '/users'
    And request inputPayload
    When method POST
    Then status 201
    And print response

  Scenario: Run a sample Post API 2
    * def basefilepath = basepath+'postFeature.json'
    * def inputPayload = read(basefilepath)
    * set inputPayload.job = 'new job'
    * print inputPayload
    * def outputBasefilepath = basepath+'postFeatureOutput.json'
    * def outputPayload = read(outputBasefilepath)
    Given path '/users'
    And request inputPayload
    When method POST
    Then status 201
    And print response
		And match response == outputPayload
		#And assert response == outputPayload -> This is not showing whats the missing in json