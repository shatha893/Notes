# <span style="color:#adadff">Machine #26 FriendZone</span>  



## <span style="color:#adadff">Checklist 🤓   
- [x] AXFR zone transfer.
- [ ] ~~Break into the login somehow.~~
  - [ ] ~~Try default credentials (like admin/admin)~~

<br/><br/>


## <span style="color:#adadff">What Do We Have? 🤔🤔 
* We have a relatively good number of services: ftp, ssh, dns, http, https, and smb
* Friend Zone Escape Software
* Found this email on the http website `info@friendzoneportal.red` a dns server being one of the open services leaves me with the conclusion that "friendzoneportal.red" could be our domain.
* FTP version is `vsftpd 3.0.3`
* Found a zone transfer vulnerability which I exploited as follows (This kind of vulnerability could be exploited to gain information)
  * There's a dns service open on the victim so what I did is I added the ip of the machine (victim) to my `/etc/resolv.conf` file (before the nameserver that already existed) which meant that dns domains will be taken from this address now which allowed me to use this command `dig axfr friendzoneportal.red` without specifying the nameserver so that it would use the one in the `resolv.conf` file and this way I got the information I wanted without even bruteforcing for subdomains. The following is what I saw to be useful of the information I got  
  ```
  admin.friendzoneportal.red
  files.friendzoneportal.red
  imports.friendzoneportal.red
  vpn.friendzoneportal.red
  ```  

* Got an admin page on this subdomain `admin.friendzoneportal.red` only on the https service the http redirects me to the same page each time.
* The login image on the admin subdomain is just frustrating. It says the admin page hasn't been developed yet.
* Found another domain with the name `friendzone.red` when I tried to dig it `dig axfr friendzone.red @friendzoneportal.red` from the certificate of the https service.  
```
friendzone.red
administrator1.friendzone.red
hr.friendzone.red
uploads.friendzone.red
```  

```
bmOKpuihQ 516517768779 T4 pTl4yE Z
nc                        
```  

* Found an upload page in the domain `uploads.friendzone.red`.
* The subdomain `administrator1.friendzone.red` also opened up to a login page ( Weird that they weren't working before )
<br/><br/>


## <span style="color:#adadff">Random Notes👀

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