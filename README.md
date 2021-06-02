# CalculatorKarateFramework
This framework is based on Karate DSL which is performing testing on the REST API as provided in the application.

## Few inital guidelines -

1. Java version should be 8 and above.

2. Use intellij for the effortless working.

3. git clone the repository and update project to download the karate related maven dependencies. 	

---
## Few project structure related guidelines -


1. The validation scenarios as per each operation(viz. Addition, Subtraction, Division, Multiplication) are provided in their corresponding feature file eg:
   folder - [src/test/java/features/]
   
	**Addition via GET api - ValidateAdditionGetAPI.feature**
    
   	**Addition via POST api - ValidateAdditionPOSTAPI.feature**
    
2. Each feature file is tagged as per it's operation eg> **@addition** for  ValidateAdditionGetAPI.feature and ValidateAdditionPOSTAPI.feature 

3. There are a few scenarios which are performing the field level and structural level testing and is common for all the operations. Such scenarios are abstracted 
   in CommonValidationsViaGet.feature and CommonValidationsViaPost.feature [folder - src/test/java/features/commons/]
   These features are called by each main feature file e.g ValidateAdditionGetAPI.feature in the first scenario. 
   
4. The functional scenarios specific to operation are enclosed in the corresponding feature file eg: ValidateAdditionGetAPI.feature.    

5. The input test data is been kept in a seperate folder **src/test/java/resources/InputTestData.json** This is been used by all the feature files commonly.

6. The reports are generated in the target folder eg> html report for ValidateAdditionGetAPI.feature 

**target/surefire-reports/features.ValidateAdditionPOSTAPI.html**

**target/surefire-reports/features.ValidateAdditionGetAPI.html**

[NOTE]- the target folder is also uploaded in this repo (in case, the html report is required directly to be fetched without running the script)

7. The defects raised are been shared here - https://github.com/awssaran007/CalculatorKarateAPIFramework/issues

---
## Few guidelines to run the script-

a) To run a feature file **src/test/java/runner/FeatureRunner.runner** file is used where the test method runs the command `Runner.path("classpath:features")`
  
b) To run a particular feature file-
  
   i)using the tag, update the tag in this line -  ` Runner.path("classpath:features").tags("@addition"); `
     tags used here are @multiplication,@addition,@subtract,@division
    
   ii)using the feature name, update file name in the path method - ` Runner.path("classpath:features/ValidateAdditionGetAPI.feature"); `


c) To run from maven use command `mvn test` - it will call the feature file.

---
For karate setting or quickstart guidance refer - https://www.youtube.com/watch?v=W-af7Cd8cMc&feature=youtu.be

In case of any questions reach out to me @kadambarisaran@gmail.com

