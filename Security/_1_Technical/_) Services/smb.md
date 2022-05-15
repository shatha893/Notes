* What is SMB?  
<blockquote>
The Server Message Block protocol (SMB protocol) is a client-server communication protocol used for sharing access to files, printers, serial ports and other resources on a network. It can also carry transaction protocols for interprocess communication. Over the years, SMB has been used primarily to connect Windows computers, although most other systems -- such as Linux and macOS -- also include client components for connecting to SMB resources.
</blockquote>

* How to use smbclient to view available shares:  
```
smbclient -L \\\\10.129.158.38 -U 'administrator'
```

* To access a share just remove the `-L` and specify the name of the share:  
```
smbclient \\\\10.129.158.38\\ADMIN$ -U 'administrator'
```  

* The `$` means that this share is an administrative share.  

* We can use the command `get` inside the smb prompt to download files on our own box. 


* Command `smbmap -H <IP ADDRESS> -R` where the `-H` is for host and the `-R` is for recursive. But what is `smbmap` used for.