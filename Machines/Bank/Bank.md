<link href="../../styles.module.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Encode+Sans+SC&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">


## <span class="copyright">Machine #5<span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">Bank


<span class="date">Monday, 16/8/2021</span> 


<br/> 

### <span class="helpmach subtitle">Could Be Relevant and Could Be Not  
   * ###  <span class="helpmach subtitle">Nmap
     * Normal Scan  
       ```console
       PORT   STATE SERVICE
       22/tcp open  ssh
       53/tcp open  domain
       80/tcp open  http
       ```

      * Full Scan same results.

   * ###  <span class="helpmach subtitle">Banner Grabbing
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




   * ###  <span class="helpmach subtitle">Searchsploiting Shit      
     * to view the script of the exploit write the following `searchsploit -x [PATH TO SCRIPT]`.
     * Searchsploiting `Apache 2.4.7`
       ```console
       Apache 2.4.7 + PHP 7.0.2 - 'openssl_seal()' Uni 
       Apache 2.4.7 mod_status - Scoreboard Handling Race condition
       ```  
       * The second one is a DOS attack so it's non of my business
<br/><br/> 

### <span class="helpmach subtitle">Terminologies  

<br/><br/> 

### <span class="helpmach subtitle">Useful Info
   Database name Thumbs?
* <span class="helpmach subtitle">Task 1</span>  
  
* <span class="helpmach subtitle">Result</span> 
  

//!!!! change into the new template


* Thinking out loud  

http://bank.htb/login.php found a login page here !!   


* Gobuster   

```console
/assets               (Status: 301) [Size: 304] [--> http://bank.htb/assets/]
/inc                  (Status: 301) [Size: 301] [--> http://bank.htb/inc/]   
/index.php            (Status: 302) [Size: 7322] [--> login.php]             
/login.php            (Status: 200) [Size: 1974]                             
/logout.php           (Status: 302) [Size: 0] [--> index.php]                
/support.php          (Status: 302) [Size: 3291] [--> login.php]             
/uploads              (Status: 301) [Size: 305] [--> http://bank.htb/uploads/]

```  


sqlmap -u bank.htb --data='inputEmail=&inputPassword=&submit=Submit' --method POST  --batch  


gobuster dns -d bank.htb -W /opt/useful/SecLists/Discovery/Web-Content/big.txt -t20



POST /login.php HTTP/1.1
Host: bank.htb
Content-Length: 63
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
Origin: http://bank.htb
Content-Type: application/x-www-form-urlencoded
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
Referer: http://bank.htb/login.php
Accept-Encoding: gzip, deflate
Accept-Language: en-GB,en-US;q=0.9,en;q=0.8
Cookie: HTBBankAuth=i8799cq76bf62kg880ojs8kec2
Connection: close

inputEmail=admin%40bank.htb&inputPassword=ASGFSDG&submit=Submit