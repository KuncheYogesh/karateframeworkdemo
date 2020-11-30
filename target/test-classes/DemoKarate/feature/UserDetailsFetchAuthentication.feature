@ignore
Feature: Fetch Authentication Token

  Background:
    * def Authentication = read('UserDetailsAuthentication.feature'){email:'eve.holt@reqres.in',password:'pistol'}
    * def authToken = Authentication.accessToken

    Scenario: Post call with Authentication

      When url 'https://reqres.in/api/users'
      And header Authorization = authToken
      And request requestpayload //request json payload to call from different feature file.
      When method post
      Then status 200