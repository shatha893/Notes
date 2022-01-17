# Machine #[NUMBER] [NAME]  


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

<br/><br/>

## Walkthroughs  

