@addition
Feature: Validate addition

  Background:
    * def operationURL = baseUrl + '/add'
    * def testDataInput = read('classpath:'+'resources/InputTestData.json')
    * def performAdd = function(op1,op2){return op1 + op2}


  @common-scenarios
  Scenario: Validate common scenarios for addition via get call
    * call read('classpath:features/commons/CommonValidationsViaGet.feature') {opURL:'#(operationURL)'}



  Scenario: Validate addition with two int values (happy path)
    Given url operationURL
    And param val1 = testDataInput[0].operand1
    And param val2 = testDataInput[0].operand2
    When method get
    Then status 200
    Then print response
    And match $.result == performAdd(testDataInput[0].operand1,testDataInput[0].operand2)


  Scenario: Validate addition with two negative values
    Given url operationURL
    And param val1 = testDataInput[1].operand1
    And param val2 = testDataInput[1].operand2
    When method get
    Then status 200
    And match $.result == performAdd(testDataInput[1].operand1,testDataInput[1].operand2)


  Scenario: Validate addition with ONE negative and ONE Positive value
    Given url operationURL
    And param val1 = testDataInput[0].operand1
    And param val2 = testDataInput[1].operand2
    When method get
    Then status 200
    And match $.result == performAdd(testDataInput[0].operand1,testDataInput[1].operand2)

