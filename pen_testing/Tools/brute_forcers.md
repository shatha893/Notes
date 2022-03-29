# <span style="color:#009688">Tools --*feroxbuster*--</span> 


## <span style="color:#009688">Normal Usage  

```cmd
./feroxbuster -u http://127.0.0.1 -x pdf -x js -x php txt json,docx
```  

```cmd
feroxbuster --url http://10.10.11.143 -w ./big.txt --depth=4
```

<br/><br/><br/><br/>


# <span style="color:#009688">Tools --*gobuster*--</span> 

## <span style="color:#009688">Usage  

* It's used for bruteforcing directories and subdomains.
* The command to bruteforce in `dir` mode (Bruteforcing Directories)   
	```console
	gobuster dir -u [VICTIM'S LINK] -x [LIST OF EXTENSIONS] -w [WORDLIST PATH] -b [BLACKLIST SOME HTTP CODES]
	```

* The command to bruteforce in `dns` mode (Bruteforcing Subdomains)   
	```console
	gobuster dns -d [WEB SERVICE DOMAIN] -w [WORDLIST PATH]
	```  

* Try using the dirbuster wordlists (They seem pretty nice).  


<br/><br/>

## <span style="color:#009688">Options/Flags/Switches  

### `-o` option  
* Can be used to write the output of the command into a file.  

### `-b` option  
* To blacklist http codes 

### `-s` option  
* To whitelist http codes

<br/><br/><br/><br/>   

# <span style="color:#009688">Tools --*hashcat*--</span> 

## <span style="color:#009688">Normal Usage  
* `hashcat -m 100 '964430b4cdd199af19b986eaf2193b21f32542d0' /usr/share/wordlists/rockyou.txt `  
 

<br/><br/><br/><br/> 


# <span style="color:#009688">Tools --*John the Ripper*--</span> 

## <span style="color:#009688">Special Usage  
### `ssh2john.py`  
* We can use this script to bruteforce the passphrase of a private key if I gain access to it. So we first run this and then we run `john` with a wordlist.
* Try `rockyou.txt` at first.  

### `office2john.py`

<br/><br/>

## <span style="color:#009688">Normal Usage  

```console
john --wordlist=[PATH/TO/WORDLIST] [PRIVATE KEY FILE]
```  

* We can use john the ripper to crack shadow file password by combining passwd and shadow first `unshadow /etc/passwd /etc/shadow > password.txt`.
* Then we just write `john password.txt`.


<br/><br/><br/><br/>  

# <span style="color:#009688">Tools --*dirSearch*--</span> 

## <span style="color:#009688">Normal Usage  
 

* Git clone it with <a href="https://github.com/maurosoria/dirsearch">this link</a>.
* We can use it instead of Dirbuster or Gobuster.

* Use it with the following syntax  
  ```console
  python3 dirsearch.py -u [URL] -e [EXTENSIONS]
  ```  

<br/><br/><br/><br/>  


# <span style="color:#009688">Tools --*BruteX*--</span> 

## <span style="color:#009688"> A Brief Description

* Can be used to bruteforce passwords.
* Check out the code on Github through <a href="https://github.com/1N3/BruteX">this link</a>

<br/><br/><br/><br/> 


# <span style="color:#009688">Tools --*XBruteForcer*--</span> 

## <span style="color:#009688"> A Brief Description

* To bruteforce certain Content management systems. Taken from the official github page "Brute Force Tool 🔓 WordPress , Joomla , DruPal , OpenCart , Magento".
* Check out the github page <a href="https://github.com/Moham3dRiahi/XBruteForcer">here</a> .

<br/><br/><br/><br/>  



hydra -l <username> -P <password list> <Target hostname> <service module> <post request parameters>[/code]

hydra -L ./wordlist -P /usr/share/wordlists/rockyou.txt 138.68.180.98:31314 http-post-form "/login:username=^USER^&password=^PASS^:S=964430b4cdd199af19b986eaf2193b21f32542d0" -vV -f
