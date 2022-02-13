function base(){
	
	
	
	//var env = karate.env
	var env = 'test1'
	karate.log('env in karate config file',env)
	karate.log('env in karate config file',env)
	
	var myConfigJson = {};
	var configList = [];
	var testConfigJson = read('classpath:/config.json')
	print(testConfigJson);
	karate.log('',testConfigJson)
	configList = testConfigJson;
	
	for (var i = 0; i < configList.length; i++) {
			if(configList[i].env.includes(env)){
				myConfigJson = configList[i];
				break;
			}
		}
	
	karate.configure('connectTimeout',5000)
	karate.configure('readTimeout',5000)
	return myConfigJson
}