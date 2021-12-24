
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
* Yet again, it seems that the LFI vuln needs authorization. This is from a website talking about the vulnerability    
<blockquote>
 phpMyAdmin 4.8.x LFI to RCE (Authorization Required)
</blockquote>   

