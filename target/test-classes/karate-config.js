function fn(){
   var config = {
     sourceurl : 'https://reqres.in/api/users/3'
   }
   var env = karate.env
   karate.log("Testsuite executed in Environment",env)
   if(env == 'preprod'){
      config.sourceurl = 'https://reqres.in/api/users/3';
   }
   else if(env == 'Production'){
         config.sourceurl = 'https://prod.in/api/users/3';
         }

   return config;
}