
<link href="../styles.module.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Encode+Sans+SC&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">

## <span class="copyright">Cisco Certified Network Associate Notes <span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">Chapter 9: Address Resolution (ARP)

<span class="date">Monday,9/8/2021</span> 

<br/><br/>

<!-- ### <span class="[chapterColor] subtitle"> -->

* ARP tables have the IP address and MAC address of its entries.  
* MAC addresses are used for NIC to NIC communications on the same ethernet network.
* When the destination IP address (IPv4 or IPv6) is on a **remote network**, the destination MAC address will be the address of the host default gateway (i.e., the router interface).
* The PC's ARP table will have its own IP and MAC addresses.  
  
* *How are the IP addresses of the IP packets in a data flow associated with the MAC addresses on each link along the path to the destination?* **For IPv4** packets, this is done through a process called Address Resolution Protocol (**ARP**). **For IPv6** packets, the process is ICMPv6 Neighbor Discovery (**ND**).

* Device destination IPv4 addresses are either known or resolved by device name. However, MAC addresses must be discovered.  



<br/><br/>

<span class="[chapterColor] subtitle">ARP Provides 2 basic functions</span>  
* Resolving IPv4 addresses to MAC addresses.
* Maintaining a table of IPv4 to MAC address mappings.

<br/><br/>

<span class="[chapterColor] subtitle">ARP Functions  

* When a packet is sent to the data link layer to be encapsulated into an Ethernet frame, the device refers to a table in its memory to find the MAC address that is mapped to the IPv4 address. This table is stored temporarily in RAM memory and called the ARP table or the ARP cache.

<br/><br/>

<span class="[chapterColor] subtitle">ARP Request  
* An ARP message is directly encapsulated into an ethernet frame. There's no IPv4 header.
* The ARP request has the following information:
  * Destination MAC address (Broadcast Address).
  * Source MAC Address.
  * Type (ARP messages have a type field of 0x806. This informs the receiving NIC that the data portion of the frame needs to be passed to the ARP process).  
* Additionally, static map entries can be entered in an ARP table, but this is rarely done. Static ARP table entries do not expire over time and must be manually removed.


<br/><br/>

<span class="[chapterColor] subtitle">Explanatory Scenario</span>
  * The reciever PC is in another network so the frame from the reciever won't be sent directly because our PC (in its current state) doesn't have the MAC address of the default gateway in its ARP table(which is the MAC the PC should put to be able to contact outsider recievers). In such situation the PC sends an ARP request to retrieve the MAC address of the default gateway.
  * The gateway will send an ARP reply to the PC with its MAC (as source MAC).
  * The MAC table learns through the source MACs and the ARP gives and includes the destination MACs.
  * The PC that gets the ARP request but it's not the intended one (destination IP) it takes the source MAC and source IP and stores them in the ARP table (for later use).

  * This is a visual example:
  <img src="ARP_MAC_ex.PNG"> 

* It has the default gateway's IP address but not the MAC. So how do we get it? By sending an ARP request.
  This ARP request has Source Mac as the PC's MAC, destination MAC as FFFFFF... and source IP address of the source and destination IP as the IP of the default gateway.  
  Then an ARP reply (always unicast) from the router (default gateway) to the PC.
  It's structure would be  
    source MAC is   

* ARP is broadcast it doesn't go out of the default gateway.


  * ipv4 has ARP requests and replies and ipv6 has ICMPv6 (which's sth like the ping).

* windows pcs 2min-10min and routers 5min (ARP timer).  

* The command `show ip arp` shows the arp table on routers.
* On Windows 10 pc we use the command `arp -a`


* If we have a gateway of last resort it means that if we don't have the IP the data is supposed to be sent to it will be sent to this gateway if it was assigned if there was no gateway of last resort then the data will be dropped.


<br/><br/>

<span class="[chapterColor] subtitle">Security Risks

* In some cases, the use of ARP can lead to a potential security risk. A threat actor can use ARP spoofing to perform an ARP poisoning attack. This is a technique used by a threat actor to reply to an ARP request for an IPv4 address that belongs to another device, such as the default gateway, as shown in the figure. The threat actor sends an ARP reply with its own MAC address. The receiver of the ARP reply will add the wrong MAC address to its ARP table and send these packets to the threat actor.
Enterprise level switches include mitigation techniques known as dynamic ARP inspection (DAI).  

