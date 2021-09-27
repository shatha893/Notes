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

## <span class="copyright">Machine #6<span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">Curling


<span class="date">Friday, 10/9/2021</span> 


<br/> 

<span class="helpmach subtitle">Task #1</span> 


____________________________________________  
```
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http
```


* Found a gold mine when gobustering just for directories. 
* Found the version of the Joomla cms being used from the README.txt file. It's `3.8`. I'll searchsploit it.  

* Gobuster results  
```console
/.htaccess            (Status: 403) [Size: 277]
/.htpasswd            (Status: 403) [Size: 277]
/administrator        (Status: 301) [Size: 320] [--> http://10.10.10.150/administrator/]
/bin                  (Status: 301) [Size: 310] [--> http://10.10.10.150/bin/]          
/cache                (Status: 301) [Size: 312] [--> http://10.10.10.150/cache/]        
/cli                  (Status: 301) [Size: 310] [--> http://10.10.10.150/cli/]          
/components           (Status: 301) [Size: 317] [--> http://10.10.10.150/components/]   
/images               (Status: 301) [Size: 313] [--> http://10.10.10.150/images/]       
/includes             (Status: 301) [Size: 315] [--> http://10.10.10.150/includes/]     
/language             (Status: 301) [Size: 315] [--> http://10.10.10.150/language/]     
/layouts              (Status: 301) [Size: 314] [--> http://10.10.10.150/layouts/]      
/libraries            (Status: 301) [Size: 316] [--> http://10.10.10.150/libraries/]    
/media                (Status: 301) [Size: 312] [--> http://10.10.10.150/media/]        
/modules              (Status: 301) [Size: 314] [--> http://10.10.10.150/modules/]      
/plugins              (Status: 301) [Size: 314] [--> http://10.10.10.150/plugins/]      
/server-status        (Status: 403) [Size: 277]                                         
/templates            (Status: 301) [Size: 316] [--> http://10.10.10.150/templates/]    
/tmp                  (Status: 301) [Size: 310] [--> http://10.10.10.150/tmp/]
``` 

* I also found 
```console
/secret.txt
/.htaccess.txt
/configuration.php
``` 

* The stupid admin has his name written in one of the posts 'Floris' and the password was in 'secret.txt' in base64. Couldn't be less secure.

* I got the source code of a template that I can execute (preview) and I got RCE now I have privesc left. 

* Found a file called backup of password because  I can't read user.txt and found it's type with the first magic bytes. I hope this works. It turns out it's a Bzip file.
* It's not just zipped once. It's zipped maybe 3 or 4 times. Anyway I got Floris's password and it's `5d<wdCbdZu)|hChXll`. 


```console
07:43	12751 	root curl -K /home/floris/admin-area/input -o /home/floris/admin-area/report
07:43	12750 	root /bin/sh -c sleep 1; cat /root/default.txt > /home/floris/admin-area/input 	 
07:43	12749 	root /bin/sh -c curl -K /home/floris/admin-area/input -o /home/floris/admin-area/report                                                                              
```

* Found this password in a php file `mYsQ!P4ssw0rd$yea!` I dunno looks like a mysql password.

* The mysql is a deadend.

* I found out that the `-K` option for curl allows me to put a configuration file to put the rest of the options in it. But I'm still not sure how can I exploit this.
* I tried to put a reverse shell in the php source code of the `index.php` that is run by the root but it doesn't seem to work it seems like the www-data is what runs it and it opens me a shell in www-data.  


* The following paths exist in PATH in /etc
* `/usr/games`.
* `/usr/local/games`

* Paths I can write on in cron jobs  
* `/var/crash`
* `/var/crash/.`  


* Privesc  
  * Info about the user I'm currently in  
    * Name: floris, Password:`5d<wdCbdZu)|hChXll`.
    * mysql account -u floris, password: `mYsQ!P4ssw0rd$yea!` (But it's useless).
    * Not allowed to use "sudo".
    * File "input" and file "report" in their `/home/floris/admin-area` folder that the root is using in a cron job with a curl command but I'm not sure what does it exactly do.  

  * www-data shell
    * I've put a reverse shell in the index.php file but it seems that there's a www-data cron job that runs it because that's the rev shell I get.

  * I tried to change the PATH variable because the root is executing the cron with 'curl' without writing the full path but it didn't work to this alone. It seems the cronjobs are using a PATH that is specified somewhere in where they're created. I think I should look into where crons are created exactly maybe if I know the file and I can read it I can see the path and find somewhere that I can write in or abuse it in another way.

  * I tried to put some php code in the file that the cronjob is curling but it doesn't seem to work.

  * The curl that the root is running, I think every minute, has the option `-K` which meant that it will execute what's inside the file after this option as if it's written in command line.
  * An idea just occured to me if the configuration file runs as it it's on command line and I can alter the code why not write the following (يا رب)  curl -K /home/floris/admin-area/input -o /home/floris/admin-area/report  
   Inside input I'm going to try this
   ```console
   ; id;
   ```  
   This didn't work. 

* So I finally figured how the hell I can exploit the -K option in the curl by "injecting" options. What I can do is read and write files so it occured to me why not write to the shadow file since the curl is executing as root I can do whatever the hell I want.
* I wanted to edit the sudoers file but I just didn't know what to write without crashing the system.
* So what I did is I made a new password for the root by using the command `mkpasswd` and I specified the algorithm.
* I can know which algorithm from the hash itself. The number at the beginning of it indicates the algorithm being used then we have the salt then we have the hash itself.
* So sshing with the new password didn't work with me weirdly (or maybe not weirdly not sure yet) any how `su`ing to the root worked just fine.
* And that's it.
* So the key to it all was using the `file://127.0.0.1/whatever/file/I/want` instead of `http://127.0.0.1` which brings me only pages.
  