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


<span class="date">Friday & Saturday, 16 & 17/7/2021</span> 


<br/> 

### <span class="lameMach subtitle">Could Be Relevant and Could Be Not 
1. I did an nmap scan on the 1000 most famous ports   
     - Command
       ```console
       nmap -Pn 10.10.10.3
       ```
    - Output  
      ```console
      Host is up (0.12s latency).
      Not shown: 996 filtered ports
      PORT    STATE SERVICE
      21/tcp  open  ftp
      22/tcp  open  ssh
      139/tcp open  netbios-ssn
      445/tcp open  microsoft-ds
      ```
2. Put a full nmap scan in the background (DON'T FORGET ABOUT IT!). The full scan gave me the same results as the fast one (It didn't take that long).
3. Grabbed the banner of each of the services I found in the fast nmap scan got the following results  
   * For the `ftp p21` service I got this  
     - Command  
       ```console
       nmap -Pn -sV -p21 10.10.10.3
       ```  

     - Output  
       ```console
       PORT   STATE SERVICE VERSION
       21/tcp open  ftp     vsftpd 2.3.4
       Service Info: OS: Unix
       ```

   * For the `ssh p22` 

     - Command  
       ```console
       nmap -Pn -sV -p22 10.10.10.3
       ```  
     - Output  
       ```console
       PORT   STATE SERVICE VERSION
       22/tcp open  ssh     OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)
       Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
       ```

   * For the  `net-bios p139`  
     - Command  
       ```console
       nmap -Pn -sV -p139 10.10.10.3
       ```  

     - Output  
       ```console
       PORT    STATE SERVICE     VERSION
       139/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
       ```  


   * For the `microsoft-ds p445`  

       - Command
         ```console
         nmap -Pn -sV -p445 10.10.10.3
         ```
       - Output    
         ```console
         PORT    STATE SERVICE     VERSION
         445/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
         ```
  1. It gave me the same result as port 139, so does that mean that they have the same service on both ports?  
  2. NetBIOS might be my way in to get RCE.
  3. Turns out the Samba in the version is a software that implemets NetBIOS🤔.
  4. What the hell is the *d* in "smbd". I found out that there's a protocol called smb but no d.
  5. I think I need to connect to one of the ports to "establish a session".  I tried with  
      ```console
      nc -nv 10.10.10.3 139
      ```
      Didn't really understand what happened. I'll try researching netcat more.
      <span class="comments">//I'm not sure what does it mean when we nc on an smb port? But it's not going to get me anywhere</span>

  6. The NetBIOS could be workgroup or domain and in our case it's workgroup which is a peer-to-peer network for computers on the same LAN ( I think the way we connected to the machine makes it seem like we're on the same LAN)🤔🤔.  
  7.  The service we have is NetBIOS-ssn which is usually set for connection-oriented communication. 
  8.  The **port 139** usually allows 2 computers to establish a connection, allows messages to span multiple packets, and provides error detection and recovery.
  9.  The **port 445** is used for SMB protocol(server message block) for sraing file between different OSes. 
  10. I went to the ftp and I'm currently trying to crack the password to get into the host (I hope it works). I'm trying to crack it using `Ncrack`. [UPDATE] Found a username and password (anonymous/anonymous) it logged me in but I can't gain shell access yet.  
   
  11. I made a python code to split the usernames and passwords for nothing because it seems the ftp is a deadend.  
   
  12. So for now I think I can upload files on the remote server. <span class="comments">//I don't think so 🤔🙄  
  
  13. Ya rab ma atfashal but it seems like it's the *smiley face vulneribility* BUT IT'S NOT WORKING. Turns out there's some kind of a firewall preventing us from using it. SAAAAD.  
  At least I excluded something!!  

  17. I think Samba is also a deadend because nothing is working. I tried with `enum4linux` and it did not work so I'm moving on to the SSH unless I give up on the SSH and get back here. <span class="comments">//Because of the error I mentioned in the "Why I got Stuck" 
   
  18. Exploits found of the ssh version we have  
       - Command
          ```console
          searchsploit OpenSSH 4.7p1
          ```
       - Output
          ```console
          OpenSSH 2.3 < 7.7 - Username Enumeration  
          OpenSSH 2.3 < 7.7 - Username Enumeration (PoC)  
          OpenSSH < 6.6 SFTP (x64) - Command Execution   
          OpenSSH < 6.6 SFTP - Command Execution  
          OpenSSH < 7.4 - 'UsePrivilegeSeparation Disabled' Forwarded Unix Domain Sockets Privilege Escalation 
          OpenSSH < 7.4 - agent Protocol Arbitrary Library Loading 
          OpenSSH < 7.7 - User Enumeration (2)
          ```
        I might use the `sftp command execution` but I think I need valid credentials.  

   19.  `hydra` crack command  
   
           ```console
           hydra -l [USER NAME] -p [PASSWORD] [IP ADDRESS] -t [NUMBER OF THREADS] [SSH OR FTP]
           ```  
           To use a usernames wordlist we can use the `-L` option and `-P` option for a wordlist of passwords.  

   1.  The result of aggressive nmap on port 445 and 139  
          - Command:
          ```console
          nmap -Pn -p445,139 -A 10.10.10.3
          ```  

          - The output
          ```console
            PORT    STATE SERVICE     VERSION
            139/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
            445/tcp open  netbios-ssn Samba smbd 3.0.20-Debian (workgroup: WORKGROUP)
            Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
            Aggressive OS guesses: DD-WRT v24-sp1 (Linux 2.4.36) (92%), Dell Integrated Remote Access Controller (iDRAC6) (92%), Linksys WET54GS5 WAP, Tranzeo TR-CPQ-19f WAP, or Xerox WorkCentre Pro 265 printer (92%), Linux 2.4.21 - 2.4.31 (likely embedded) (92%), Linux 2.6.27 - 2.6.28 (92%), Linux 2.6.8 - 2.6.30 (92%), Dell iDRAC 6 remote access controller (Linux 2.6) (92%), Supermicro IPMI BMC (Linux 2.6.24) (92%), Raritan Dominion PX DPXR20-20L power control unit (92%), LifeSize video conferencing system (Linux 2.4.21) (92%)
            No exact OS matches for host (test conditions non-ideal).
            Network Distance: 2 hops

            Host script results:
            |_clock-skew: mean: 2h00m31s, deviation: 2h49m43s, median: 30s
            | smb-os-discovery: 
            |   OS: Unix (Samba 3.0.20-Debian)
            |   Computer name: lame
            |   NetBIOS computer name: 
            |   Domain name: hackthebox.gr
            |   FQDN: lame.hackthebox.gr
            |_  System time: 2021-07-17T10:08:08-04:00
            | smb-security-mode: 
            |   account_used: <blank>
            |   authentication_level: user
            |   challenge_response: supported
            |_  message_signing: disabled (dangerous, but default)
            |_smb2-time: Protocol negotiation failed (SMB2)

            TRACEROUTE (using port 139/tcp)
            HOP RTT      ADDRESS
            1   83.87 ms 10.10.14.1
            2   84.51 ms 10.10.10.3
          ```  

   2.  Turns out there was an error with smb and kali 2020 and I've been wasting my time on that and i just fixed the error and hopefully I will get to something.
   

