@ignore
Feature: E2E testing

  Background:
    * url 'https://reqres.in/'

    Scenario Outline: DataDrivenTesting - Create UserDetails ID's
      Given path 'api/users'
      * request {"name":<name>,"salary":<salary>,"age":<age>}
      When method POST
      Then status 201
      Then print 'print UserDetails',response
      * def userDetailsID = response

#      Given path 'api/v1/employee/'+ userDetailsID.data.id
#      When method GET
#      Then status 200
#      Then print 'Print User ID',response
#      And match response.data contains {id:'#(userDetailsID.data.id)'}


      Examples:
      |read('DataDrivenTest.csv')|