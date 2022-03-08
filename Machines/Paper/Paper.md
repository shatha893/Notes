# <span style="color:[COLOR]">Machine #- Paper</span>  


## <span style="color:[COLOR]">Notes During Working on the Machine 🧐🤓   

* Found this in the headers of the response of the http and https. Seems interesting  
  ```
  Server: Apache/2.4.37 (centos) OpenSSL/1.1.1k mod_fcgid/2.3.9
  ```  
* In the body there's this tag that had the following  
  ```html
   <meta name="generator" content="HTML Tidy for HTML5 for Linux version 5.7.28">
  ```  
* What is HTML Tidy and is it relevant? Doesn't seem like it's much  

* Based on Wappalyzer's results the web server is Apache.

* Research fastcgi.
* `gobuster dir -u 10.10.11.143 -x php,cgi,txt,html,md -w ./apache.fuzz.txt -b '404,403,400' -o apache.output.fuzz.txt`
* I think I'm gonna go back to it later.
* The cgi seems like the right path. I think.
<br/><br/>



## <span style="color:[COLOR]">How Did I Solve the Machine 😎🥳 


<br/><br/>



## <span style="color:[COLOR]">Where I Got Stuck?😡😧  


<br/><br/>



## <span style="color:[COLOR]">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:[COLOR]">Writeups ✍🏽📓   


<br/><br/>




<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->