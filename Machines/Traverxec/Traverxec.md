# <span style="color:[COLOR]">Machine #18 Traverxec</span>  


## <span style="color:[COLOR]">Notes During Working on the Machine 🧐🤓   

* Web server being used called "Nostromo" version 1.9.6.
* Seems like it's vulnerable to an RCE.
* But the code searchsploit provides sucks I'll try and find another one.
* That if the website is even vulnerable to it. 
* I've got a reverse shell using the exploit. Seems like the exploit was right on spot
* Now let's get to priv esc.
* I got a password for david hopefully he's reusing it.
  ```cmd
  -rw-r--r-- 1 root bin 41 Oct 25  2019 /var/nostromo/conf/.htpasswd                 
  david:$1$e7NfNpNi$A6nCwOTqrNR2oDuIKirRZ/
  ```  
* Cracked the password Nowonly4me nowonly4me
* This password is useless I tried it with SSH david, su, as the password for sudo of www-data, ssh root, su root and even sshed on localhost.

* The Nostromo web server was vulnerable to the easiest rce I've ever encountered (v1.9.6) so I got access as www-data easily.
* What I've tried and found so far  
  * A useless password of david's that I cracked. UPDATE Maybe I can make a list of all permutations possible for the password I found and brute force the SSH (But it seems impossible).
  * A nameserver IP address.
  * The sudo version is vulnerable (1.8.27) but not in my current user.
  * There's a kernel exploit for the Linux version we have (I'm gonna try it & if it works look for the intended way then).
  * No sign of any DBs. UPDATE I can't run any kernel exploit because there's no c compiler on the victim. 
  * The log file "wtmp" maybe I can transfer it to my box through `nc` & then try & find a way of reading it.
  * The processes seem to be borningly legit. UPDATE DEADEND.
  * No interesting crons.
  * No interesting SUID.
  * No interesting capabilities.
* Maybe the web server is what will et me David because he's the admin. UPDATE I've researched the web server's files nothing seems interesting.
* David is in a number of groups the most interesting one seem to be `video` which seems also useless at the moment [netdev, video, plugdev, floppy, cdrom, audio, dip].

<br/><br/>



## <span style="color:[COLOR]">How Did I Solve the Machine 😎🥳 


<br/><br/>



## <span style="color:[COLOR]">Where I Got Stuck?😡😧  


<br/><br/>



## <span style="color:[COLOR]">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:[COLOR]">Writeups ✍🏽📓   


<br/><br/>




<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->