## My approach towards testing the Ataccama Calculator
---
###Technology used
1. Karate DSL used for REST API testing, as API testing can help us perform far more indepth negative testing than UI.
2. Approach to testing is broadly categorised into two parts - Positive areas and negative areas

| **Positive areas**          |**Description**                                                           |
|-----------------------------| -------------------------------------------------------------------------|
| Broadly includesHappy       | 1. Operation with two positive values.                                   |
| path scenarios              | 2. Operation with positive and negative values.                          |
| idempotency                 | 3. Operation produces same result when called over again and again.
---
| **Negative Scenarios**      |**Description**                                                           |
|-----------------------------|--------------------------------------------------------------------------|
|**Schema validation**        | 1. Response schema returns all mandatory fields.                         | 
|                             | 2. Mandatory request parameters are provided. i.e not null, not empty.   |
|**Illegal values**           | 1. Operation with Invalid data types eg: float, string, Sp chars         |
|                             | 2. More than two parameters whether redundant or additional.             |
|                             | 3.When operation  is null  or invalid i.e other than the provided four.  |
|**Operation specific edge    | 1. Division and Multiplication with zero                                 |               
| cases**                     |                                                                          |
---

- There is a feature file for each operation viz. addition, subtraction, multiplication adn division.
- Validations are done seperately for POST and Get calls
- The scenario category of schema validation and illegal values are commmon for all the operations hence, I have abstracted them in one common file viz.
  **commons/CommonValidationsViaGet.feature**
  **commons/CommonValidationsViaPost.feature** 
- These features are called by each opearation specific features once - **ValidateAdditionGetAPI.feature , "ValidateAdditionPOSTAPI.feature"** etc
