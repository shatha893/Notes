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

# <span class="title">Irked


<span class="date">Wednesday, 21/7/2021</span> 


<br/> 

### <span class="lameMach subtitle">Could Be Relevant and Could Be Not  
1. Nmap normal scan results  
   * Command
     ```console
     nmap -Pn 10.10.10.117
     ```
   * Output
     ```console
     PORT    STATE SERVICE
     22/tcp  open  ssh
     80/tcp  open  http
     111/tcp open  rpcbind
     ```
2. Nmap Full scan results (When it finishes)  
   * Command
      ```console
      nmap -Pn -p- 10.10.10.117
      ```  
   * Output  
     ```console
     PORT      STATE SERVICE
     22/tcp    open  ssh
     80/tcp    open  http
     111/tcp   open  rpcbind
     6697/tcp  open  ircs-u
     8067/tcp  open  infi-async
     49889/tcp open  unknown
     65534/tcp open  unknown
     ```.
3. Grabbed the banner of the http port  
   ```console
   PORT   STATE SERVICE VERSION
   80/tcp open  http    Apache httpd 2.4.10 ((Debian))
   ```
   We now know the version of the http server we have.  

4. What I found on the http page  
<img src="irked_http.png">  

6. What's an IRC?  
   

<br/><br/>

### <span class="lameMach subtitle">Why I Got Stuck?  


<br/>

### <span class="lameMach subtitle">To Do List  

<br/>

### <span class="lameMach subtitle">How Did **I** solve it  

<br/>

### <span class="lameMach subtitle">Nice Things I Found in Someone Else's Write Up  
  