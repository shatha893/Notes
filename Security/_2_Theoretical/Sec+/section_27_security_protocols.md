# Section 27: Security Protocols  

## S/MIME  (Secure/Multipurpose Internet Mail Extension)  
* A standard that provides cryptographic security for electronic messaging.
* It uses separate session keys for each email message that's being sent or received.  
* We can use digital IDs in Outlook or Digital Signatures within many different programs to give our emails *authentication*, *integrity* and *non-repudiation* through S/MIME.
* S/MIME is a way of encrypting emails and their contents and a problem is that this can also include *malware*. Which could result in this malware not being detected.
* Some email gateways load up the user's private key decrypts the contents, checks if it contains malware before it goes to the user but the problem is that giving up your private key reduces the security so we had to weigh the pros and cons.  

## SSL and TLS  

* Secure Socket Layer (SSL) ==> was created first (old/ DON'T USE IT)
* Transport Layer Security (TLS) ==> the one that should be used
  * Both are Cryptographic protocols that provide secure internet communications for web browsing, instant messaging, email, VoIP, and many other services.  
* TLS can be used with SMTP.  
* Downgrade Attack is a protocol that is tricked into using a lower quality version version of itself instead of a higher quality version.  
* TLS is a challenge for network defenders. That's why we use the concept *Break and Inspect* which can be like putting a proxy between the user and the server this way the use will connect to the proxy and then this proxy will check the payload if it's safe and then send it to the server. This uses alot of resources.  

## SSH (Secure SHell)  
* A protocol that can create a secure channel between two computers or network devices to enable one device to control the other device.  
* SSH is also now available in Windows.  
* SSH requires a server (daemon) to be run on one device and a client on the other. 
* Secure copy and secure FTP both operate in an SSH tunnel.
* SSH 2.0 uses Diffie-Hellman key exchange and MACs.  

## VPN Protocols  

* VPN is a secure connection between two or more computers or devices that are not on the same private network.  
* PPTP (Point-to-Point Tunneling Protocol)  
  * A protocol that encapsulates PPP packets and ultimately sends data as encrypted traffic.
* The PPP protocol is used with combination of the PPTP protocol over port 1723 to allows servers and devices to connect over a wide area network like the internet.
* PPTP can use CHAP-based authentication, making it vulnerable to attackes that's why if we use this protocol for a VPN we should require a strong authentication mechanism to be used instead.  

* Layer 2 Tunneling Protocol (L2TP)  
  * A connection between two or more computers or devices that are not on the same private network. We pair it with IPSec to provide security.
  * Port 1701.

* IPSec   
  * A TCP/IP protocol that *authenticates* and *encrypts* IP packets and effectively securing communications between computers and devices using this protocol.
  * It provides confidentiality (encryption), integrity (hashing) and authentication (key exchange).
* Internet Key Exchange (IKE)  
  * Method used by IPSec to create a secure tunnel by encrypting the connection between authenticated peers.  
  * This could happen in one of three modes *main*, *aggressive* and *quick*.
  * In main mode there are 3 separate exchanges.
  * Aggressive mode the key exchange is going to happen more quickly but achieves the same result as main mode.
  * In Quick mode on ly the negotiated parameters of the IPSec session are going to be handled.
  * First we have IKE phase #1: We're going to establish the encryption and authentication protocols between our two VPN endpoints.
  * Then we're going to have ISAKMP established and using Main or Aggressive mode we're going to create Security Associations  

* Security Association (SA)  
  * Is the establishment of secure connections and shared security information using certificates or cryptographic keys.

* Authentication Header (AH)  
  * Protocol used in IPSec that provides integrity and authentication.  

* ESP (Encapsulating Security Payload)  
  * Provides integrity, confidentiality, and authenticity of packets by encapsulating and encrypting them.

* IPSec can operate in two modes  
  * Transport Mode: Host-to-host transport mode only uses encryption of the payload of an IP packet but not its header.  
  * People can see from where the packet came from and where is it going which means this mode should only be used from transmissions on a private network.
  * Tunnel Mode: A network tunnel is created which encrypts the entire IP packet (payload and header).
  * Tunnel mode is used when doing point-to-point over something like the internet.
  * We'll see tunnel mode used alot inside VPNs