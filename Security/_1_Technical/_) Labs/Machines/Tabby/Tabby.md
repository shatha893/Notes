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


* Found this vulnerability. Might be the one but it seems too new (https://www.sangfor.com/en/info-center/blog-center/cyber-security/apache-tomcat-deserialization-remote-code-execution-vulnerability) IRRELEVANT
* Try and look into this one or any other expliots for the apache version because it's quiet old (https://www.virsec.com/research-lab/cve-2020-11984-apache-http-server-2-4-32-to-2-4-44-mod_proxy_uwsgi-info-disclosure-and-possible-rce)


# Machine #14 Tabby   


## Nmap Results  
  <img src="https://nmap.org/images/nmap-logo-256x256.png">   

* Initial nmap output  

  ```console
  PORT     STATE SERVICE
  22/tcp   open  ssh
  80/tcp   open  http
  8080/tcp open  http-proxy
  ```

* Full scan gives same results as the 1000 ports nmap scan.   




<br/><br/>

## Banner Grabbing of Services  



<br/><br/>

## Searchsploiting Results   
  <img src="https://www.offensive-security.com/wp-content/uploads/2020/05/SearchSploit-1.png" width=400 height=200>   



<br/><br/>  

## Gobustering Stuff  

  <img src="https://cdn.akamai.steamstatic.com/steam/apps/1092880/capsule_616x353.jpg?t=1605640630" width=400 height=200>  

```console
/Readme.txt           (Status: 200) [Size: 1574]
/assets               (Status: 301) [Size: 315] [--> http://10.129.170.18/assets/]
/favicon.ico          (Status: 200) [Size: 766]                                   
/files                (Status: 301) [Size: 314] [--> http://10.129.170.18/files/] 
/index.php            (Status: 200) [Size: 14175]                                 
/news.php             (Status: 200) [Size: 0]  
```

<br/><br/>


## Thinking Out Loud   

  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr4hzX6KoRN5PjPJjy8QC43K0T-CoXZHawDIxG4jCa9aMD1K8Vl3vhpG2a2OVbiy-i93c&usqp=CAU" width=200 height=200>  

* DNS unauthorized zone transfer.  
* I found an LFI in this url `http://megahosting.htb/news.php?file=../../../../../../../etc/passwd` I was able to read the passwd file and I now know that there's a user called "ash"  
  ```console
  ash:x:1000:1000:clive:/home/ash:/bin/bash 
  ```

* It seems like the config file `tomcat-users.xml` is usually stored in `$CATALINA_HOME\conf\tomcat-users.xml` and the catalina home seems to be in the following dir  `CATALINA_HOME in /usr/share/tomcat9 `, so I will be trying this path `/usr/share/tomcat9/conf/tomcat-users.xml`.
* They say that credentials are usually stored on tomcat config files.  
* I must be able to open some file from the tomcat service in the port 80 service through the LFI vulnerability and this way I can get something. A credential or anything.

<br/><br/>  


# <span style="color:#FF5050">Machine #21 Tabby</span>  


## <span style="color:#FF5050">Checklist 🤓   

- [ ] Maybe I can access data through this path somehow `/var/lib/tomcat9/webapps/ROOT/index.html`
- [x] Try default credentials for `/html/manager` and `/html/host-manager`.
- [ ] Bruteforce the `/html/manager` login credentials.

<br/><br/>


## <span style="color:#FF5050">What Do We Have? 🤔🤔 

* Default credentials that could be the ones  
```
admin:admin
tomcat:tomcat
admin:<NOTHING>
admin:s3cr3t
tomcat:s3cr3t
admin:tomcat
```

<br/><br/>


## <span style="color:#FF5050">Random Notes👀  

<br/><br/>

## <span style="color:#FF5050">How Did I Own This Shit 😎🥳 


<br/><br/>

## <span style="color:#FF5050">Writeups ✍🏽📓   


<br/><br/> 
  


