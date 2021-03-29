@ignore
Feature: E2E test flow of user details

  Background:
       * url 'https://reqres.in'
    * def requestpayload = read('../utils/Userdetails.json')
    * header Content-Type = 'application/json'

  Scenario: E2ETestFlow - User details

    Given path '/api/users'
    And param page = '2'
    When method GET
    Then status 200
    #* print 'List of userDetails', response
    * def data = response.data
    Then print 'List of UserDetails', data
    * def callFunction =
    """
    function(arg){
     for(i=0; i<arg.length; i++){
      if(arg[i].id == 9){
       return arg[i]
      }
     }
    }
    """
    * def userDetails = call callFunction data
    Then print 'My userDetails', userDetails
    * def firstname1 = userDetails.first_name
    Then print 'My Firstname', firstname1
    And match firstname1 == 'Tobias'

    Given path '/api/users'
    And request requestpayload
    When method POST
    Then status 201
    * print 'Created User details', response
     * def generatedID = response.id
    * print 'ID created for New user', generatedID

    Given path '/api/users/'+ generatedID +''
    And request {"name":"yogesh","job":"AutomationKarateAPI"}
    When method PUT
    Then status 200
    Then print 'Updated Job details', response
    * def putResponse = response

    Given path '/api/users/'+ generatedID +''
    And request putResponse
    When method DELETE
    Then status 204
