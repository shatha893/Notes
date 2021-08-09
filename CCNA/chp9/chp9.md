

# Chapter 9 and 10
## ARP Table  
* The PC's ARP table will have its own IP and MAC address.
* It has the default gateway's IP address but not the MAC. So how do we get it? By sending an ARP request.
  This ARP request has Source Mac as the PC's MAC, destination MAC as FFFFFF... and source IP address of the source and destination IP as the IP of the default gateway.  
  Then an ARP reply (always unicast) from the router (default gateway) to the PC.
  It's structure would be  
    source MAC is   

* ARP is broadcast it doesn't go out of the default gateway.


  * ipv4 has ARP requests and replies and ipv6 has ICMPv6 (which's sth like the ping).

* windows pcs 2min-10min and routers 5min (ARP timer).  

* I have to give the pc an ip, subnet mask and default gateway in the ip configuration place in the PC
* Commands  
    * On PC's cmd:
    * arp -a
    * arp -d
    * show ip arp
    * To connect remotely to the switch:
      * telnet [SWITCH/ROUTER IP ADDRESS]

    * show ip int br (show ip interface brief) in enable mode
    * set ip address : ip addr [IP ADDRESS] [SUBNET MASK] we did this for the vlan and it was in the config interface vlan 1
    * show mac address table: show mac mac address-table
    * no shutdown
    * show ip arp  


    * Configuration in the router: 
      * config t
      * interface fa0/0 (It's changable).
      * ip address [IP ADDRESS] [SUBNET MASK] >>>> 192.168.1.10 255.255.255.0
      * shutdown
      * description ## Default gateway port## (optional)
      * to show the counters of all the interfaces: show interfaces 

       * switch:
       * config t
       * interface vlan 1
       * ip address [IP ADDRESS] [SUBNET MASK]
       * no shutdown
       * ip default-gateway [GATEWAY IP ADDRESS]

* put the example of the eng (the screenshot)  
* The PC that gets the ARP request but it's not the intended one (destination IP) it takes the source MAC and source IP and stores them in the ARP table (for later use).

* If we have a gateway of last resort it means that if we don't have the IP the data is supposed to be sent to it will be sent to this gateway if it was assigned if there was no gateway of last resort then the data will be dropped.




* EMAIL h.albeshawi@gmail.com