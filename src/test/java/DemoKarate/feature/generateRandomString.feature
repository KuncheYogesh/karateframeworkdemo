
Feature: Generate random string function
  Background:
    * header Content-Type = 'application/json'

  Scenario: Using string in request
    * def random_string =
    """
    function(s) {
        var text = "";
        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        for (var i = 0; i < s; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));
        return text;
    }
    """
    * def string =  random_string(5)
    * match string == '#string'
    * print 'Random string generated',string

    Given url 'https://reqres.in/api/users'
    And request { name: '#(string)', job: 'Automation', company: 'TEK' }
    And param delay = 2
    When method post
    Then status 20
    Then print 'Response ID', response
    * def responseID = response.id
    * print 'Response ID generated for request is ',responseID