<br/><br/>

### <span class="lameMach subtitle">Why I Got Stuck?  
- I can't tell you how many times I had to brute force the ssh login and why is that?  
Because of the stupid smbclient that kept refusing my connection to the smb service until I found out that it's a problem with the `smb.conf` file in kali linux 2020 and had to be fixed by adding the following under `[global]` in the `smb.conf` file 

  ```console
  client min protocol = CORE
  client max protocol = SMB3
  ```
- Once I was able to log into smb it wasn't hard to find a way to log in.

- With the ssh the problem was that I couldn't get any credentials to benefit from the exploits I found for it.  
- My newly downloaded Kali didn't even work with these lines I had to add
    ```console
    [global]
    client min protocol=NT1
    ```  
  to the /etc/samba/smb.conf file  
<br/>

### <span class="lameMach subtitle">To Do List  
1. Reseach ftp and check for vulneribilities on the version you found.DEADEND 😭.  
2. Research ssh in the same manner. TOMORROW 
3. Research net-bios.
4. Research having the same service on 2 ports.  
5. Research for already existing exploits for netbios.
6. Research netcat more.
7. If the ftp bruteforce didn't work on the current list look for another list (SecLists).
8. Understand the SFTP Command execution exploit.

<br/>

### <span class="lameMach subtitle">How Did **I** solve it  
<span class="comments">//I will be writing the last things I did that got me command execution on the target  

1. I was able to login anonymously (I think that's what they called it), meaning logging in without a password,  which allowed me to just view the available shares and I used this command to accomplish this  

   ```console
   smbclient -L  //10.10.10.3 
   ```  
   Which gave me the following output after just pressing `ENTER` when prompted to give the password  
   ```console
   Anonymous login successful

   Sharename       Type      Comment
   ---------       ----      -------
   print$          Disk      Printer Drivers
   tmp             Disk      oh noes!
   opt             Disk      
   IPC$            IPC       IPC Service (lame server (Samba 3.0.20-Debian))
   ADMIN$          IPC       IPC Service (lame server (Samba 3.0.20-Debian))
   Reconnecting with SMB1 for workgroup listing.
   Anonymous login successful

   Server               Comment
   ---------            -------

   Workgroup            Master
   ---------            -------
   WORKGROUP            LAME

   ```
<span class="comments">//I should've written that earlier I don't remember the exact outputs...If you have the time write it later
<br/>

### <span class="lameMach subtitle">Nice Things I Found in Someone Else's Write Up  
  
  * According to *NOOBSEC*  
    <blockquote>

    *Good thing about getting SSH version is you get the OS running on the target machine too.*
    </blockquote>  

    <blockquote>

    *We’ll cross out SSH from out list of things to look for, unless we get some creds or keys from somewhere.*
    </blockquote>  

    <blockquote> IMPORTANT!!!

    *A tip, when you want to view a exploit that searchsploit printed out in the results, you can use -x flag of searchsploit to view its’ contents.*
    </blockquote>

    * So he used *searchexploit* to check for kernel vulnerabilities when he was trying to privilege escalate to root in the *distcc* exploit
      <blockquote>
      
      *Since this machine is old, a kernel exploit is very likely. Let’s check the kernel version running, and details of the OS too*
      </blockquote>

* The Daemon Command Execution was accomplished with the service *distcc* aka the service that I didn't know existed.
  
