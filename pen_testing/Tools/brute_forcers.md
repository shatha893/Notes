# <span style="color:#009688">Tools --*feroxbuster*--</span> 

## <span style="color:#009688">Special Usage  


<br/><br/>

## <span style="color:#009688">Normal Usage  

```cmd
./feroxbuster -u http://127.0.0.1 -x pdf -x js -x php txt json,docx
```  

```cmd
feroxbuster --url http://10.10.11.143 -w ./big.txt --depth=4
```

<br/><br/>

## <span style="color:#009688">Options/Flags/Switches  

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

## <span style="color:#009688">Special Usage  


<br/><br/>

## <span style="color:#009688">Normal Usage  
* `hashcat -m 500 'b27179713f7bffc48b9ffd2cf9467620' /usr/share/wordlists/rockyou.txt `  


<br/><br/>

## <span style="color:#009688">Options/Flags/Switches  

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
<br/><br/>

## <span style="color:#009688">Options/Flags/Switches  

<br/><br/><br/><br/>  

# <span style="color:#009688">Tools --*dirSearch*--</span> 

## <span style="color:#009688">Special Usage  


<br/><br/>

## <span style="color:#009688">Normal Usage  
 

* Git clone it with <a href="https://github.com/maurosoria/dirsearch">this link</a>.
* We can use it instead of Dirbuster or Gobuster.

* Use it with the following syntax  
  ```console
  python3 dirsearch.py -u [URL] -e [EXTENSIONS]
  ```  

<br/><br/>


## <span style="color:#009688">Options/Flags/Switches  

<br/><br/><br/><br/>  