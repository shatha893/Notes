# <span style="color:#adadff">Machine #28 Previse</span>  


## <span style="color:#adadff">How Did I Own This Shit 😎🥳   
1. We have a login page so the first thought I had was to do directory bruteforce to find out if there were any hidden files or directories.
2. Just like I expected there were hidden files and files that had no kind of access control. I was able to access the files just by visiting them and then changing the http code from `302 found` into `200 ok`.
3. This lead me to a page called `accounts.php` which had a form that could allow me to create a user.
4. I created a user and then downloaded a "backup" of the site's code that was uploaded in a files section on the website.
5. So while inspecting the php code you realize that there could be the possibility of command injection into the place where we get the logs of who opened the files. There's a parameter called `delim` or sth like that so we could easily just inject code after it since it took input from the user and put it right into a `exec` function.
6. This gets me a shell with `www-data` privilege. 
7. While inspecting the source code before I noticed it contained credentials for a mysql database.
8. So I logged in with the creds into the mysql database `mysql -u root -p`.
9. Since I'm root in the database I was able to read everything including the username and password of user `m4lwhere` but the password was hashed and salted.
10. I was easily able to crack the hash with `hashcat -m 500 [HASH] [PATH TO DICTIONARY]`.
11. After that what was left is to get root. I was able to get it through a vulnerability explained as this CVE `CVE-2021-4034`
12. But that obviously was not the intended way. The intended way was to use the file that the user I had could sudo into to create an executable of my own that had a reverse shell because the `gzip` inside the script that I could sudo into was not written in it's full path which allowed me to inject a path of my own into the PATH environmental variable and this way when we execute the script as sudo it will look into the new environmental variable and execute my `gzip` not the original one.

<br/><br/>



## <span style="color:#adadff">Where I Got Stuck?😡😧  


<br/><br/>



## <span style="color:#adadff">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:#adadff">Writeups ✍🏽📓   



<br/><br/>

<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->