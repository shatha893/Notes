## Cisco Certified Network Associate Notes <span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# Introduction to Networking 


<span style="color:gray;font-size:small;">Tuesday, 22/6/2021</span>
### <span style="color:#8B0000">Communication Types (Network Transmission Modes)  
<span style="color:#F08080;">1. Simplex</span> Always from the source to destination (e.g. TV).  
<span style="color:#F08080;">2. Half Duplex</span> The source and destination can either send ***or*** recieve (e.g. Walkie Talkie).  
<span style="color:#F08080;">3. Full Duplex</span> The source and destination can send ***and*** recieve (e.g. Mobile).  

<img src="https://media-exp3.licdn.com/dms/image/C5112AQHPExfAVoJffA/article-cover_image-shrink_720_1280/0/1520184208215?e=1629331200&v=beta&t=KIdmjxZ5yRNUzUEXE09gFR6RDirkG38y0sUKZi5556w" width="400" height="300">  

<br/><br/>

### <span style="color:#8B0000"> Delivery Options (Casting Types)  
We have Unicast (one-to-one), Multicast (one-to-many) and Broadcast (one-to-all) 
<br/>
<img src="https://cdn.techterms.com/img/xl/multicast_946.png" width="550" height="300">  

<br/><br/>

### <span style="color:#8B0000">The Hub  

Is a device that connects all devices to <span style="color:#F08080;"> one channel</span>. When a message is sent on this hub it will be <span style="color:#F08080;">broadcasted</span> on the whole channel to all the connected devices. Also, a <span style="color:#F08080;">collision</span> is possible if 2 or more workstation want to broadcast the message at the same time and *those are the 2 problems that a hub has.*  
The *collision* problem was solved using the <span style="color:#F08080;">"CSMA/CD"</span> which is an abbreviation for *Carrier Sense Multiple Access/Collision Detection*. What it does is that, in a way, it asks if the channel has sth or that the workstation can send it's message. But this way there still could be the problem that if 2 workstations ask at the very same second and the channel seems clear the ability to send will be granted for both workstations and a collision will definitly happen.  

**The hub is called dumb and it's not used anymore**  
<br/><br/>

### <span style="color:#8B0000">The Switch  

First good thing about switches that when connected to it a workstation can send a message in <span style="color:#F08080;">multicast</span> by using a <span style="color:#F08080;">MAC-Address-Table</span> that consists of Ports and their MAC.  
<br/>
In a switch the ports of it are connected to each other as a <span style="color:#F08080;">full mesh</span> which means that each port has a specific path (channel) to communicate with any other port, hence, no collision.  

<img src="https://www.omnisecu.com/images/basic-networking/full-mesh-topology.jpg" width="300" height="300">  
<br/>  <br/>

The switch also has a <span style="color:#F08080;">Buffer Memory</span> and a <span style="color:#F08080;">Shared Memory</span>.  
<br/>
Also, all the switches ports are <span style="color:#F08080;">full duplex.  
<br/><br/>

### <span style="color:#8B0000">  The Router  

It, mainly, enables workstations from different networks to communicate.  

The router gives us the ability to connect an <span style="color:#F08080;">ethernet cable</span> and a <span style="color:#F08080;">serial cable</span> when the switch enables us to connect <span style="color:#F08080;">only ethernet.  

The routers symbol is  
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Router_symbol.svg/1200px-Router_symbol.svg.png" width="100" height="100">  

<br/><br/>

### <span style="color:#8B0000">  Address Types  

<span style="color:#F08080;">1. Physical Address</span> (MAC Address) it's represented by 48 bits(12 hexa) and splitted into 2 => OUI + Vendors.  
<span style="color:#F08080;">2. Logical Address</span>  (IP => IPv4 or IPv6) which is represented by 32 bits (4 octal), between each 8 bits there's a "." and it's represented in decimal.  

<br/><br/>

### <span style="color:#8B0000"> IPv4  
It's divided into five classes:  
| # | Class | IP Address    | Prefix            |
|---|-------|---------------|-------------------|
| 1 | A     | 0-127.X.X.X   | /8                |
| 2 | B     | 128-191.X.X.X | /16               |
| 3 | C     | 192-223.X.X.X | /24               |
| 4 | D     | 224-239.X.X.X | Multicast Address |
| 5 | E     | 240-255.X.X.X | Research          |  
As obvious from the table the first number hints the class of the IP.  

* What's a *prefix*?  
   It's the number that decides how many bits will be designated for the network and consequently how many bits for the hosts e.g. If the prefix is 8 then the subnet mask is 11111111.00000000.00000000.00000000.00000000 => N.H.H.H => N for Network & H for Host.  
   Depending on the number of devices we're connecting on the network we decide which class is best to choose.  

