# AtaccamaKarateFramework
This framework is based on Karate DSL which is performing testing on the REST API as provided in the application.

#####Few repository related guidelines -

1. Java version should be 1.8 and above.

2. Use intellij for the effortless working.

3. git clone the repository and perform maven clean install to download the karate related dependencies.

4. Also look for the Project SDK is 1.8 and above.

5. ****** To run a feature file src/test/java/runner/FeatureRunner.runner file is used*******

  a) if run button against Test method testRunner() is active that means Karate is installed correctly.
  
  b) To run  a particular feature file-
  
    i)  using the tag, update the tag in this line -  Runner.path("classpath:features").tags("@addition").parallel(5);
    
    ii) using the feature name, update file name in the path method - Runner.path("classpath:features/ValidateAdditionGetAPI.feature").parallel(5);






#####Few project structure related guidelines -


1. The validation scenarios as per each operation are provided in their corresponding feature file.
eg: Addition via GET api - ValidateAdditionGetAPI.feature
    Addition via POST api - ValidateAdditionPOSTAPI.feature
    
2. Each feature file is tagged as per it's operation eg> "@addition" for  ValidateAdditionGetAPI.feature and ValidateAdditionPOSTAPI.feature 

3. There are a few scenarios which are performing the field level and structural level testing and is common for all the operations. Such scenarios are encapsulated 
   in CommonValidationsViaGet.feature and CommonValidationsViaPost.feature
   These features are called by each main feature file i.e. ValidateAdditionGetAPI.feature in the first scenario.
   
4. The input data is been kept in a seperate folder src/test/java/resources/InputTestData.json. This is been used by all the feature files commonly.

5. The reports are generated in the target folder eg> html report for ValidateAdditionGetAPI.feature 
"target/surefire-reports/features.ValidateAdditionPOSTAPI.html"
