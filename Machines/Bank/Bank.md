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
  