@testget
Feature: get demo API

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Run a sample Get API 1
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200

  @testget2
  Scenario: Run a sample Get API 2
    Given path '/users?page=1'
    When method GET
    Then status 200
    And print response
    
    @testget3
  Scenario: Run a sample Get API 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    