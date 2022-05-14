<br/><br/><br/>

## <span style="color:#005688">More & More Directories  

  <blockquote cite="askUbuntu">
  Essentially, a directory is just a special file, which contains list of entries and their ID.
  </blockquote>
  <br/>

<img src="https://lcom.static.linuxfound.org/sites/lcom/files/standard-unix-filesystem-hierarchy.png">  

<br/><br/>

## <span style="color:#005688"> Virtual Directory System

  <blockquote>
  A Virtual Directory System is a way of organizing files and directories in a computer operating system. The reason why it’s called “virtual” is that there’s no actual physical component – on Window, you have your “C:” drive, “D:” drive, and so on. On Linux, all physical disks are treated as files in your virtual directory system. This is where the phrase “everything is a file” comes from. Even the disk in your system that you’re working off of for your operating system is treated as a file.
  </blockquote>  

<br/><br/>

## <span style="color:#005688"> Symbolic Link / Soft Link  

* In Linux Operating System there are two types of links *hard links* and *soft links*. What is the difference?
  * *Hard Links* can be thought of as additional names for existing files. They are one or more files with the same inode  
  * *Soft Links* are something like a shortcut in Windows. It's an indirect pointer to a file or directory.
  
* We can use the command `ln` to create symbolic links with the option `-s` for symbolic.

<br/><br/>

## <span style="color:#005688"> Inode   

  <blockquote>
  The inode (index node) is a data structure in a Unix-style file system that describes a file-system object such as a file or a directory. Each inode stores the attributes and disk block locations of the object's data.[1] File-system object attributes may include metadata (times of last change,[2] access, modification), as well as owner and permission data
  </blockquote>

<br/><br/>



## <span style="color:#005688">Environment Variables  

  * To view the contents of an env variable  
    ```console
    echo $[ENV VARIABLE NAME]
    ```  

  * For the change in  the contents of a variable to be for all we have to export it  
    ```console
    export [ENVE VAR]
    ```  
 <br/><br/>  



  
## <span style="color:#005688">What does Focal Fossa mean?  
Ubuntu code names contain 2 parts the first is an adjective and the second is an animal name. That being said "Focal" is an adjective that means "Focus" and "Fossa" is an animal name.  

 <br/><br/>   



 

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

* *Why is there something such as privileges in Linux?* <br/>
Because Linux is a multisharing environment system. So, multiple users might be using the same, e.g. app, at once and I don't want all users to have the same privileges on this app.

<br/><br/>

## <span style="color:#005688">Linux's File System Structure</span>  

Linux has a hierarchical file system as illustrated in the following image. [^3]

The first level of directories inside the root directory (`/`) are called *"Configuration Files"* and they're for the OS not the user.  

<img src="https://1.bp.blogspot.com/-UQ7-sWd_J4w/WmhKIFx7_fI/AAAAAAAAHIE/tixi5SsyI5YzoJygq_JQKL50axe2cAcrQCLcBGAs/s1600/Untitled.png">  


<br/><br/>


## <span style="color:#005688">Using `2>/dev/null`  
* We can put it at the end of each command if we want to show only the successful output. 

<br/><br/>

## <span style="color:#005688">Permissions in Linux  
* If a directory has only a read permission then you can list its contents and that's all you can't `cd` to it.
* If it only has write permission you literally can do nothing because write permission alone isn't enough to add/delete files but it has to be accompanied with an excute permission to be able to do such things.
* If it only has execute permissions it means that I can `cd` to it but I can't list its contents which means that if somehow I figure out the names of the files I can view them if their permissions are different.
* So (I have to make sure of this but) I think that when the directory is created and we add files inside of it they should inheret the permissions of their parent directory but if a user changes the permissions later the permissions of the files won't get changed.
* Directories are just files that contain names of other files.