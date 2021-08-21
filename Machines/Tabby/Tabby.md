* Services available
```
PORT 	STATE SERVICE
22/tcp   open  ssh
80/tcp   open  http
8080/tcp open  http-proxy
```

* Tried a directory that doesn't exist so that I can get the apache version its `2.4.41`.
* The Apache Tomcat vesion is `9` I think. 

* Grabbed the banner of the `p8080` service: 
```
PORT 	STATE SERVICE VERSION
8080/tcp open  http	Apache Tomcat
```  
* Searchsploited the http tomcat with the apache version  
```
Apache Tomcat < 5.5.17 - Remote Directory Listing 
Apache Tomcat < 6.0.18 - 'utf8' Directory Traversal  
Apache Tomcat < 6.0.18 - 'utf8' Directory Traversal (PoC)
Apache Tomcat < 9.0.1 (Beta) / < 8.5.23 / < 8.0.47 / < 7.0.8 - JSP Upload Bypass / Remote Code Execution (1) 
Apache Tomcat < 9.0.1 (Beta) / < 8.5.23 / < 8.0.47 / < 7.0.8 - JSP Upload Bypass / Remote Code Execution (2)
```  

* I'm gonna try with the first one see if the code is readable to me.
* It's simple but not working :(
* It's not working because I'm looking in the wrong direction and the tomcat version is 9 not 2 which leaves me with no exploits on exploit-db.
* Found an exploit that affects tomcat-catalina version 9.0.31 is affected.
* found these for the tomcat service and found some stuff in the examples directory but no luck with anything so far 
```
/examples        	(Status: 302) [Size: 0] [--> /examples/]
//examples/jsp/index.html (Status: 200) [Size: 14245]    	 
//examples/jsp/snp/snoop.jsp.html (Status: 200) [Size: 2318]  
//examples/jsp/snp/snoop.jsp (Status: 200) [Size: 581]   	 
//examples/servlets/index.html (Status: 200) [Siz
```