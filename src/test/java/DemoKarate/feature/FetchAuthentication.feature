@ignore
Feature: Fetch Authentication Token

  Background:
    * def Authentication = call read('UserDetailsAuthentication.feature')
  #{email:'eve.holt@reqres.in',password:'pistol'}
    * def authToken = Authentication.accessToken
    * def requestpayload = read('../utils/Userdetails.json')
      
    Scenario: Post call with Authentication

      When url 'https://reqres.in/api/users'
      And header Authorization = authToken
      And request requestpayload
          #request json payload to call from different feature file.
      When method post
      Then status 201
      * print 'Authentication response', response