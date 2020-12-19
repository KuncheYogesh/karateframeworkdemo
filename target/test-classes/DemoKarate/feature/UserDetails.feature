@ignore
Feature: Check users list and Update the first user name with the last user

  Background:

    * url 'https://reqres.in'
    * header Accept = 'application/json'
    * def response_expected = read('../utils/result2.json')

@smoke
  Scenario: Get the userdetails of id 2
    Given path '/api/users/2'
    When method GET
    Then status 200
    Then print 'Users from the GET API', response_expected[0]
    And match response == response_expected[0]
    And match response.data.first_name == 'Janet'
    And match response.data.last_name != null

    * def designation = response.data.designation
    And match designation == null

@regression
  Scenario: Get the userdetails of id 4
    Given path '/api/users/4'
    When method GET
    Then status 200
    Then print 'Userdetails id 4 is', response_expected[2]
    And match response == response_expected[2]
    And match response.data.first_name == 'Eve'

