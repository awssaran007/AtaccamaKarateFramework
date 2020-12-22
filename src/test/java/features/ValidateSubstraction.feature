@subtraction
Feature: Validate subtraction

  Background:
    * def operationURL = 'http://localhost:8080/qa_testCalc_java11/restWS/subtract'
    * def testDataInput = read('classpath:'+'resources/data/InputTestData.json')
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


