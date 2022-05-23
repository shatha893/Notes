# <span style="color:#adadff">Machine #26 FriendZone</span>  



## <span style="color:#adadff">Checklist 🤓   
- [x] AXFR zone transfer.
- [ ] ~~Break into the login somehow.~~
  - [ ] ~~Try default credentials (like admin/admin)~~
- [ ] Bruteforce all the domains just to be sure.
- [ ] I will try to login into ftp anonymously or with the admin creds I have into all the subdomains I have.
- [x] Exim4 vulnerability. Version vulnerable but there's no c compiler on the system

<br/><br/>


## <span style="color:#adadff">What Do We Have? 🤔🤔 
* We have a relatively good number of services: ftp, ssh, dns, http, https, and smb
* Friend Zone Escape Software
* Found this email on the http website `info@friendzoneportal.red` a dns server being one of the open services leaves me with the conclusion that "friendzoneportal.red" could be our domain.
* FTP version is `vsftpd 3.0.3`
* Found a zone transfer vulnerability which I exploited as follows (This kind of vulnerability could be exploited to gain information)
  * There's a dns service open on the victim so what I did is I added the ip of the machine (victim) to my `/etc/resolv.conf` file (before the nameserver that already existed) which meant that dns domains will be taken from this address now which allowed me to use this command `dig axfr friendzoneportal.red` without specifying the nameserver so that it would use the one in the `resolv.conf` file and this way I got the information I wanted without even bruteforcing for subdomains. The following is what I saw to be useful of the information I got  
  ```
  admin.friendzoneportal.red //An admin login page that is underconstruction
  files.friendzoneportal.red //Gave me a 404
  imports.friendzoneportal.red //Gave me a 404
  vpn.friendzoneportal.red //Gave me a 404
  ```  

* Got an admin page on this subdomain `admin.friendzoneportal.red` only on the https service the http redirects me to the same page each time.
* The login image on the admin subdomain is just frustrating. It says the admin page hasn't been developed yet.
* Found another domain with the name `friendzone.red` when I tried to dig it `dig axfr friendzone.red @friendzoneportal.red` from the certificate of the https service.  
  ```
  friendzone.red
  administrator1.friendzone.red //Gave output
  hr.friendzone.red // Gave 404
  uploads.friendzone.red //Gave output
  ```  

  ```
  bmOKpuihQ516517768779T4pTl4yEZ
  nc   
  NJvfXXUCKw 1652546224 vbSfGn577v                     
  ```  

