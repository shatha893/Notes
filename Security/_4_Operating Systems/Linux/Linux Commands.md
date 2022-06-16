# <span style="color:#005688">Linux Commands</span>  


| Command     |What Does it Do?|
| ----------- | ----------- |
| ```whoami```     |Prints the name of the current user.|
| ```pwd``` |"Print Working Directory" prints the current directory I'm in.|
| ```ls [OPTIONS] [FILES]```   |Alone, prints the files and directories in the current directory.<br/> As shown we can add file path to print directories in that file and we can add specific options (`-a` to show hidden files, or `-l` to print files and directories in a long list format (with permissions,...etc). ) |
| ```cd [DESTINATION] ```  | "Change Directory" to the `[DESTINATION]` directory.<br/>If we use `cd -` we can go back to the previous working directory.   |
| ```cat [FILE NAME]```   |Open the file with name `[FILE NAME]` <br/>We can color the output of this command by using something like this `cat [FILE] | jq` (This is to color the output as json).|
| ```echo "random shit"``` |  It literally does what it's called it echoes "outputs" the string in our case `"random shit"` or a file's content. We can use it like this ```echo [STRING] > [NEW FILE NAME]``` to create a new file with content `[STRING]` or we can use it like this ```echo [STRING] >> [OLD FILE NAME]``` to append content to the file [^1]<br/>We can also use it to print out an Environmental variable `echo $[ENVIRONMENT VARIABLE]`. |
| ```cp [/path/to/file] [destination/to/newpath/newname]``` |"copy" copy a file from the first path provided into the second path and you can change the file name in the new path. <br/> We can also use it for <b>renaming</b> files by copying them into the same destination but with new name|
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
|`sudo adduser [USERNAME]`|`sudo` means "superuser" it allows a user to run commands that are above its privilage like `adduser` which adds a user. <br/> The new user will be created in the `home` directory because as we know users ***don't have all the privileges that the root has***.|
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
|`whatweb [IP ADDRESS]`|It can be used to get info on the web server, if it exists, on the specified IP address.|  
|`nice -n [NICENESS VALUE] [COMMAND]`|We can use it before commands to give the processes of some commands priority over others.<br/>A negative value is most likely to receive priority.<br/>A positive value is the least likely to receive priority.|  
|`xxd`|We can convert Hex to ASCII using this command.|
|`proxychains`|We can obscure our traffic by using mulitple proxies with this command.<br/>The configurations of `proxychains` are stored in a config file `/etc/proxychains.conf`. We can edit this file to set a proxy for the `proxychains` command to use. |
|`xxd`|We can convert Hex to ASCII using this command.|
|`python` or `python3`|Runs Python scripts.|
|`php`|Runs Php scripts.|
|`sed`|It's mostly used to replace inner strings with other values. E.g. sed 's/unix/linux' geekfile.txt in this command the word unix is replaced with linux.|
|`sudo`|It's used when a user is allowed to run specific commands with higher privileges but without always having these privileges. <br/>The user with the ability to use sudo should be included in the sudeors file.|
|`rest-server [/TMP/RESTIC] --no-auth --debug`|Creates a restful server.<br/>We added the `--debug` option to see if the request was delivered successfully or if there was a problem.|
|`strings`|It extracts readable strings from a file|
|`script`|Makes typescript or records all the terminal activities.|

<br/><br/>   



* Using aliases to make command shortcuts of some kind (Do more research onto it)


<!-- FOOTNOTES -->
<!-- [^3]:Check out this [link][2] for a brief explanation on each directory and what is it for.  -->



<!-- LINKS -->
<!-- [1]:https://ryanstutorials.net/bash-scripting-tutorial/bash-script.php

[2]:https://www.serverkaka.com/2018/01/key-locations-in-linux-file-system_21.html -->