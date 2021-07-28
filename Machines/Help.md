<link href="../styles.module.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Encode+Sans+SC&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">


## <span class="copyright">Machine #2<span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">Help


<span class="date">Tuesday, 27/7/2021</span> 


<br/> 

### <span class="helpmach subtitle">Could Be Relevant and Could Be Not  
   * ###  <span class="helpmach subtitle">Nmap
        * Normal Scan    
           ```console
           nmap -Pn 10.10.10.121
           ```
           
           ```console
           PORT    STATE SERVICE
           22/tcp   open  ssh
           80/tcp   open  http
           3000/tcp open  ppp
           ```
       * Full Scan   
          ```console
          nmap -Pn -p- 10.10.10.121
          ```    
         ```console
         PORT      STATE SERVICE
         22/tcp   open  ssh
         80/tcp   open  http
         3000/tcp open  ppp
         ```  

   * ###  <span class="helpmach subtitle">Banner Grabbing
      * HTTP `p80`
         ```console
         PORT   STATE SERVICE VERSION
         80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))
         ``` 

       * PPP `p3000`  
         ```console
         PORT    STATE SERVICE VERSION
         3000/tcp open  http    Node.js Express framework
         ```  
         It's also http is that normal for point to point protocol?or is it just another webserver?   

       * Aggressive scan on port `p3000`  
         ```console
         PORT     STATE SERVICE VERSION
         3000/tcp open  http    Node.js Express framework
         |_http-title: Site doesn't have a title (application/json; charset=utf-8).
         ```  
         Nothing significant...

       * SSH `p22`  
         ```console
         PORT   STATE SERVICE VERSION
         22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.6 (Ubuntu Linux; protocol 2.0)
         Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
         ```
     
   * ###  <span class="helpmach subtitle">Searchsploiting Shit      
       * Apache version 2.4.18  
```console
Apache + PHP < 5.3.12 / < 5.4.2 - cgi-bin Remote Code Execution                                                                     
Apache + PHP < 5.3.12 / < 5.4.2 - Remote Code Execution + Scanner                                                                      
Apache 2.4.17 < 2.4.38 - 'apache2ctl graceful' 'logrotate' Local Privilege Escalation                                                                    
Apache < 2.2.34 / < 2.4.27 - OPTIONS Memory Leak                                                                          
Apache CXF < 2.5.10/2.6.7/2.7.4 - Denial of Service                                                                       
Apache mod_ssl < 2.8.7 OpenSSL - 'OpenFuck.c' Remote Buffer Overflow                                                                      
Apache mod_ssl < 2.8.7 OpenSSL - 'OpenFuckV2.c' Remote Buffer Overflow (1)                                                                           
Apache mod_ssl < 2.8.7 OpenSSL - 'OpenFuckV2.c' Remote Buffer Overflow (2)                                                                           
Apache OpenMeetings 1.9.x < 3.1.0 - '.ZIP' File Directory Traversal                                                                     
Apache Tomcat < 5.5.17 - Remote Directory Listing                                                                       
Apache Tomcat < 6.0.18 - 'utf8' Directory Traversal                                                                     
Apache Tomcat < 6.0.18 - 'utf8' Directory Traversal (PoC)                                                                         
Apache Tomcat < 9.0.1 (Beta) / < 8.5.23 / < 8.0.47 / < 7.0.8 - JSP Upload Bypass / Remote Code Execution 
Apache Tomcat < 9.0.1 (Beta) / < 8.5.23 / < 8.0.47 / < 7.0.8 - JSP Upload Bypass / Remote Code Execution 
Apache Xerces-C XML Parser < 3.1.2 - Denial of Service (PoC)                                                                       
Webfroot Shoutbox < 2.32 (Apache) - Local File Inclusion / Remote Code Execution  
```


<br/><br/> 

### <span class="helpmach subtitle">Useful Info

* ###  <span class="helpmach subtitle">Terminologies  
    * What's an ETag?  
    * What's LFR?
    * What do we mean by inodes?

<br/> 

* ###  <span class="helpmach subtitle">Web Servers  
   * The port `p3000` turned out to be also an http service and when I opened it I got a JSON object. What the hell does that mean?
  
  * The JSON object states the following  
    ```json
    {
       "message":"Hi Shiv, To get access please find the credentials with given query"
      }
    ```
   * I think I will be using this soon  
      ```sql
      DECLARE @data NVARCHAR(4000);

      SET @data = N'{

      {"message":"Hi Shiv, To get access please find the credentials with given query"}

      }';

      SELECT JSON_QUERY(@data) AS 'Result';
      ```  
      I think this is what the message means by query or it could be not because there's no existence of an sql service.
   * So maybe there's a way that I could download the code on the server and then execute it from their where it will have its own etag (I think!!)  
   * I should try using gobuster
   <br/> 

* ###  <span class="helpmach subtitle"> ExpressJs
   * They say there's an exploit on the expressjs if the header *X-Powered-By: Express* is included so I'll research more on that.
   
    

* ###  <span class="helpmach subtitle"> 
  
* ###  <span class="helpmach subtitle">
 

### <span class="helpmach subtitle">Why I Got Stuck?  


<br/><br/>

### <span class="helpmach subtitle">Nice Things I Found in Someone Else's Write Up  
  
