@ignore

  
Feature: Connection to Database

  Background:
    # use jdbc to validate
    * def config = { username: 'dw_user', password: 'Welcome1!', url: 'jdbc:oracle:thin:@10.188.193.183:1521:INFADB', driverClassName: 'oracle.jdbc.driver.OracleDriver' }
    * def DbUtils = Java.type('DemoKarate.feature.DbUtils')
    * def db = new DbUtils(config)

    Scenario:

      * def employees = db.readRows("select * from B_EMP")
       #select sal from B_EMP where ENAME = 'BOLT'
      * print 'DB employees list', employees
      * match employees[*].ENAME contains 'STARC'

#      * def insertNewEmployee = db.insertRows("insert into B_EMP (ENAME,ENO,LOC,SAL,DNO) values('Suresh',2188,'IND',100000,414-1)")
#      * def employees = db.readRows("select * from B_EMP")
#      * print 'DB employees list', employees
