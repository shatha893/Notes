* I will try to see if we have sql injection  


* The post request's body is being sent as a json object  
```
POST /api/submit HTTP/1.1

Host: 64.227.39.89:30230
Content-Length: 22
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36
Content-Type: application/json
Accept: */*
Origin: http://64.227.39.89:30230
Referer: http://64.227.39.89:30230/
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
Connection: close



{"artist.name":"abcd"}
```  

* Imma try and gobuster it see if I find anything or maybe try using feroxbuster. Maybe check a word list specifically for apis.  
* There is no need to brute force directories I found an RCE exploit but it kept giving me command failed.
* Anyway the backend is nodejs.



