# <span style="color:#adadff">Machine #26 FriendZone</span>  



## <span style="color:#adadff">Checklist 🤓   
- [x] AXFR zone transfer.
- [ ] ~~Break into the login somehow.~~
  - [ ] ~~Try default credentials (like admin/admin)~~
- [ ] Bruteforce all the domains just to be sure.

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
<br/><br/>


## <span style="color:#adadff">Random Notes👀  

* I'm thinking maybe the base64 value is actually a file name because when I uploaded a file in the uploads.friendzone.red domain it gave me a date/time value in epoch time.
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