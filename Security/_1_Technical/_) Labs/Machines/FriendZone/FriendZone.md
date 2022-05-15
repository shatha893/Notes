# <span style="color:#adadff">Machine #26 FriendZone</span>  



## <span style="color:#adadff">Checklist 🤓   
- [x] AXFR zone transfer.
- [ ] ~~Break into the login somehow.~~
  - [ ] ~~Try default credentials (like admin/admin)~~
- [ ] Bruteforce all the domains just to be sure.
- [ ] I will try to login into ftp anonymously or with the admin creds I have into all the subdomains I have.

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
  * And indeed I found the admin's creds in the file `admin:WORKWORKHhallelujah@#`
<br/><br/>


## <span style="color:#adadff">Random Notes👀  

* I'm thinking maybe the base64 value is actually a file name because when I uploaded a file in the uploads.friendzone.red domain it gave me a date/time value in epoch time.  

* Maybe I have to change my time zone to another one so that I can get something?  
* If I use one of these usernames `Known Usernames .. administrator, guest, krbtgt, domain admins, root, bin, none` supposing they're coming from the server and not from the tool itself, I might be able to get more info than running `enum4linux` with a blank username and password. These usernames seem to be from the tool itself.
* I can `put` a file in the share `Development` as admin. This will allow me to upload a shell. What is left would be to access this shell and execute it.
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