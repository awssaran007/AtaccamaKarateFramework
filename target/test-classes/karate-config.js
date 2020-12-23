function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	myVarName: 'someValue',
	baseUrl : ''
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'qa') {
    config.baseUrl = "http://localhost:8080/qa_testCalc_java11/restWS"

  }
  return config;
}