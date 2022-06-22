# <span style="color:[COLOR]">Machine #28 Trick</span>  


## <span style="color:[COLOR]">What Do We Have? 🤔🤔 
* There's a directory called `action.d` seems like I can `rwx` on it because I'm in group `security`.
* What I'm doing now is I'm looking for a file tha executes when I restart the service. But is the files that execute when the service is started the same files that execute when the services are restarted? Not sure I'll experiment with this.


<br/><br/>

## <span style="color:[COLOR]">How Did I Own This Shit 😎🥳  
### User   
1. There was a useless webpage that did nothing ( An HTML page). That was useless.
2. I tried to use `trick.htb` because I noticed a dns service on the machine and it didn't give me anything. But when I tried `dig axfr trick.htb` it showed me that there was another subdomain (Virtual host) that gave me a login page.
3. I tried to see the request and how it's being handled through BurpSuite and noticed that, yet again, the vulnerability of the redirect that redirects but shows the page, which allows me to manually change the http code int `200 Ok` and read pages I'm not supposed to read exists.
4. Next there was a page called users that I could open which had a username but when you edit this user (and you can edit the user) you get back all the data of it including their password which allows me to login.
5. Even if I didn't get back the password I would've been able to change it and thus get into the account and navigate the pages without having to keep chaning the http code each time I want to do something.   
6. After that I found an obvious sql injection in the parameter `id` in the page where we can view the `employees` probably there was sql injection in other places but this was the place that I got it from.  
7. The database was useless it didn't have anything.   
8. So there was this idea that through an sql query we can write a file into the database and read files through it.  
9. We could've done it manually but I kept getting 500 Internal server error so it was faster through  `sqlmap`. 
10. After that I uploaded a shell on the system but I didn't have privilege to upload on `/var/www/html` so that I can open the shell from the website and I didn't know the path to the other subdomain that I found because most of the time these other subdomains have different path than `/var/www/html`.
11. I kept researching for files that could be important on an nginx web server and found out that log files could give me something and I was, like, why not? I tried to read `/var/log/error.log` I'm not sure of the file name (Check the error log for nginx you should find it anywhere on the internet). Through the error log file I found that the path for the other web server is `/var/www/payroll` and I tried to write a file to it but it didn't work, I didn't have privilege to write on that file either.  
12. So what I did is as follows I read the source code of the page that I suspected had an LFI because it had a `page` parameter and turns out it was vulnerable to LFI but I can only read php files because `.php` gets concatenated to it ( I think there's a way to evade that but I didn't need to do that because I wanted to execute a php file anyway).
13. So I used the LFI to visit the file I uploaded on `/tmp` because it was the only directory I was able to upload to and with that I got a rev shell as `www-data`.  
14. After that we realize that there's another virtual host called `market` that I could open if I provide the right subdomain that wasn't provided from the zone transfer when we first did it. This virtual host was run by michael and if I get a rev shell on it I can get michael.
15. But There was a better idea we came up with which was to get his `id_rsa` since I have an LFI and with that ssh as him and that worked just fine.   
### Root   
16. Now my user is in a group called `security` and users in this group are allowed to edit the directory `action.d` this directory the root copies configuration files to it and deletes them after a while. Still not sure what to do next.  
17. Turns out `fail2ban` is a service that bans after failed attempts to login into multiple stuff including ssh which is what we will be exploiting. Why? Because the file that states the configuration of what to block, how, when and how long the ip should stay blocked `jail.conf` states that it's usually overwritten in the directory `jail.d` and that was true there was a file that overwrote it and it had the banning for ssh enabled.  
18. So what occured to me is to brute force the login of the ssh since such tools (fail2ban) are used to exactly ban people who try to bruteforce their way in.
19. There's a configuration file that executes when the ban happens and I can write to the directory this file is in, which allows me to remove the original file and add a file of my own that had the reverse shell as `actionban=` which means it should execute the reverse shell when I'm banned.  
20. This brings us to the point where I need to trigger the ban so I'll be able to trigger the rev shell.  
21. So I first thought of how to thread commands on the terminal so I could run multiple sshes at the same time because I need to fail 5 times in 10s if I understood correctly.  
22. But then I was like why not use a tool like `hydra` that would do the threading for me and it worked I gave it a list of passwords and the username root and like that I'm root.
<br/><br/>


## <span style="color:[COLOR]">What Did I learn from this Machine?👀  
* Learned about the tool `fail2ban` and how to use it and how it works and how if it was misconfigured or it's configuration files are misconfigured we can exploit it to get root privileges.  
* That I could write and read files through sql injection. This is the first time I know of this.

<br/><br/>
