@common-scenario
Feature: validates the common features of an api response

 Background:
  * def baseUrlCompute = baseUrl +'/compute'
  



  Scenario: Validate response schema
  #Validate response schema '
    Given url baseUrlCompute
    * payLoadReq.val1 = 3
    * payLoadReq.val2 = 4
    * print payLoadReq
    And request payLoadReq
    When method post
    Then status 200
    And match response == {result:#number}


  Scenario: Validate url if is invalid'
    Given url baseUrlCompute  +'tion'
    * payLoadReq.val1 = 3
    * payLoadReq.val2 = 4
    * print payLoadReq
    And request payLoadReq
    When method post
    Then status 404


  @bugs-scenario
  Scenario Outline: Validate request body parameters
   #Validate two mandatory operands - not providing any parameter - should return bad request
    Given url baseUrlCompute
    And request {}
    When method post
    * print payLoadReq
    Then status 500


   #Validate two mandatory operands - providing just first operand - should return bad request'
    Given url baseUrlCompute
    * payLoadReq.val1 = <operand1>
    * print payLoadReq
    And request payLoadReq
    When method post
    Then status 404


    #Validate two mandatory operands - providing just second operand - should return bad request'
    Given url baseUrlCompute
    * payLoadReq.val2 = <operand2>
    * print payLoadReq
    And request payLoadReq
    When method post
    Then status 404


    Examples:
      |operand1 |operand2 |
      |     3   |    4    |


  @bug-scenario
  Scenario Outline: Validate data type <datatype> are not allowed
   #Validate data type other than int values are not allowed
    Given url baseUrlCompute
    * payLoadReq.val1 = <operand1>
    * payLoadReq.val2 = <operand2>
    * print payLoadReq
    And request payLoadReq
    When method post
    Then status 400


    Examples:
      |operand1|operand2|datatype|
      |    3.8 |  4.9   | float  |
      |   "a"  |  5     | string |
      |   " "  |  " "   | empty  |

  @bugs-scenario
  Scenario: Validate redundant values as query parameters are not allowed
   # 'Validate redundant values as query parameters are not allowed'
    Given url baseUrlCompute
    * payLoadReq.val1 = 3
    * payLoadReq.val2 = 4
    * payLoadReq.val2 = 7
    * print payLoadReq
    And request payLoadReq
    When method post
    Then status 404


  Scenario: Validate incorrect operation is provided
   # Validate incorrect operation
    Given url baseUrlCompute
    * payLoadReq.val1 = 3
    * payLoadReq.val2 = 4
    * payLoadReq.operation = "mod"
    * print payLoadReq
    And request payLoadReq
    When method post
    * match response contains 'Unknown operation: mod'

  Scenario: Validate operation as null is provided
   # Validate incorrect operation
    Given url baseUrlCompute
    * payLoadReq.val1 = 3
    * payLoadReq.val2 = 4
    * payLoadReq.operation = null
    * print payLoadReq
    And request payLoadReq
    When method post
  * match response contains 'Operation must not be null!'



