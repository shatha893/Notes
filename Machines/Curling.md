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
18:03    27577     root curl -K /home/floris/admin-area/input -o /home/floris/admin-area/report
18:03    27576     root /bin/sh -c curl -K /home/floris/admin-area/input -o /home/floris/admin-area/report                                                                               
```

* Found this password in a php file `mYsQ!P4ssw0rd$yea!` I dunno looks like a mysql password