@ignore
Feature: API Authentication

  Background:
    * url 'https://reqres.in/api/register'

    Scenario: UserDetailsAuthentication - Generate Authentication Token

      And form field email = 'eve.holt@reqres.in',
      And form field password = 'pistol'
      When method post
      Then status 200
      Then print 'Token Id is', response

      * def accessToken = response.token
      Then print 'Access Token is',accessToken

#  Background:
#    * url 'https://reqres.in/api/'
#
#  Scenario: Generate Authentication Token
#    * def params =
#       """
#       'email':'#(email)',
#       'password':'#(password)'
#       """
#    When path 'oauth/token'
#    And form field grant_type = 'client_credentials'
#    And form fields params
#    When method post
#    Then status 200
#    Then print 'Token Id is', response
#
#    * def accessToken = response.token
#    Then print 'Access Token is',accessToken