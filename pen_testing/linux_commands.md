# A Little Bit About Linux
 <Img src="https://daylifetips.com/wp-content/uploads/2021/01/linux-use.png">
<br/>

## <span style="color:	#4B0082">Linux's Terminal Commands</span>


###  The Commands
<br/>

| Command     |What Does it Do?|
| ----------- | ----------- |
| ```whoami```     |Prints the name of the current user.|
| ```pwd``` |"Print Working Directory" prints the current directory I'm in.|
| ```ls [OPTIONS] [FILES]```   |Alone, prints the files and directories in the current directory.<br/> As shown we can add file path to print directories in that file and we can add specific options (`-a` to show hidden files, or `-l` to print files and directories in a long list format (with permissions,...etc). ) |
| ```cd [DESTINATION] ```  | "Change Directory" to the `[DESTINATION]` directory.   |
| ```cat [FILE NAME]```   |Open the file with name `[FILE NAME]` |
| ```echo "random shit"``` |  It literally does what it's called it echoes "outputs" the string in our case `"random shit"` or a file's content. We can use it like this ```echo [STRING] > [NEW FILE NAME]``` to create a new file with content `[STRING]` or we can use it like this ```echo [STRING] >> [OLD FILE NAME]``` to append content to the file [^1] |
| ```cp [/path/to/file] [destination/to/newpath/newname]```  |"copy" copy a file from the first path provided into the second path and you can change the file name in the new path. <br/> We can also use it for <b>renaming</b> files by copying them into the same destination but with new name|
|`mv [ /path/to/file ] [ destination/path ]`|"move" the file from a directory to another|
|`mkdir [DIRECTORY NAME]`|"make directory" create a directory by name `[DIRECTORY NAME]`|
|`rmdir [DIRECTORY NAME]`| remove a directory by name `[DIRECTORY NAME]`. We can also use `rm -r [DIRECTORY NAME]`. <br/> This command does not delete the directory unless it's **empty**.|
|`rm [FILE NAME]`|Remove a file by name `[FILE NAME]`|
|`touch [FILE NAME]`|Create an empty file|
|`nano [FILE NAME]`|Edit file using CLI editor|
|`mousepad [FILE NAME]`|Edit file using GUI editor|
|`history`|Show the last 500 commands I've entered|
|`clear`|Clears the terminal|
|`bash -i [SCRIPT]`|Execute a [bash script][1]|
|`find [/start/looking/from/here] -name [FILE NAME]`|Finds a specific file for me |
|`sudo adduser [USERNAME]`|`sudo` means "superuser" it allows a user to run commands that are above its privilage like `adduser` which adds a user. <br/> The new user will be created in the `home` directory because as we know users ***don't have all the privilages that the root has***.|
|`sudo deluser [USERNAME]`|deletes the user whose name is provided|
|`sudo addgroup [GROUP NAME]`|Add a group|  
|`chmod [PERMISSIONS] [FILE NAME]`|Change Permissions of a specific file for (owner,group &others)|  
|`su [USER NAME]`|Switch to the user with name [USER NAME]. <br/> From what I understood I can switch to the root using this command.|  
|`date`|Shows me the date and time.|  
|`who`|Tells me who's the current user.|  
|`wc [FILE NAME]`|Counts the number of lines,words, characters and bytes in the given file.|  
|`zip -r [NAME OF DIRECTORY AFTER COMPRESSION] [NAME OF DIRECTORY TO BE COMPRESSED]`|To compress a directory.|  
|`unzip [ZIPPED DIRECTORY]`|To decompress compressed directories.|  
|`gedit [FILE NAME]`|Edit the file using Linux's text editor gedit.|  
<br/>

### <span style="color:#4B0082">Some Extra Notes </span>
<br/>

* *Why the existence of `sudo` ?* <br/>
So, if you think about it, the privilages of the **root** are for the root and only for it for a reason, so why make something like "sudo"? 
What I think is the case here is that sometimes we want this user to use a privilage higher than he/she's usually allowed but not always have these privilages. Also, the user with the ability to use `sudo` should be included in the `sudeors` file.

 * *To execute any shell...* <br/>
   We can use `./` before the name of the shell.

* *More on `chmod`* [^2] <br/>
   There are two approaches used with the `chmod` command:<br/>

  1. The Integer Approach.<br/>
      ```
      chmod 750 majd.bin
      ```
      The first number -> 7 is the permission for owner the second number -> 5 is the group permissions and the last -> 0 is others' permissions.

      The numbers represent the degree of permissions: <br/>

      | Permission Degree|Explanation|
      | ----------- | ----------- |
      | 7   |Full|
      | 6   |r+w (read+write)|
      | 5   |r+x (read+execute)|
      | 4   |r (read)|
      | 3   |w+x (write+execute)|
      | 2   |w (write)|
      | 1   |x (execute)|
      | 0   |none|

   <br/>

  2. The, let's call it, Letters Approach.<br/>
  In this approach we represent the **owner** with a  **u**, the **group** with a **g**, **others** with **o** and **all** with **(infinte)**.

     The **+** represents the **adding**, **-** represents the **removing** and **=** represents the **giving**.

     e.g.
     ``` 
     chmod u-r [FILE NAME]
     ```
     In the example above the permission for the owner to **read** is removed.

* *What do we mean when we say "Execute a directory"?* <br/>
We execute a directory when we open it `cd [DIRECTORY NAME]`.

* *Why is there something such as privilages in Linux?* <br/>
Because Linux is a multisharing environment system. So, multiple users might be using the same, e.g. app, at once and I don't want all users to have the same privilages on this app.

## <span style="color:#4B0082">Linux's File System Structure</span>  

Linux has a hierarchical file system as illustrated in the following image. [^3]

The first level of directories inside the root directory (`/`) are called *"Configuration Files"* and they're for the OS not the user.  

<img src="https://1.bp.blogspot.com/-UQ7-sWd_J4w/WmhKIFx7_fI/AAAAAAAAHIE/tixi5SsyI5YzoJygq_JQKL50axe2cAcrQCLcBGAs/s1600/Untitled.png">  


<!-- FOOTNOTES -->
[^1]: I'm not sure if it replaces the content with the provided content or does it add to it? <span style='color:red'>(Check it out!)</span>
[^2]: Do we consider it as a privilage excalation? Or does privilage excalation only happen when it's unauthorized.

[^3]:Check out this [link][2] for a brief explanation on each directory and what is it for.



<!-- LINKS -->
[1]:https://ryanstutorials.net/bash-scripting-tutorial/bash-script.php

[2]:https://www.serverkaka.com/2018/01/key-locations-in-linux-file-system_21.html
