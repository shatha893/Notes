
gobuster dir -u 10.129.159.48 -x php,jsp -w /home/kali/Documents/cloned_reps/SecLists/Discovery/Web-Content/big.txt

* If I need to exclude a status code because an error like this is encountered you can use the flag `-b` and then put the status codes you want to blacklist or `-s` and put the status codes you want to whitelist. Like this:  
```
gobuster dir -u http://10.129.159.48:8080/ -x php,jsp -w /home/kali/Documents/cloned_reps/SecLists/Discovery/Web-Content/big.txt -b "403,404" 
```   


### GoBuster   
* It's used for bruteforcing directories and subdomains.
* The command to bruteforce in `dir` mode (Bruteforcing Directories)   
	```console
	gobuster dir -u [VICTIM'S LINK] -x [LIST OF EXTENSIONS] -w [WORDLIST PATH] -b [BLACKLIST SOME HTTP CODES]
	```

* The command to bruteforce in `dns` mode (Bruteforcing Subdomains)   
	```console
	gobuster dns -d [WEB SERVICE DOMAIN] -W [WORDLIST PATH]
	```  
