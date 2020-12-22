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


  Scenario: Validate two mandatory operands - not providing one operand - should return bad request
  #Validate two mandatory operands - not providing both the operands - should return bad request'
    Given url operationURL
    When method get
    Then status 404



  Scenario: Validate two mandatory operands - not providing one operand - should return bad request
   #Validate two mandatory operands - not providing one operand - should return bad request'
    Given url operationURL
    And param val1 = 4
    When method get
    Then status 404


  Scenario: Validate two mandatory operands - not providing one operand - should return bad request
  #Validate two mandatory operands - not providing one operand - should return bad request'
    Given url operationURL
    And param val2 = 5
    When method get
    Then status 404


  Scenario: validate float values are not allowed as operands
    #validate float values are not allowed as operands
    Given url operationURL
    And param val1 = '3'
    And param val2 = '4.9'
    When method get
    Then status 404


   Scenario: Validate string values are not allowed as operands
    #Validate string values are not allowed as operands
    Given url operationURL
    And param val1 = 'a'
    And param val2 = '4.9'
    When method get
    Then status 400


  @bugs-scenario
  Scenario: validate redundant values as query parameters are not allowed
   # 'Validate redundant values as query parameters are not allowed'
    Given url operationURL
    And param val1 = '6'
    And param val2 = '6'
    And param val2 = '8'
    And param val3 = '7'
    When method get
    Then status 404

  @bugs-scenario
  Scenario: Validate empty values cannot be provided
   # Validate empty values cannot be provided
    Given url operationURL
    And param val1 = ''
    And param val2 = ''
    When method get
    Then status 404
