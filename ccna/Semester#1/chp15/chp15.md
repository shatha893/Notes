* The Application Layer is all about making sure that the recieved data is in a format that the receiver can use.  
* The application, presentation and session layers in the OSI model represent the Application layer in the TCP/IP model (They have the same functionality).

<br/>

* Presentation Layer  
  Has 3 functionalities  
    1. Formatting the data in the source device into a format that is compatible to be received by the destination device.
    2. Compressing the data in a way that can be decompressed by the destination.
    3. Encrypting data on trasmission and decrypting data upon receipt. 

<br/>

* The presentation layer formats data for the application layer, and it sets standards for file formats. Some well-known standards for video include Matroska Video (MKV), Motion Picture Experts Group (MPG), and QuickTime Video (MOV). Some well-known graphic image formats are Graphics Interchange Format (GIF), Joint Photographic Experts Group (JPG), and Portable Network Graphics (PNG) format.  

<br/>

* Session Layer  
  * Create and maintain dialogs between source and destination.
  * The session layer handles the exchange of information to initiate dialogs, keep them active, and to restart sessions that are disrupted or idle for a long period of time.  

<br/>

* Application Layer Protocols  
  * For the communications to be successful, the application layer protocols that are implemented on the source and destination host must be compatible.
  * Protocols:
    1. DNS (Domain Name System or Service)  
       * UDP or TCP.
       * Port 53
       * Translate domain names into IP addresses (e.g.on a domain name cisco.com)  
  
    2. Dynamic Host Configuration Protocol (DHCP)  
       * UDP.
       * Port client 68, server 67.
       * Dynamically assigns IP addresses to be re-used when no longer needed.  
  
    3. Simple Mail Transfer Protocol (SMTP)  
       * TCP.
       * Port 25.
       * Enables clients to **send** emails to mail servers and servers to send emails to other servers. 
  
    4. Post Office Protocol (POP3)  
       * TCP.
       * port 110 
       * Enables clients to **retrieve** emails from mail server (by downloading the email to the local mail application of the client).  

    5. Internet Message Access Protocol (IMAP)  
       * TCP
       * Port 143 
       * Enables clients to **access** emails on mail server (but the email is maintained on the server).  

    6. File Transfer Protocol (FTP)
       * TCP.
       * Port 20 to 21.
       * Sets rules to enable one host to transfer and access files on or to another host over the network.  
       * A reliable, connection-oriented, and acknowledged file delivery protocol

    7. Trivial File Transfer Protocol (TFTP)  
       * UDP.
       * Port 69.
       * A simple, connectionless file transfer protocol with best-effort, unacknowledged file delivery. 
       * It uses less overhead than ftp. 

    8. Hypertext Transfer Protocol (HTTP)  
       * TCP.
       * Port 80, 8080.
       * A set of rules for exchanging text, graphic images, sound, video, and other multimedia files on the World Wide Web.  
       * HTTPS uses the same client request-server response process as HTTP, but the data stream is encrypted with Transport Layer Security (TLS) or its predecessor Secure Socket Layer (SSL) before being transported across the network.

    9. Secure Hypertext Transfer Protocol (HTTPS)  
       * TCP
       * Port 443.
       * The browser uses encryption to secure HTTP communications.
       * Authenticates the website to which you're connecting your website.  

* Email hosting is a service offered by ISPs.
* Email messages are stored in databases on mail servers. 
* An email client does not communicate directly with another email client when sending email. Instead, both clients rely on the mail server to transport messages.

* With home networks, the DHCP server is usually located on the local router that connects the home network to the ISP.  
* DHCP operations  
    <blockquote> 
    As shown in the figure, when an IPv4, DHCP-configured device boots up or connects to the network, the client broadcasts a DHCP discover (DHCPDISCOVER) message to identify any available DHCP servers on the network. A DHCP server replies with a DHCP offer (DHCPOFFER) message, which offers a lease to the client. The offer message contains the IPv4 address and subnet mask to be assigned, the IPv4 address of the DNS server, and the IPv4 address of the default gateway. The lease offer also includes the duration of the lease.


    The client may receive multiple DHCPOFFER messages if there is more than one DHCP server on the local network. Therefore, it must choose between them, and sends a DHCP request (DHCPREQUEST) message that identifies the explicit server and lease offer that the client is accepting. A client may also choose to request an address that it had previously been allocated by the server.

    Assuming that the IPv4 address requested by the client, or offered by the server, is still available, the server returns a DHCP acknowledgment (DHCPACK) message that acknowledges to the client that the lease has been finalized. If the offer is no longer valid, then the selected server responds with a DHCP negative acknowledgment (DHCPNAK) message. If a DHCPNAK message is returned, then the selection process must begin again with a new DHCPDISCOVER message being transmitted. After the client has the lease, it must be renewed prior to the lease expiration through another DHCPREQUEST message.

    The DHCP server ensures that all IP addresses are unique (the same IP address cannot be assigned to two different network devices simultaneously). Most ISPs use DHCP to allocate addresses to their customers.
    </blockquote>