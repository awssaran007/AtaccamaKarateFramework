@addition
Feature: Validate addition

  Background:

    * def testDataInput = read('classpath:'+'resources/InputTestData.json')
    * def performAdd = function(op1,op2){return op1 + op2}
    * def baseUrlCompute = baseUrl + '/compute'
    * def payLoad = {}
    * payLoad.operation = "add"

  @common-scenarios
  Scenario: Validate common scenarios for addition via get call
    * call read('classpath:features/commons/CommonValidationsViaPost.feature') {payLoadReq:#(payLoad),computeURL:#(baseUrlCompute)}



  Scenario: Validate addition with two int values (happy path)
    Given url baseUrlCompute
    And payLoad.val1 = testDataInput[0].operand1
    And payLoad.val2 = testDataInput[0].operand2
    * print payLoad
    And request payLoad
    When method post
    Then status 200
    Then print response
    And match $.result == performAdd(testDataInput[0].operand1,testDataInput[0].operand2)


  Scenario: Validate addition with two negative values
    Given url baseUrlCompute
    And payLoad.val1 = testDataInput[1].operand1
    And payLoad.val2 = testDataInput[1].operand2
    And request payLoad
    When method post
    Then status 200
    And match $.result == performAdd(testDataInput[1].operand1,testDataInput[1].operand2)


  Scenario: Validate addition with ONE negative and ONE Positive value
    Given url baseUrlCompute
    And payLoad.val1 = testDataInput[0].operand1
    And payLoad.val2 = testDataInput[1].operand2
    And request payLoad
    When method post
    Then status 200
    And match $.result == performAdd(testDataInput[0].operand1,testDataInput[1].operand2)


  Scenario Outline: Validate idempotency of the api - returns same result every time #<loop>
    Given url baseUrlCompute
    And payLoad.val1 = <operand1>
    And payLoad.val2 = <operand2>
    And request payLoad
    When method post
    Then status 200
    And match $.result == performAdd(<operand1>,<operand2>)

      Examples:
      |loop|operand1                 |operand2                  |
      |1   |testDataInput[0].operand1|testDataInput[1].operand2 |
      |2   |testDataInput[0].operand1|testDataInput[1].operand2 |
      |3   |testDataInput[0].operand1|testDataInput[1].operand2 |
      |4   |testDataInput[0].operand1|testDataInput[1].operand2 |
      |5   |testDataInput[0].operand1|testDataInput[1].operand2 |
      |6   |testDataInput[0].operand1|testDataInput[1].operand2 |
      |7   |testDataInput[0].operand1|testDataInput[1].operand2 |
      |8   |testDataInput[0].operand1|testDataInput[1].operand2 |
      |9   |testDataInput[0].operand1|testDataInput[1].operand2 |
      |10  |testDataInput[0].operand1|testDataInput[1].operand2 |
