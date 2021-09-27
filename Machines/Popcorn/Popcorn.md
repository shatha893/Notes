* nmap results
```console 
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http
```

* Some weird results in the full nmap scan  
```
PORT  	STATE	SERVICE
22/tcp	open 	ssh
80/tcp	open 	http
28198/tcp filtered unknown
37379/tcp filtered unknown
```
* Forget about it seems like they're closed.

* Interesting stuff after gobustering 

```
/rename
/test
/test.php
/torrent
```

* Found this in `/rename`  

    <img src="rename_popcorn.png">  

* There's a Linux distribution called Linux Popcorn   

    <img src="linux_popcorn.png">


* Not sure if relevant  

<img src="notSureIfRelevant.png">  


* Torrent Hoster exploit 

```html
<center>
 Powered by Torrent Hoster
   <br />
<form enctype="multipart/form-data" action="http://10.10.10.6/torrent/upload.php" id="form" method="post" onsubmit="a=document.getElementById('form').style;a.display='none';b=document.getElementById('part2').style;b.display='inline';" style="display: inline;">
    	<strong>&#65533;&#65533;&#65533;&#65533; &#65533;&#65533;&#65533; &#65533;&#65533;&#65533;&#65533;&#65533; &#65533;&#65533; &#65533;&#65533;:</strong> <?php echo $maxfilesize; ?>&#65533;&#65533;&#65533;&#65533;&#65533;&#65533;&#65533;&#65533;<br />
<br>
    	<input type="file" name="upfile" size="50" /><br />
<input type="submit" value="&#65533;&#65533;&#65533; &#65533;&#65533;&#65533;&#65533;&#65533;" id="upload" />
    	</form>
    	<div id="part2" style="display: none;">&#65533;&#65533;&#65533; &#65533;&#65533;&#65533; &#65533;&#65533;&#65533;&#65533;&#65533; .. &#65533;&#65533; &#65533;&#65533;&#65533;&#65533; &#65533;&#65533;&#65533;&#65533;&#65533;</div>
</center>
```  
* I think this exploit is the answer but I'm not sure where exactly to put this bloody code. I'm not sure I entirely get what we're doing. Mounting upload what the exploit is called so is it like making a new upload file?
* I've put the code in an html file

* Found an admin password in an sql dump but it's sadly not working `INSERT INTO `users` VALUES (3, 'Admin', '1844156d4166d94387f1a4ad031ca5fa', 'admin', 'admin@yourdomain.com', '2007-01-06 21:12:46', '2007-01-06 21:12:46');`. 
* The password is hashed with MD5 and it's `admin12`.  

* Found these files in `torrent` directory

    ```
    /admin            	(Status: 301) [Size: 316] [--> http://10.10.10.6/torrent/admin/]                                    /browse           	(Status: 200) [Size: 9278]                                 	 
    /browse.php       	(Status: 200) [Size: 9278]                                 	 
    /comment.php      	(Status: 200) [Size: 936]                                  	 
    /comment          	(Status: 200) [Size: 936]                                  	 
    /config.php       	(Status: 200) [Size: 0]                                    	 
    /config           	(Status: 200) [Size: 0]                                    	 
    /css              	(Status: 301) [Size: 314] [--> http://10.10.10.6/torrent/css/]  
    /database         	(Status: 301) [Size: 319] [--> http://10.10.10.6/torrent/database/]
    /download         	(Status: 200) [Size: 0]                                       	 
    /download.php     	(Status: 200) [Size: 0] 
    /edit             	(Status: 200) [Size: 0]                                       	 
    /edit.php         	(Status: 200) [Size: 0]                                       	 
    /health           	(Status: 301) [Size: 317] [--> http://10.10.10.6/torrent/health/]  
    /hide             	(Status: 200) [Size: 3765]                                    	 
    /images           	(Status: 301) [Size: 317] [--> http://10.10.10.6/torrent/images/]  
    /index            	(Status: 200) [Size: 11356]                                   	 
    /index.php        	(Status: 200) [Size: 11356]                                   	 
    /js               	(Status: 301) [Size: 313] [--> http://10.10.10.6/torrent/js/] 	 
    /lib              	(Status: 301) [Size: 314] [--> http://10.10.10.6/torrent/lib/]	 
    /login            	(Status: 200) [Size: 8371]                                    	 
    /login.php        	(Status: 200) [Size: 8371]                                    	 
    /logout           	(Status: 200) [Size: 182]                                     	 
    /logout.php       	(Status: 200) [Size: 182]                                     	 
    /preview          	(Status: 200) [Size: 28104]                                   	 
    /readme           	(Status: 301) [Size: 317] [--> http://10.10.10.6/torrent/readme/]  
    /rss.php          	(Status: 200) [Size: 964]                                     	 
    /rss              	(Status: 200) [Size: 964]                                     	 
    /secure           	(Status: 200) [Size: 4]                                       	 
    /secure.php       	(Status: 200) [Size: 4]                                       	 
    /stylesheet       	(Status: 200) [Size: 321]                                     	 
    /templates        	(Status: 301) [Size: 320] [--> http://10.10.10.6/torrent/templates/]
    /thumbnail.php    	(Status: 200) [Size: 1789]                                     	 
    /thumbnail        	(Status: 200) [Size: 1789]                                     	 
    /torrents         	(Status: 301) [Size: 319] [--> http://10.10.10.6/torrent/torrents/]
    /torrents.php     	(Status: 200) [Size: 6477]                                     	 
    /upload_file      	(Status: 200) [Size: 0]                                        	 
    /upload           	(Status: 301) [Size: 317] [--> http://10.10.10.6/torrent/upload/]   
    /upload_file.php  	(Status: 200) [Size: 0]                                        	 
    /upload.php       	(Status: 200) [Size: 8357]                                     	 
    /users            	(Status: 301) [Size: 316] [--> http://10.10.10.6/torrent/users/]    
    /validator        	(Status: 200) [Size: 0]                                        	 
    /validator.php
    ```   

    * I should look more into torrents and I dunno more into this torrent hoster eventhough I can't find much about it except this remote file upload exploit that seems to be the right exploit to use but I'm not sure how to use it because I don't fully understand why does it work yet.



* The `test.php` has the phpinfo() page with all php info in it.
* Of course the `/torrent` page has the Torrent Hoster page and it's what contains all the directories above.
* The `/torrent/readme` directory opens up to two files `readme.txt` and `liscense.txt` the readme file contains theat the Torrent Hoster we have is version 2.0 (Exploitdb states that torrent hoster is vulnerable to the "Remount Exploit" whatever its version is. Or at least it hasn't been specified).
* The `/torrent/database` directory has a file called `th_database.sql` when you open it shows me the version of phpmyAdmin SQL Dump ---> 2.10.1 and it also gives out an admin password that is useless to me until now.
* Found an sql injection vulnerability in the search bar. I'm thinking if I could add a user of my own and add there privilage as `admin` after all I have the syntax of the insert statement and the structure of the table, its name and the DB's name.(The Admin's password: `d5bfedcee289e5e05b86daad8ee3e2e2`)
