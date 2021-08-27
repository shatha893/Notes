* Services available
```
PORT 	STATE SERVICE
22/tcp   open  ssh
80/tcp   open  http
8080/tcp open  http-proxy
```

* Tried a directory that doesn't exist so that I can get the apache version its `2.4.41`.
* The Apache Tomcat vesion is `9` I think. 

* Grabbed the banner of the `p8080` service: 
```
PORT 	STATE SERVICE VERSION
8080/tcp open  http	Apache Tomcat
```  
* Searchsploited the http tomcat with the apache version  
```
Apache Tomcat < 5.5.17 - Remote Directory Listing 
Apache Tomcat < 6.0.18 - 'utf8' Directory Traversal  
Apache Tomcat < 6.0.18 - 'utf8' Directory Traversal (PoC)
Apache Tomcat < 9.0.1 (Beta) / < 8.5.23 / < 8.0.47 / < 7.0.8 - JSP Upload Bypass / Remote Code Execution (1) 
Apache Tomcat < 9.0.1 (Beta) / < 8.5.23 / < 8.0.47 / < 7.0.8 - JSP Upload Bypass / Remote Code Execution (2)
```  

* I'm gonna try with the first one see if the code is readable to me.
* It's simple but not working :(
* It's not working because I'm looking in the wrong direction and the tomcat version is 9 not 2 which leaves me with no exploits on exploit-db.
* Found an exploit that affects tomcat-catalina version 9.0.31 is affected.
* found these for the tomcat service and found some stuff in the examples directory but no luck with anything so far 
```
/examples        	(Status: 302) [Size: 0] [--> /examples/]
//examples/jsp/index.html (Status: 200) [Size: 14245]    	 
//examples/jsp/snp/snoop.jsp.html (Status: 200) [Size: 2318]  
//examples/jsp/snp/snoop.jsp (Status: 200) [Size: 581]   	 
//examples/servlets/index.html (Status: 200) [Siz
```


* Found this vulnerability. Might be the one but it seems too new (https://www.sangfor.com/en/info-center/blog-center/cyber-security/apache-tomcat-deserialization-remote-code-execution-vulnerability) IRRELEVANT
* Try and look into this one or any other expliots for the apache version because it's quiet old (https://www.virsec.com/research-lab/cve-2020-11984-apache-http-server-2-4-32-to-2-4-44-mod_proxy_uwsgi-info-disclosure-and-possible-rce)

* Did this full scan just to play with the command `nice`
```
PORT 	STATE SERVICE VERSION
22/tcp   open  ssh 	OpenSSH 8.2p1 Ubuntu 4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey:
|   3072 45:3c:34:14:35:56:23:95:d6:83:4e:26:de:c6:5b:d9 (RSA)
|   256 89:79:3a:9c:88:b0:5c:ce:4b:79:b1:02:23:4b:44:a6 (ECDSA)
|_  256 1e:e7:b9:55:dd:25:8f:72:56:e8:8e:65:d5:19:b0:8d (ED25519)
80/tcp   open  http	Apache httpd 2.4.41 ((Ubuntu))
|_http-server-header: Apache/2.4.41 (Ubuntu)
|_http-title: Mega Hosting
8080/tcp open  http	Apache Tomcat
|_http-open-proxy: Proxy might be redirecting requests
|_http-title: Apache Tomcat
No exact OS matches for host (If you know what OS is running on it, see https://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=7.91%E=4%D=8/23%OT=22%CT=1%CU=30366%PV=Y%DS=2%DC=T%G=Y%TM=612377F
OS:8%P=x86_64-pc-linux-gnu)SEQ(SP=103%GCD=1%ISR=107%TI=Z%CI=Z%II=I%TS=B)OPS
OS:(O1=M54DST11NW7%O2=M54DST11NW7%O3=M54DNNT11NW7%O4=M54DST11NW7%O5=M54DST1
OS:1NW7%O6=M54DST11)WIN(W1=FE88%W2=FE88%W3=FE88%W4=FE88%W5=FE88%W6=FE88)ECN
OS:(R=Y%DF=Y%T=40%W=FAF0%O=M54DNNSNW7%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F=A
OS:S%RD=0%Q=)T2(R=N)T3(R=N)T4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5(R
OS:=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F
OS:=R%O=%RD=0%Q=)T7(R=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)U1(R=Y%DF=N%
OS:T=40%IPL=164%UN=0%RIPL=G%RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=N%T=40%CD
OS:=S)

Network Distance: 2 hops
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

TRACEROUTE (using port 256/tcp)
HOP RTT  	ADDRESS
1   79.93 ms 10.10.14.1
2   80.04 ms megahosting.htb (10.10.10.194)
```