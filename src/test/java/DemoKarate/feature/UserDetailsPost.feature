
Feature: Post user details

  Background:
    * def requestpayload = read('../utils/Userdetails.json')
    * header Content-Type = 'application/json'

    Scenario: UserDetailsPost - Post UserDetails to fetch ID's
      Given url 'https://reqres.in/api/users'
      And request requestpayload
      And param delay = 5
      When method post
      Then status 400
      Then print 'Response ID', response