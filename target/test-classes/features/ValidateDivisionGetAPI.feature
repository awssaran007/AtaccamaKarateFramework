@division
Feature:Validate division

  Background:
    * def operationURL = baseUrl + '/divide'
    * def testDataInput = read('classpath:'+'resources/InputTestData.json')
    * def performDivision =  function(op1,op2){return Math.floor(op1/op2) }


  @common-scenarios
  Scenario: Validate common scenarios for division via get call
    * call read('classpath:features/commons/CommonValidationsViaGet.feature') {opURL:'#(operationURL)'}


  Scenario: Validate division with two int values (happy path)
    Given url operationURL
    And param val1 = testDataInput[0].operand1
    And param val2 = testDataInput[0].operand2
    When method get
    Then status 200
    Then print response
    And match $.result == performDivision(testDataInput[0].operand1,testDataInput[0].operand2)


  Scenario: Validate division with two negative values
    Given url operationURL
    And param val1 = testDataInput[1].operand1
    And param val2 = testDataInput[1].operand2
    When method get
    Then status 200
    And match $.result == performDivision(testDataInput[1].operand1,testDataInput[1].operand2)

  Scenario: Validate division with one positive and negative values
    Given url operationURL
    And param val1 = testDataInput[1].operand1
    And param val2 = testDataInput[0].operand2
    When method get
    Then status 200
    And match $.result == performDivision(testDataInput[1].operand1,testDataInput[0].operand2)


  @bugs-scenario
  Scenario: Validate division with zero
    Given url operationURL
    And param val1 = testDataInput[1].operand1
    And param val2 = 0
    When method get
    Then status 200
    And match $.result == performDivision(testDataInput[1].operand1,testDataInput[1].operand2)


