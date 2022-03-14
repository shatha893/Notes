# <span style="color:#009688">Tools --*cURL*--</span> 

## <span style="color:#009688">Special Usage  

* We can authenticate using this syntax  
```
curl  http://admin:admin@<SERVER_IP>:<PORT>/
```

* or this syntax 


* What the hell?? That's gold 
  <blockquote>
  We can simply right-click on the request and select Copy>Copy as cURL
  </blockquote>  
  In the network tab in devtools.

* We can also do this 
  <blockquote>
  We can also repeat the exact request right within the browser devtools, by selecting Copy>Copy as Fetch. This will copy the same HTTP request using the JavaScript Fetch library. Then, we can go to the JavaScript console tab by clicking [CTRL+SHIFT+K], paste our Fetch command and hit enter to send the request
  </blockquote>

<br/><br/>

## <span style="color:#009688">Normal Usage  

* For post requests  
```console
curl -X POST -F '[PARAMETER]' -F '[PARAMETER]' [URL]
```  

* For get requests
```
curl [URL]
```  


<br/><br/>

## <span style="color:#009688">Options/Flags/Switches  


### `-x` Option  
* Sends the curl request through the proxy I specify. Eg. `http://127.0.0.1:8080`.  

### `-O` option  
* Is used to download a file from browser.

### `-o` option  
* Is used to download a file but while specifying a name.  

### `-s` option
* Is used to silence the status.

### `-k` option  
* To skip the certificate check in curl (The ssl cert)

### `-v` option
* If I want to see the whole response.   
  
### `-H` option  
* To add authorization token to the request. `curl -H 'Authorization: Basic YWRtaW46YWRtaW4=' http://<SERVER_IP>:<PORT>/`.

### `-L` option  
* To follow the redirection after a login.
<br/><br/>