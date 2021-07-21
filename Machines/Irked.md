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


## <span class="copyright">Machine #1<span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">Lame


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
     ```

<br/><br/>

### <span class="lameMach subtitle">Why I Got Stuck?  


<br/>

### <span class="lameMach subtitle">To Do List  

<br/>

### <span class="lameMach subtitle">How Did **I** solve it  

<br/>

### <span class="lameMach subtitle">Nice Things I Found in Someone Else's Write Up  
  