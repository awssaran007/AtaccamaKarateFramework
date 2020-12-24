@subtraction
Feature: Validate subtraction

  Background:
    * def operationURL = baseUrl + '/subtract'
    * def testDataInput = read('classpath:'+'resources/InputTestData.json')
    * def performSubtraction = function(op1,op2){return op1 - op2}


  @common-scenarios
  Scenario: Validate common scenarios for subtraction via get call
    * call read('classpath:features/commons/CommonValidationsViaGet.feature') {opURL:'#(operationURL)'}



  Scenario: validate subtraction with two int values (happy path)
    Given url operationURL
    And param val1 = testDataInput[0].operand1
    And param val2 = testDataInput[0].operand2
    When method get
    Then status 200
    Then print response
    And match $.result == performSubtraction(testDataInput[0].operand1,testDataInput[0].operand2)


  Scenario: validate subtraction with two negative values
    Given url operationURL
    And param val1 = testDataInput[1].operand1
    And param val2 = testDataInput[1].operand2
    When method get
    Then status 200
    And match $.result == performSubtraction(testDataInput[1].operand1,testDataInput[1].operand2)

  Scenario: Validate addition with ONE negative and ONE Positive value
    Given url operationURL
    And param val1 = testDataInput[0].operand1
    And param val2 = testDataInput[1].operand2
    When method get
    Then status 200
    And match $.result == performSubtraction(testDataInput[0].operand1,testDataInput[1].operand2)


  Scenario Outline: Validate idempotency of the api - returns same result every time #<loop>
    Given url operationURL
    And param val1 = <operand1>
    And param val2 = <operand2>
    When method get
    Then status 200
    And match $.result == performSubtraction(<operand1>,<operand2>)

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