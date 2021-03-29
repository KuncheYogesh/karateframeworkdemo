@ignore
Feature: Call Function for Array list

  Scenario: CallFunction - Call specific userDetails in array list

    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    #Then print 'List of UserDetails', response
    * def data = response.data
    Then print 'List of Data UserDetails', data
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
