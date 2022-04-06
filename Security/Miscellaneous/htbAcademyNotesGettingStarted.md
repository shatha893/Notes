## What is a VPN?  

A Virtual Private Network allows us to connect to a private network and access hosts and resources just like if we're directly connected to the network.  

It's a secured channel for shared public networks to communicate by connecting to a private network.  

VPNs encrypt communications over the channel so by that it provides a level of security by preventing eavesdropping and access to data traversing the channel.  

## Two Types of VPNs  
1. Client-based VPN.
   Requires the use of client software to establish the VPN connection. It will act as if the client is connected directly to the company's network and it will have access to all its resource (applications, hosts, subnest, etc.) **allowed by the server configuration**.  

2. SSL VPN.  
   uses the web browser as the VPN client, where the connection is established between the browser and an SSL VPN gateway.  

<br/>

## Why Use a VPN?  
We use a VPN to connect to another region or another country to obscure our browsing traffic or to disguise our public IP address.  
Using a VPN service comes with its own negativities one of which is the fact that the VPN provider is not doing what they're saying they're doing and they're logging our data, that's why they always say that if you want to use a VPN it's best if it was a paid one because free ones are not guaranteed to not take your data.  
That's why it's best when connecting via a VPN to connect a VM not my original computer.  
To connect to HTB's VPN  type the following command:  

```
Shatha Barqawi@htb[/htb]$ sudo openvpn user.ovpn

Thu Dec 10 18:42:41 2020 OpenVPN 2.4.9 x86_64-pc-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Apr 21 2020
Thu Dec 10 18:42:41 2020 library versions: OpenSSL 1.1.1g  21 Apr 2020, LZO 2.10
Thu Dec 10 18:42:41 2020 Outgoing Control Channel Authentication: Using 256 bit message hash 'SHA256' for HMAC authentication
Thu Dec 10 18:42:41 2020 Incoming Control Channel Authentication: Using 256 bit message hash 'SHA256' for HMAC authentication
Thu Dec 10 18:42:41 2020 TCP/UDP: Preserving recently used remote address: [AF_INET]
Thu Dec 10 18:42:41 2020 Socket Buffers: R=[212992->212992] S=[212992->212992]
Thu Dec 10 18:42:41 2020 UDP link local: (not bound)
<SNIP>
Thu Dec 10 18:42:41 2020 Initialization Sequence Completed
```  
You can see the networks accessible via the VPN by typing the following command:  

```
Shatha Barqawi@htb[/htb]$ netstat -rn

Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         192.168.1.2     0.0.0.0         UG        0 0          0 eth0
10.10.14.0      0.0.0.0         255.255.254.0   U         0 0          0 tun0
10.129.0.0      10.10.14.1      255.255.0.0     UG        0 0          0 tun0
192.168.1.0     0.0.0.0         255.255.255.0   U         0 0          0 eth0
```  

## What's a Shell?  
It's the Command-Line Interface such as Linux terminal, Windows command-line (cmd.exe), and Windows PowerShell. It's a program that takes input from the user (via keyboard) and passes these commands to the OS so that it performs a specific function.  
Most Linux systems use a program called Bash(Bourne Again Shell) as a shell to interact with the OS. There are others types of shells such as Zsh, Tcsh, Ksh, Fish shell, and the list keeps going on.  
"Getting a shell on a system" means that we exploit the target host in order to obtain shell-level access and run commands through it. We can obtain shell level access by exploiting a web application, network vulneribitlity or obtaining credentials and logging into the target host remotely.  
There are 3 types of shell connections:  
1. Reverse Shell 
2. Bind Shell.
3. Web Shell.  
   
## Ports  
At a very high level, ports help computers understand the various types of data they recieve. We have 2 categories of ports:  
1. TCP (Transmission Control Protocol)  
   It's connection oriented and we know the whole story about how it has a handshake the server will keep listening for requests from the client blah blah blah
2. UDP (User Datagram Protocol)  
   It's a connectionless communiction model. No handshake and here as well we know the whole story about when to use it and it's used when we want a fast connection blah blah blah.  

   Quoted from HTB *"There are 65,535 TCP ports and 65,535 different UDP ports"*  

   |Port         |Protocol       |A Bit on Each one|
   |-------------|-------------- |-----------------|
   |20/21(TCP)   |FTP            |The File Transfer Protocol is used to transfer computer files from a server to a client on a computer network. <br/> This protocol is built using separate control and data connections between client and server where **21** is for **control** and **20** is for data **transfer**|
   |22 (TCP)     |SSH            | The Secure Shell Protocol is a cryptographic network protocol for operating network services securely over an **unsecure network**. Usually it's used with remote command-line, login, and remote command execution, but any network service can be secured using SSH.|
   |23 (TCP)     |Telnet         |Telnet is used to provide a 2-way collaborative and text-based communication channel between 2 machines.|
   |25 (TCP)     |SMTP           |Simple Mail Transfer Protocol is used by mail servers and other message transfer agents to send and receive mail messages. |
   |80 (TCP)     |HTTP           |Hypertext Transfer Protocol allows the fetching of resources. It's the foundation of any data exchange on the web.(Check out the image following the table) |
   |161 (TCP/UDP)|SNMP           |Simple Network Management Protocol is used to manage devices on IP networks and modifying that information to change those devices behaviors|
   |389 (TCP/UDP)|LDAP           |Lightweight Directory Access Protocol is used to access and maintain distributed directory information services over an IP network|
   |443 (TCP)    |SSL/TLS (HTTPS)|
   |445 (TCP)    |SMB            |
   |3389 (TCP)   |RDP            |
      
      <br/><br/>

      An image that illustrates how http works
<img src="https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview/fetching_a_page.png">  

## What's a Web Server?  
Web servers usually run on TCP ports 80 and 443, and are responsible for connecting end-users to various parts of the web application in addition to handling their responses.

## Ten Web Application Vulnerabilities Maintained by the Open Web Application Security Project (OWASP)  

|No.|Category                                   |
|---|-------------------------------------------|
|1  |Injection                                  |
|2  |Broken Authentication                      |
|3  |Sensitive Data Exposure                    |
|4  |XML External Entities (XXE)                |
|5  |Broken Access Control                      |
|6  |Security Misconfiguration                  |
|7  |Cross-Site Scripting (XSS)                 |
|8  |Insecure Deserialization                   |                
|9  |Using Components with known Vulnerabilities|
|10 |Insufficient Logging & Monitoring          |  
<br/>

## Using Netcat  
netcat, ncat, or nc is a network utility for interacting with TCP/UDP ports. It's primarly used to connect to shells and connecting to any listening port and interacting with the service running on that port. e.g. 
```
Shatha Barqawi@htb[/htb]$ netcat 10.10.10.10 22
```

## Socat & Tmux
- There's another tool called `Socat` that has more features that netcat does not support.
- Also,tools like `Tmux` are used to expand the capabilities of Linux's terminal, like having multile windows within one terminal.  
  
## Nmap
Is used to scan the network for open ports it stands for (Network Mapper). If we want to do a basic scan on the following IP address `10.129.42.253` and we type `nmap 10.129.42.253`, because we don't specify any additional options, it will perform the scan only on the 1000 most common ports (by default).
