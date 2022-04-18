# Files  

##  What is a file system?  
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

## Why Do File Systems Exist?   
**The first thing** file systems exist for is something that they provide which is called *namespace* which defines how a file should be named. It also defines the logical structure of the data on the disk, such as the use of directories that are used to organize files instead of them being like a huge conglomeration of files.  

**The second thing** that file systems provide is what we call *metadata structure* which provides logical foundation for the namespace which includes:
1) The data structures required to make a hierarchical directory structure.
2) Structures that maintain the files and directories' names.  
3) Information about the files such as their size and times they were created, modified or last accessed and the location or locations of the data belonging to the file on the disk.  

<br/><br/>

## APIs (Application Programming Interface) & Filesystems   

Filesystems need APIs to access system function calls and these functions manipulate the filesystem objects like files and directories.  
They provide the ability to create, move and delete files.  

<br/><br/>

## Tree of Directories in Linux    

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

## What Does Each Directory Do?  

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


## Robots.txt  

<blockquote>
The file robots.txt is used to give instructions to web robots, such as search engine crawlers, about locations within the web site that robots are allowed, or not allowed, to crawl and index.  
The presence of the robots.txt does not in itself present any kind of security vulnerability. However, it is often used to identify restricted or private areas of a site's contents. The information in the file may therefore help an attacker to map out the site's contents, especially if some of the locations identified are not linked from elsewhere in the site. If the application relies on robots.txt to protect access to these areas, and does not enforce proper access control over them, then this presents a serious vulnerability.
</blockquote>  

 <br/><br/>   


 * To check if the user have access to use sudo, especially that sometimes a user can have access to sudo a specific command and not everything, we can use this command `sudo -l` which should open the sudoers file unless we don't have privilege to do so.   


  


shadow file

## Significant Files in /etc   
Info about the directory /etc itself  

It's name was meant to be "et cetera" because it was the place that the administrators would put any file they were not sure where to put.  
But nowadays, it more like means "Everything to configure" as it contains almost all system-wide configuration files.  
E.g. The files that contain the name of the system, the users and their passwords, the names of machines on your network.  

### ./passwd  
* It's where all the user's info is stored except for the password. It might have an indication if the user has a password or not, the shell the user can use ( I think, I should check this ), the id of the user.  
* The passwd file usually contains user account information in the following format(which is the kali user on my VM)  
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



### ./shadow   
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


### ./hosts  
### ./proxychains.conf  
  * The configurations of `proxychains` are stored in this config file. We can edit this file to set a proxy for the `proxychains` command to use. 


## .htpasswd

* `.htpasswd` this file is used for basic HTTP authentication. 

* The local file inclusion vul in the http service allowed me to access the `.htpasswd` file which, it seems, contains usernames and password. Indeed, it did contain the username and password of a user named Mike. I'll try and ssh with them. Damn just remembered there's no ssh on the host.
mike:Sheffield19  

## Files with `.bak` extension  
* In computing, ".bak" is a filename extension commonly used to signify a backup copy of a file.  

## `wget` to download files  
* We can use `wget` to download files from my box to the victim and from the victim to me.   

## Zip Files  
* We can use `zcat` to extract .gz files.
* `tar -xvf [FILE NAME]` to extract from the archive file.  

## SSH Files  
* All SSH keys should have a privilege of 600.

* We can create a file in the `.ssh` in my home as an attacker called "config" which can help me with sshing to hosts by providing some info on how to ssh to that specific host like the following  
```console
Host  [ANY NAME]
        HostName [HOST'S IP ADDRESS]
        User [USER TO SSH WITH]
        IdentityFile [/path/to/ssh/key/including/the/key]
```  

## `.viminfo` file  
* The file `.viminfo` could give me some more information (If it did not have the size of zero).


## Shadow file and Passwd file  
* We can combine these two files into one using `unshadow /etc/passwd /etc/shadow > password.txt`   



<br/><br/>

## File Transfer  

### Turn file into base64 Representation   

* Convert file into base64 with this code  

  ```
  base64 -w0 16162020_backup.zip
  ```  

* Then convert it back on the reciever with this code   

  ```
  echo "UEsDBAoAAAAAAIUDf0gAAAAAAAAAAAAAAAA<SNIP>" | base64 -d -w0 > backup.zip
  ```

<!--@nested-tags:general_knowledge/files,pen_testing/files-->