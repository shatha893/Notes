* An intruder that gains access to a network by exploiting a vulnerability in a software is called a **Threat Actor**.
* After a threat actor gains access to a network 4 types of threats arise:
  1. Information Theft: Breaking confidentiality of the information and this information can be sold for various purposes.
  2. Data Loss and Manipulation: breaking into a computer to destroy or alter the records.
  3. Identity Theaft: it's a form of information theft where the information is being stolen for the sole purpose of impersonating someone.
  4. Desruption of Service: preventing legitimate users from accessing services to which they're entitled (e.g. DoS). 

* Vulnerability is the degree of weakness in a network or device.
* Three primary vulnerabilities or weaknesses are:
  1. Technological include weaknesses in the TCP/IP protocol, weaknesses in OS's and weaknesses in network equipment.
  2. Configuration include unsecured user accounts, system accounts with easily guessed passwords, misconfigured internet services, unsecured default setting within products and misconfigured network equipment.
  3. Security Policy include lack of written security policy, politics, lack of authentication continuity, logical access controls not applied, software and hardware installation and changes do not follow policy and a disaster recovery plan is nonexistent.  

* Weaknesses that might be found in network equipment include password protection, lack of authentication, routing protocols, and firewall holes.

* We have 4 classes of **physical threats**:
  1. Hardware Threats.
  2. Envirnomental Threats.
  3. Electrical Threats.
  4. Maintainance Threats.

 
* Malware is short for malicious software. It is code or software specifically designed to damage, disrupt, steal, or inflict “bad” or illegitimate action on data, hosts, or networks. Viruses, worms, and Trojan horses are types of malware.
 * Viruses: Almost all viruses are attached to an executable file and it's not active until this file is executed. Once it's activated it can spread itself into other files on the system.
 * Worms: Don't need to be attached to a file and to get into a system through a vulnerability to spread itself, it's standalone and it takes advantage of system features to travel through the network unaided.  
 * Trojan Horse: It's a harmful piece of software that looks legitimate to the user. Unlike worms and viruses, trojan horses do not spread and reproduce by infecting other file. Instead, trojan horses reproduce through user interaction when they click on a link in an email or downloading and running a file from the internet.  

* Network attacks can be classified into three major categories:
  1. Reconnaissance attacks.
     * Internet Queries: googling.
     * Ping Sweeps: A threat actor might use **a ping sweep tool** such as *fping* or *gping* which pings all network addresses in a given range or subnet.
     * Port scans: I think they mean *nmap*.
  2. Access Attacks.
     * Password Attacks.
     * Trust Exploitation.
     * Port Redirection.
     * Man in the middle attack. 
  3. Denial of Service. 
     * Among the most difficult to eliminate.
     * DDoS attacks can be accomplished if the threat actor infects computers that become Zombies and together they're called a botnet and through this botnet a DDoS attack is accomplished (Distributed Denial of Service) .

* Defense in Depth approach to mitigate network attacks

* To secure our network we can put the following precuations:
  * VPN, ASA Firewall, IPS, ESA/WSA, AAA Server (Authentication, Authorization and Accounting).
  * Firewalls permits the users to exit and re-enter the network and denies any access from non-users using thei internet from accessing the network.
  * A firewall might allow access to specific services of the network that reside in a place called DMZ (Demilitarized Zone).
  * Types of firewalls (Each firewall product have a different way of determining which traffic to let in and which traffic should be denied):
    1. Packet Filtering (Prevents or allows access based on IP or MAC addresses) 
    2. Application Filtering (Prevents or allows access depending on application types using port numbers).
    3. URL Filtering (Prevents or allows access to websites based on URL or specific keywords).
    4. Stateful Packet Inspection (SPI) (Incoming packets must be legitimate responses to requests from internal hosts. It also has the ability to recognized and filter out attacks like DoS).

* There are several steps that can be taken to help ensure that passwords remain secret on a Cisco router and switch including these:
  1. Encrypting all plaintext passwords.
  2. Setting a minimum acceptable password length.
  3. Deterring brute-force password guessing attacks.
  4. Disabling an inactive privileged EXEC mode access.   

* o ensure that all configured passwords are a minimum of a specified length, use the security passwords min-length length command in global configuration mode.  
* Use the login block-for # attempts # within # global configuration command to deter brute-force attacks (e.g. login block-for 120 attempts 3 within 60).

* By default, Cisco routers will logout an EXEC session after 10 minutes of inactivity. However, you can reduce this setting using the `exec-timeout` minutes seconds line configuration command.  

* To configure SSH:
  ```
  Router# configure terminal
  Router(config)# hostname R1
  R1(config)# ip domain name span.com
  R1(config)# crypto key generate rsa general-keys modulus 1024
  The name for the keys will be: Rl.span.com % The key modulus size is 1024 bits
  % Generating 1024 bit RSA keys, keys will be non-exportable...[OK]
  Dec 13 16:19:12.079: %SSH-5-ENABLED: SSH 1.99 has been enabled
  R1(config)#
  R1(config)# username Bob secret cisco
  R1(config)# line vty 0 4
  R1(config-line)# login local
  R1(config-line)# transport input ssh
  R1(config-line)# exit
  R1(config)#
  ```

* Which command will block login attempts on RouterA for a period of 30 seconds if there are 2 failed login attempts within 10 seconds?
  ```
  RouterA(config)# login block-for 30 attempts 2 within 10
  ```  

* Device selection for a small network. We have to take the following into consideration:
  1. Cost.
  2. Speed and Types of Ports/Interfaces.
  3. Expandability.
  4. Operating system features and services.  
* It's best when making a small network to:
  * Implement an IP addressing scheme.
  * Redudancy (Reliability)which can be accomplished by installing duplicate equipment, but it can also be accomplished by supplying duplicate network links for critical areas.
  * Traffic Management: a network should support real-time traffic and will implement quality of service to classify traffic carefully according to priority during times of congestion.  

* Two types of applications in networks:
  1. Network applications: which are applications taht are able to communicate with the lower layers and are able to implement applciation layer protocols (network-aware applications). E.g. email clients and web browsers.
  2. Application layer services which are the services that help the applications that are not network-aware to function through a network because without protocols the network won't have a common way to format and direct data.
   
* SSH is used to establish a secure remote access connection between an SSH client and other SSH-enabled devices(network device or server).  


* chp17: 
<img src="Screenshot 2021-08-19 214542.png">

* In Windows-based machines, when the device cannot contact a DHCP server, Windows will automatically assign an address belonging to the 169.254.0.0/16 range. This feature is called Automatic Private IP Addressing (APIPA) and is designed to facilitate communication within the local network. Think of it as Windows saying, “I will use this address from the 169.254.0.0/16 range because I could not get any other address”.