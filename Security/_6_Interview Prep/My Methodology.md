# My Hacking Methodology  

* Maybe they might ask me about web security because I told him that the most machines I owned had a web service and needed a web exploit to get access to the system.

* Question: If they ask about finding one way of getting into the system should I stop?
* Answer: No I should not stop because our job is to penetrate the system to find vulnerabilities and not to get access to it. So what I have to do is after I find the first way of getting access to the system if there's another way I should start all over again.

* Maybe I should go around about my methodology just like what I wrote on the resume  


## How do I Approach a Machine?  


### Enumeration and Reconnaissance

* Gather information on the organization of the system I'm trying to gain access to, mostly, using OSINT.  
* Nmap
  * What is it?
  * How do I use it?
  * What options do I use with it?
* Google dorking
  * What is it?
  * How do I use it?
* Web Service Enumeration
  * Trying the normal functionality of the website
  * Looking for versions
  * Hidden directories
  * Source code
  * Cookies and session tokens
  * BurpSuite.
  * SSL Certificates
  * Virtual hosts.
  * Subdomains
  * Bruteforcing (Login pages, hidden directories, subdomains or maybe common files for the specific type of technology we're testing).
  * User enumeration

* If there's a login try with user enumeration.
* First, I start with scanning the machine with nmap to look for open ports. What are the services on these ports, what are the versions of the software use
* Then I start gathering information about the services available with banner grabbing as a beginning.
* Then I go deeper into each service, I mostly solved web machines so I will be talking about exploiting a machine through a web vector.
* I open up the website try to see how it functions normally then I start to look for ways that might allow me to get in or might give me information. 
* I usually look through a set of things like hidden directories (using gobuster), maybe hidden subdomains (also using gobuster), look at the source code, virtual hosts, SSL certificates, cookies or session tokens, also I use BurpSuite to intercept the requests and response and see if there's anything that could indicate a vulnerability or that could expose information.


### Exploitation   

* After finding a vulnerability this is where finding a way to exploit it comes into the equation.
* Look for exploits (using searchsploit) for the versions of technologies that are being used like the version of the web server, or maybe the version of the CMS being used.

* Maybe use Metasploit to automate the exploitation process.

### Privilege Escalation 
* Could be with a Kernel exploit if the OS is old enough or not patched.
* I might need to do horizontal privilege escalation first to be able to get to the root user.
* I usually use LinPEAS, LinEnum or LSE to help me with my sweeping of the system. Then I start analyzing the results or sometimes files and directories that are interesting but these tools hasn't caught.
* Interesting things can be weird SUIDs, bad privileges of directories and files, vulnerable versions of packages or software, bad Sudo privileges, interesting cron jobs, maybe look for CVEs (Common Vulnerabilities and Exposures) and many other things that could look interesting.   

### Post Exploitation  

* What data and information I can find on the system after gaining access.
* Covering tracks
  * Clearing log files.
  * Removing any software uploaded.
* Maintaining access.
* We can leave a backdoor on the system so we can maintain persistence.   


* The sql injection scenario