* Found an upload page in the domain `uploads.friendzone.red`.
* The subdomain `administrator1.friendzone.red` also opened up to a login page ( Weird that they weren't working before ).
* Here `https://friendzone.red/js/js/` found this weird message with this base64 value  
  ```
  Uzl0WUZXSjZTejE2NTI1NDU1NThod3YwSnpibUx5
  VzIxMHNvbWJ1ZzE2NTI1NDU4NTlKZFZyalRyaWow
  bk5ha1pJZUpueDE2NTI1NDU5MTVzbTg5SFdrcUlS
  
  dmxkcHh0dW8wRzE2NTI1NDYzNDJhNXU5QmpaSnd3
  nVcHgfv1Sv1652546413tdP3FUQSpY
  ```  
* I found a `/files` directory in this domain `https://uploads.friendzone.red/files/`.
* Found a `/admin` in the domain `https://friendzone.red` that is empty which is a bit weird.  
* When gobustering `http://admin.friendzoneportal.red` I found a couple of stuff   
```
/fz.jpg               (Status: 200) [Size: 20889]
/robots.txt           (Status: 200) [Size: 13]   
/robots.txt           (Status: 200) [Size: 13]   
/wordpress
```  

* Found this when I executed the command `enum4linux -a 10.10.10.123` `Known Usernames .. administrator, guest, krbtgt, domain admins, root, bin, none`.
* Found these too while looking through the same tool output  
  ```
  S-1-5-32-544 BUILTIN\Administrators (Local Group)
  S-1-5-32-545 BUILTIN\Users (Local Group)
  S-1-5-32-546 BUILTIN\Guests (Local Group)
  S-1-5-32-547 BUILTIN\Power Users (Local Group)
  S-1-5-32-548 BUILTIN\Account Operators (Local Group)
  S-1-5-32-549 BUILTIN\Server Operators (Local Group)
  S-1-5-32-550 BUILTIN\Print Operators (Local Group)
  ```  
* Also found this `S-1-5-21-3651157261-4258463691-276428382-513 FRIENDZONE\None (Domain Group)` and this `S-1-5-21-3651157261-4258463691-276428382-501 FRIENDZONE\nobody (Local User)`.  
* It seems like there are 3 users  
  ```
  [I] Found new SID: S-1-22-1
  [I] Found new SID: S-1-5-21-3651157261-4258463691-276428382
  [I] Found new SID: S-1-5-32
  ```
  ```
  S-1-22-1-1000 Unix User\friend (Local User)
  ```
  * This seems to be a user `friend`.
  * When I ran this command `smbmap -H <IP ADDRESS> -R` I found a file inside `general` called `creds.txt` it probably has the admin credentials that I can sign in with.
  * And indeed I found the admin's creds in the file `admin:WORKWORKHhallelujah@#`.  
  * Found this in the response on the `friendzone.red/js/js` page  
    ```
    Date: Wed, 18 May 2022 07:35:52 GMT
    Server: Apache/2.4.29 (Ubuntu)
    Set-Cookie: zonedman=justgotzoned; expires=Wed, 18-May-2022 08:35:52 GMT; Max-Age=3600
    ```  
  * What does the header `Date` mean? Plus notice the difference between it and the date on the age of the cookie.
  * The expiration of the cookie that I found in the browser's cookies section is `2022-05-18T08:30:23.705Z`
  * By using this command `nmap --script smb-enum-shares.nse -p445 10.10.10.123` I was able to find the path of each of the shares.
  * Found other creds 
    ```
    db_user=friend

    db_pass=Agpyu12!0.213$

    db_name=FZ
    ```  
  * A script called `reporter.py` that's in `/opt/server-admin` it contains this code  
    ```python
    #!/usr/bin/python

    import os

    to_address = "admin1@friendzone.com"
    from_address = "admin2@friendzone.com"

    print "[+] Trying to send email to %s"%to_address

    #command = ''' mailsend -to admin2@friendzone.com -from admin1@friendzone.com -ssl -port 465 -auth -smtp smtp.gmail.co-sub scheduled results email +cc +bc -v -user you -pass "PAPAP"'''

    #os.system(command)

    # I need to edit the script later
    # Sam ~ python developer
  ```
<br/><br/>


## <span style="color:#adadff">Random Notes👀  

* I'm thinking maybe the base64 value is actually a file name because when I uploaded a file in the uploads.friendzone.red domain it gave me a date/time value in epoch time.  

* Maybe I have to change my time zone to another one so that I can get something?  
* If I use one of these usernames `Known Usernames .. administrator, guest, krbtgt, domain admins, root, bin, none` supposing they're coming from the server and not from the tool itself, I might be able to get more info than running `enum4linux` with a blank username and password. These usernames seem to be from the tool itself.
* I can `put` a file in the share `Development` as admin. This will allow me to upload a shell. What is left would be to access this shell and execute it.
* I found an LFI in the `pagename` parameter but only when using PHP Wrappers I used this line of code `pagename=php://filter/convert.base64-encode/resource=dashboard` which returns the code of the php page I provide to it and thus, I used it to check dashboard's (the current page's code to see how to deal with the parameters). I got this code   
```php
<?php

//echo "<center><h2>Smart photo script for friendzone corp !</h2></center>";
//echo "<center><h3>* Note : we are dealing with a beginner php developer and the application is not tested yet !</h3></center>";
echo "<title>FriendZone Admin !</title>";
$auth = $_COOKIE["FriendZoneAuth"];

if ($auth === "e7749d0f4b4da5d03e6e9196fd1d18f1"){
 echo "<br><br><br>";

echo "<center><h2>Smart photo script for friendzone corp !</h2></center>";
echo "<center><h3>* Note : we are dealing with a beginner php developer and the application is not tested yet !</h3></center>";

if(!isset($_GET["image_id"])){
  echo "<br><br>";
  echo "<center><p>image_name param is missed !</p></center>";
  echo "<center><p>please enter it to show the image</p></center>";
  echo "<center><p>default is image_id=a.jpg&pagename=timestamp</p></center>";
 }else{
 $image = $_GET["image_id"];
 echo "<center><img src='images/$image'></center>";

 echo "<center><h1>Something went worng ! , the script include wrong param !</h1></center>";
 include($_GET["pagename"].".php");
 //echo $_GET["pagename"];
 }
}else{
echo "<center><p>You can't see the content ! , please login !</center></p>";
}
?>
```
* It should've occurred to me that there's a possibility of LFI in both parameters because they both take a file as a value but I was so focused on the timezone thing and the hints and the stuff I read in the forum that I stopped thinking of anything other than the stuff I was reading that didn't help much.  
* I think the image_id parameter might be the one with the LFI.
* I have rwx to this directory and the roots owns it but I'm still not sure how this could be useful `drwxrwx--T  2 root sambashare   4096 Oct  6  2018 usershares`.  
* This directory `drwx-wx-wt  2 root root 4096 Jan 30  2018 sessions` gave me permission denied when I tried to run the cron that the root is obvioulsy running which is `/usr/lib/php/sessionclean`.  