<br/><br/>

### <span style="color:#8B0000"> Network Id  
We can calculate the network id by ANDing the IP address and the subnet mask.  
- If the devices are in the same network *=then=>* they have the same network id which communicate through a **switch**.  
- If the devices are in different networks *=then=>* they have different network ids and they communicate through a **router**.  

<br/><br/><br/>

<span style="color:gray;font-size:small;">Thursday, 24/6/2021</span>
### <span style="color:#228B22"> Network Components  
   <br/>
A network has to have at least these 5 components to be called a network:

1. Source (Sender).
2. Media.
3. Destination (Reciever).
4. Message (which could be *Data "text, voice or video"* or *Query*).
5. Protocol.  

<br/><br/>

### <span style="color:#228B22"> Media  
|   | Media Type | Examples                        |
|---|------------|---------------------------------|
| 1 | Wired      |Copper, Optical              |
| 2 | Wireless   |Wifi (WLAN), WiMax(WWAN), Bluetooth(WPAN) and IR |


<br/><br/>

### <span style="color:#228B22"> Copper Wires  

Could be 1 of 2 *Coaxial Cable* or *Twisted Pair*.  

- What do we mean by bandwidth?  
   The maximum rate of data transfer in a given path.

<br/><br/>

### <span style="color:#228B22"> Coaxial Cable  
* It needs a T connector.
* It's used with TV cable.
* It has two types *10 base 5 (THICK)* and *10 base 2 (THIN).* The number 10 means **10 Mbps** and the 5 or 2 mean **500 meters** or **200 meters** (respectively).  
* The meters mean that after this distance we will need a repeater to regenerate the signal.  

<br/><br/>

### <span style="color:#228B22"> Twisted Pair Cable  

* Why is it twisted?  
  Because every wire emits some kind of a magnetic field and when the 2 wires are twisted upon each other the magnetic field of each one of them will dissipate the other.  
<br/> 

* Twisted Pair cables can be:  
  **1. Shielded Twisted Pair (STP).**  
   <img src="https://5.imimg.com/data5/BS/UQ/MY-35673791/shielded-twisted-pair-cable-500x500.jpg" width="200" height="200">  
   Used outdoors because wires need more protection.  

   **2. Unshielded Twisted Pair (UTP)**  
     <img src="https://sc04.alicdn.com/kf/HTB1JO20JVXXXXarXpXXq6xXFXXXw.jpg" width="200" height="200">  
   Used indoors which makes it the most used one.  
<br/> 

* We use the **RJ45** connector with twisted pairs. See the following image.  
  <img src="https://sc04.alicdn.com/kf/Hd764f74cbd6549b9b668969a99f58f4ek.jpg" width="200" height="200">  
<br/> 

* Types of Twisted pair cables:  

  | # | Speed/Bandwidth (Mbps) | Category | What the port is Called |
  |---|--------------|----------|-------------------------|
  | 1 | 10           | CAT3     | Ethernet                |
  | 2 | 100          | CAT5     | Fast Ethernet           |
  | 3 | 1000 (1G)    | CAT5E    | Gig Ethernet            |
  | 4 | 10 000 (10G) | CAT6     |            -            |  
   <br/>

* What defines the speed of a LAN?  
  1. The switch's port's bandwidth.
  2. The cable's bandwidth.
  3. The NIC card's bandwidth.  
<br/> 

* What's a NIC Card (Network Interface Controller)? 
   According to Wikipedia
   <blockquote>  

  *A network interface controller is acomputer hardware component that connects a computer to a computer network.*
   </blockquote>  <br/>

* What's an uplink port?  
  It's a port that connects a switch to a router and it usually has a higher bandwidth than the rest of the ports on the switch. What it does is that it transfers the data of all the other ports on the switch.  
  According to Home Network Greek  

  <blockquote> 

    *An uplink port is a specially designed port found on some pieces of networking devices to allow these devices to communicate with each other.*  

    *Previously these devices will have needed a crossover cable to communicate, however, the uplink port has replaced the need for a dedicated cable by making the “switch” in the direction needed internally.*
  </blockquote> <br/>  

<br/><br/>

### <span style="color:#228B22"> A Network Type Depends On Two Things  </span>
1. <span style="color:#3CB371">Area</span> (LAN, WAN, PAN, SAN and MAN) where the P in PAN stands for Personal and the S in SAN stands for Storage. We can also add that the Storage Area Network usually needs high security and speed because it's used to transfer files.  
2. <span style="color:#3CB371">Management</span>  (Peer-To-Peer and Client-Server).  
	
<br/><br/>

### <span style="color:#228B22"> Network Models  

