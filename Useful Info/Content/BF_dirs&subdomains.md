# Bruteforcing Directories & Subdomains

### DirSearch   

* Git clone it with <a href="https://github.com/maurosoria/dirsearch">this link</a>.
* We can use it instead of Dirbuster or Gobuster.

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


<!--@nested-tags:Brute Force/Directories-Subdomains-->




























