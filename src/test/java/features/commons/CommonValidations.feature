@common-scenario
Feature: validates the common features of an api response

  Background:
    * def operationURL =  operationURL
  

  Scenario: Validate url is invalid
    
    Given url operationURL
    #And param val1 =
    #And param val2 =
    When method get
    Then status 404


  Scenario: Validate two mandatory operands - not providing one operand - should return bad request

    Given url operationURL
    #And param val1 =
    #And param val2 =
    When method get
    Then status 400

    Given url operationURL
    And param val1 = 4
    #And param val2 =
    When method get
    Then status 400

    Given url operationURL
    #And param val1 = 4
    And param val2 = 5
    When method get
    Then status 400
    
    
      #common scenario
  Scenario: validate float values are not allowed as operands
    Given url operationURL
    And param val1 = '3'
    And param val2 = '4.9'
    When method get
    Then status 400



#common scenario
  Scenario: add redundant values
    Given url operationURL
    And param val1 = '6'
    And param val2 = '6'
    And param val2 = '8'
    And param val3 = '7'
    When method get
    Then status 404


    #null values
  Scenario: validate no empty values are provided
    Given url operationURL
    And param val1 = ''
    And param val2 = ''
    When method get
    Then status 404
