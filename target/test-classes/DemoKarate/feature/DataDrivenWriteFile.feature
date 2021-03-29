Feature: DataDriven write data to external file

  Background:
    * url 'https://reqres.in'

    Scenario: DataDrivenWriteFile - Export API response to text file
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
      if(arg[i].id == 8){
       return arg[i]
      }
     }
    }
    """
      * def userDetails = call callFunction data
      #Then print 'My userDetails', userDetails
      * def javaDemo = Java.type('DemoKarate.feature.writeDataToFile')
      * def result = javaDemo.writeData(userDetails)
