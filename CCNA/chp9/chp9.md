
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

* The PC's ARP table will have its own IP and MAC addresses.  

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




* If we have a gateway of last resort it means that if we don't have the IP the data is supposed to be sent to it will be sent to this gateway if it was assigned if there was no gateway of last resort then the data will be dropped.




* EMAIL h.albeshawi@gmail.com 