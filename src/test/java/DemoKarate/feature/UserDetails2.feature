
Feature: Check users list and Update the first user name with the last user

  Background:


    * header Accept = 'application/json'

    * def response_expected = read('../utils/result2.json')
    * def feature = read('UserDetails.feature@smoke')
    * def finalresult = call feature

  Scenario: UserDetails2 - Get the userdetails of id 3
    Given url sourceurl
    Given path '/3'
    #sourceurl from karate-config.js
    When method GET
    Then status 200
    And match response == response_expected[1]
    Then print 'From different featurefile result',response
    * def firstname = finalresult.response.data.first_name
    Then print 'Firstname Userdetails id 2 is',firstname

    #* def response = { success: true }
    #* if (response.success) karate.abort()

    #* print 'this will not be printed'