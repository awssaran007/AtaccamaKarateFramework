@common-scenario
Feature: validates the common features of an api response

Background:
  * def operationURL = opURL


  Scenario: Validate response schema
 #Validate response schema '
    Given url operationURL
    And param val1 = '3'
    And param val2 = '4'
    When method get
    Then status 200
    And match response == {result:#number}


  Scenario: Validate url is invalid
 #Validate url is invalid'
    Given url operationURL  +'tion'
    When method get
    Then status 404


  Scenario: Validate two mandatory operands - not providing both operand - should return bad request
  #Validate two mandatory operands - not providing both the operands - should return bad request'
    Given url operationURL
    When method get
    Then status 400


  Scenario: Validate two mandatory operands - not providing first operand - should return bad request

   #Validate two mandatory operands - not providing first operand - should return bad request'
    Given url operationURL
    And param val1 = 4
    When method get
    Then status 400


  Scenario: Validate two mandatory operands - not providing second operand - should return bad request'
  #Validate two mandatory operands - not providing second operand - should return bad request'
    Given url operationURL
    And param val2 = 5
    When method get
    Then status 400


  Scenario Outline: Validate <datatype> are not allowed as operands
    # Validate datatype are not allowed as operands
    Given url operationURL
    And param val1 = <operand1>
    And param val2 = <operand2>
    When method get
    Then status 400

    Examples:
      |operand1|operand2|datatype|
      |   3.8  |  4     | float  |
      |   "a"  |  5     | string |
      |   " "  |  " "   | empty  |
      |   "+"  |  "+"   | special|



  Scenario: Validate additional values as query parameters are not allowed
   # 'Validate additional values as query parameters are not allowed'
    Given url operationURL
    And param val1 = '6'
    And param val2 = '6'
    And param val3 = '7'
    When method get
    Then status 400


  Scenario: Validate redundant values as query parameters are not allowed
   # 'Validate redundant values as query parameters are not allowed'
    Given url operationURL
    And param val1 = '6'
    And param val2 = '6'
    And param val2 = '7'
    When method get
    Then status 400