1. <span style="color:#3CB371">OSI (Open Systems Interconnection)</span> => Theoritical and used for troubleshooting (not sure about the troubleshooting part?). 
2. <span style="color:#3CB371">TCP/IP</span> => Practical and used in all networks.  
   
<br/><br/>

### <span style="color:#228B22"> OSI Model  
This model consists of 7 layers as follows
<br/>   

| # |Metaphor    |Layer Name      |
|---|------------|----------------|
| 1 |**P**lease  |**P**hysical    |
| 2 |**D**o      |**D**ata Link   |
| 3 |**N**ot     |**N**etwork     |
| 4 |**T**hrow   |**T**ransport   |
| 5 |**S**ausage |**S**ession     |
| 6 |**P**izza   |**P**resentation|
| 7 |**A**way    |**A**pplication |

   <br/><br/>

### <span style="color:#228B22">7 Application Layer (End-To-End User)  

This layer calls whatever protocol I want whether it was **http, https, dns, dhcp, ftp, pop, empa or smtp**.  

<br/><br/>

### <span style="color:#228B22">6 Presentation Layer  
* In this layer the **source** is responsible for the following:  
  1. Compression.
  2. Encryption.
  3. Encoding (Convert text into binary).
  4. Formatting (Adding some text before and after the original data so that the destination would know what it is).  
   <br/>
* In this layer the **destination**'s responsibilities are:  
   1. Decompression.
   2. Decryption.
   3. Decoding.
   
<br/><br/>

### <span style="color:#228B22">5 Session Layer  
This layer is responsible for the following:  
   1. Create logical sessions.
   2. Terminate logical sessions.
   3. Define communication types (Simplex, Half duplex or full duplex).


* What is a logical session?  
  The server gives each device that wants to connect to it a session and this way the server can limit how many devices can be connected to it.  

<br/><br/>

### <span style="color:#228B22">4 Transport Layer  
This layer is responsible for the following:    
   1. Segmentation.  
   2. Labling.
   3. Multiplexing.
   4. Error Detection. 
   5. Encapsulation.
   6. Decapsulation.
   
* What is Segmentation?  
  That the packet of data is divided into segments and it's done by the source.  

* What do we mean by Labling? 
  Each segment has a sequence number and that's what labling is and it's done by the source.  

* What do we mean by Multiplexing?  
  Look at the data segments and re-ordering them in some way. This re-ordering can happen even when the data is recieved from multiple sources (Done by the destination).  

* What do we mean by error detection?  
  As the name suggests the ability to detect an error in the recieved data (Done by both source and destination).

* Transport Layer's main protocols:  
  1. TCP (e.g. http, https).
  2. UDP (e.g. Voice Over IP). 
    
   --------- More on that later ---------

* Port Number  
  All the services should have port numbers.  
  There are 3 types of ports:  
  1. Well-Known (0-1023).
  2. Registered (1024 - 49 151) usually given to a person by a company called IANA.
  3. Dynamic "Private" (49 152 - 65 535).  
   <br/>
* The segment structure   
  <img src="https://www.cs.ait.ac.th/~on/O/oreilly/tcpip/tcpip/figs/tcp2_0109.gif" width="500" height="200">  
   The transport layer adds the Source port and the destination port to the data.  

<br/><br/>

### <span style="color:#228B22">3 Network Layer  
The main functionalities of this layer are:  
   1. Addressing End Devices,which means adding the source ip and the destination ip.
   2. Routing (Choosing the best path & Forwarding).  
   3. Encapsulation and Decapsulation (Adding the source IP and the destination IP).  
   
* Routers usually use **routing tables** which consists of the paths to the specific destinations.  

* How does the Routing Table learn?  
  1. as Direct Connection.
  2. as Remote Connection.  
   
   Where **direct connection** means that the router learned the IP address for the other devices in the network that are directly connected to it and **remote connection** is when the device (router) is not directly connected to the router which can be learnt either *statically* or *dynamically* when we say dynamically we mean "Dynamic Routing Protocol" which is an algorithm that chooses the best path and from these protocols (RIP, OSPF and EIGRP).

* What is AD (Administrative Distance)?  
  It's the credebility of the learning the router did for a specific path. So, the less the AD the better the path. If the AD is equal on all the paths then the router looks at another metric which is the **cost**.  

* The cost?  
  Each protocol chooses the cost in a different way. If all the path's costs are equal the router does sth called "Equal Cost Load Balancing".  
  (I'm assuming we will be talking more on this later)  

<br/><br/>

### <span style="color:#228B22">2 Data Link Layer  
Consists of 2 sublayers *Logical Link Control LLC* and *Media Access Control MAC*. (More on that later)  

<br/><br/>

### <span style="color:#228B22">1 Physical Layer  

