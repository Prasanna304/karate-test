@testpost
Feature: Test demo API 1

  Background: 
    * url baseURL
    * header Accept = 'application/json'

  Scenario: Run a sample Post API
    Given print name

  Scenario: Run a sample Get API 1
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200

  @testget2
  Scenario: Run a sample Get API 2
    Given path '/users?page=1'
    When method GET
    Then status 404
    And print response