```bash
#!/bin/sh -e
#
# sessionclean - a script to cleanup stale PHP sessions
#
# Copyright 2013-2015 Ondřej Surý <ondrej@sury.org>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

SAPIS="apache2:apache2 apache2filter:apache2 cgi:php@VERSION@ fpm:php-fpm@VERSION@ cli:php@VERSION@"

# Iterate through all web SAPIs
(
proc_names=""
for version in $(/usr/sbin/phpquery -V); do
    for sapi in ${SAPIS}; do
        conf_dir=${sapi%%:*}
        proc_name=${sapi##*:}
        if [ -e /etc/php/${version}/${conf_dir}/php.ini ]; then
            # Get all session variables once so we don't need to start PHP to get each config option
            session_config=$(PHP_INI_SCAN_DIR=/etc/php/${version}/${conf_dir}/conf.d/ php${version} -c /etc/php/${version}/${conf_dir}/php.ini -d "error_reporting='~E_ALL'" -r 'foreach(ini_get_all("session") as $k => $v) echo "$k=".$v["local_value"]."\n";')
            save_handler=$(echo "$session_config" | sed -ne 's/^session\.save_handler=\(.*\)$/\1/p')
            save_path=$(echo "$session_config" | sed -ne 's/^session\.save_path=\(.*;\)\?\(.*\)$/\2/p')
            gc_maxlifetime=$(($(echo "$session_config" | sed -ne 's/^session\.gc_maxlifetime=\(.*\)$/\1/p')/60))
            
            if [ "$save_handler" = "files" -a -d "$save_path" ]; then
                proc_names="$proc_names $(echo "$proc_name" | sed -e "s,@VERSION@,$version,")";
                printf "%s:%s\n" "$save_path" "$gc_maxlifetime"
            fi
        fi
    done
done
# first find all open session files and touch them (hope it's not massive amount of files)
for pid in $(pidof $proc_names); do
    find "/proc/$pid/fd" -ignore_readdir_race -lname "$save_path/sess_*" -exec touch -c {} \; 2>/dev/null
done ) | \
    sort -rn -t: -k2,2 | \
    sort -u -t: -k 1,1 | \
    while IFS=: read -r save_path gc_maxlifetime; do
        # find all files older then maxlifetime and delete them
        find -O3 "$save_path/" -ignore_readdir_race -depth -mindepth 1 -name 'sess_*' -type f -cmin "+$gc_maxlifetime" -delete
    done

exit 0
```
<br/><br/>  


## <span style="color:#adadff">How Did I Own This Shit 😎🥳  

<br/><br/>



## <span style="color:#adadff">Where I Got Stuck?😡😧  


<br/><br/>



## <span style="color:#adadff">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:#adadff">Writeups ✍🏽📓   


<br/><br/>

<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->