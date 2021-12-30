<link href="../../styles.module.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Encode+Sans+SC&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">


## <span class="copyright">Useful Shit<span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

_________________________


<span class="date">Last Updated: 26/Aug/2021</span> 



### <span class="useful_shit subtitle">SQLMAP  
* So I'm taking the machine "Cronos" as my example here because it's the first time I use `sqlmap` in.
* We can enumerate the databases names by writing the following line:
  ```console
  sqlmap -u [LINK OF VICTIM] --data='username=&password=' --method POST --dbs --batch
  ```
* In addition to the databases' names the previous line also provided me with the version of the SQL on the server. 
* `--batch` answers the questions for me with the default. 
<br/>
* We can also get the tables' names by writing the following line:
  ```console
  sqlmap -u [LINK OF VICTIM] --data="username=&password=" --method POST -D [DATABASE NAME] --dump all --batch
  ```
* When using this command I also got the content of the admin table. 
* Sqlmap seems to use the SQLi vulnerability in the application to gain access to:
  * Determine the schema of the database (database, table and column names).
  * Dump data from tables.
  * Potentially upload or download files to the database server machine.
  * Perform out-of-band tests.
  * Dump usernames, password hashes, privileges and roles.
  * Pass hashes off to a password cracker for a dictionary attack.
  * Perform "blind" and "boolean-based" sql injection attacks (if the web application doesn't return any error messages then sqlmap is the most time-saving tool in this case).
  * Potentially even launch a remote shell on the database server.

 <br/><br/> 

### <span class="useful_shit subtitle">Robots.txt  

<blockquote>
The file robots.txt is used to give instructions to web robots, such as search engine crawlers, about locations within the web site that robots are allowed, or not allowed, to crawl and index.  
The presence of the robots.txt does not in itself present any kind of security vulnerability. However, it is often used to identify restricted or private areas of a site's contents. The information in the file may therefore help an attacker to map out the site's contents, especially if some of the locations identified are not linked from elsewhere in the site. If the application relies on robots.txt to protect access to these areas, and does not enforce proper access control over them, then this presents a serious vulnerability.
</blockquote>  

 <br/><br/> 


### <span class="useful_shit subtitle">DNS Zone Transfer  
* Definition?
  Is the process of copying the contents of the zone file on a primary DNS server to a secondary DNS server.  
  And this way fault tolerance is provided.

 <br/><br/> 



* The bitch machine Cronos keeps making problems for me and I can't seem to open the admin some times. So I wasn't able to test the ways I'll be mentioning next (I got them from this <a href="https://blog.ropnop.com/upgrading-simple-shells-to-fully-interactive-ttys/">website</a>)  



### <span class="useful_shit subtitle">Nmap  

* We can use the option `-oA [FILE NAME]` to save the nmap output in a file in the working directory.
  ```console
  nmap -p- --open -oA nibbles_full_tcp_scan 10.129.42.190
  ``` 

 <br/><br/> 

### <span class="useful_shit subtitle">Web Testing  

* We can use the command `whatweb [IP ADDRESS]` to see info about the web server.


