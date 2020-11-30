@ignore
Feature: Get incidents from ServiceNow page

  Scenario: Incidents using GET call

    Given url 'https://dev104182.service-now.com/'
    And header Authorization = call read('basic-auth.js') { username: 'admin', password: '4MmKydVbL6Hs' }
    And path 'api/now/table/incident'
    And params {"sysparm_limit":"1", "sysparm_fields":"number,sys_id,category"}
    When method GET
    Then status 200
    And print 'Incident Details',response
    * def resultone = response
    * print 'Response', resultone.result[0].category
    And match resultone.result[0].category == 'inquiry'



