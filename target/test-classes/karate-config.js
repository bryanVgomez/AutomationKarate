function fn() {

  karate.configure('ssl', true);
  
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
    myVarName: 'someValue',
    urlBase: 'https://restful-booker.herokuapp.com'
    //urlBase: 'https://ms-categorias-finanzas-personales-100-srv-con.apps.ocp-qa.bice.local'
  }

  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }



  return config;
}