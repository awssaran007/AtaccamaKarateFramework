@multiplication
Feature: Validate multiplication

  Background:
    * def operationURL = baseUrl + '/multiply'
    * def testDataInput = read('classpath:'+'resources/InputTestData.json')
    * def performMultiplication = function(op1,op2){return op1 * op2}


  @common-scenarios
  Scenario: Validate common scenarios for multiplication via get call
    * call read('classpath:features/commons/CommonValidationsViaGet.feature') {opURL:'#(operationURL)'}


  Scenario: Validate multiplication with two int values (happy path)
    Given url operationURL
    And param val1 = testDataInput[0].operand1
    And param val2 = testDataInput[0].operand2
    When method get
    Then status 200
    Then print response
    And match $.result == performMultiplication(testDataInput[0].operand1,testDataInput[0].operand2)


  Scenario: Validate multiplication with two negative values
    Given url operationURL
    And param val1 = testDataInput[1].operand1
    And param val2 = testDataInput[1].operand2
    When method get
    Then status 200
    And match $.result == performMultiplication(testDataInput[1].operand1,testDataInput[1].operand2)


  Scenario: Validate multiplication with zero
    Given url operationURL
    And param val1 = testDataInput[1].operand1
    And param val2 = 0
    When method get
    Then status 200
    And match $.result == performMultiplication(testDataInput[1].operand1,0)


  Scenario Outline: Validate idempotency of the api - returns same result every time #<loop>
    Given url operationURL
    And param val1 = <operand1>
    And param val2 = <operand2>
    When method get
    Then status 200
    And match $.result == performMultiplication(<operand1>,<operand2>)


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