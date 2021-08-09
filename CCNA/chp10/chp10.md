
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

# <span class="title">Chapter 10: Basic Router Configuration

<span class="date">Monday,9/8/2021</span> 

<br/><br/>

<!-- ### <span class="[chapterColor] subtitle"> -->
* I have to give the pc an ip, subnet mask and default gateway in the ip configuration place in the PC
* Commands  
    * On PC's cmd:
    * arp -a
    * arp -d
    * show ip arp
    * To connect remotely to the switch:
      * telnet [SWITCH/ROUTER IP ADDRESS]

    
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


* The NIC card won't be active unless it's connected to a switch via a cable.
* We can type `wr` for another way to save the initial configs.

* What are the interfaces that are on the switch, what's their type, and which one's up... coming next:
  * show ip int br `show ip interface brief` in enable mode shows us all the interfaces, which is up, which is down and what are their names (Can be used in switches and routers).
  * All the ports on a switch are up by default whereas the routers ports are down by default. That's why we do the `no shutdown` so that the router's port will go up.  

* Switches don't understand IP addresses that's why we make them a logical interface. How?
  * In configuration mode:
      * `interface vlan 1`
      * and just like that I have a logical interface.
      * Then I give it an ip address and a subnet mask as follows `ip address [IP ADDRESS] [SUBNET MASK]`.
      * Then we have to put `no shutdown`.
      * Just like PCs I have to put the IP of the default gateway for the logical interface with the option `ip default-gateway [GATEWAY ADDRESS]`.
* Switches links are up by default but 
* To see the switch's MAC address table type `show mac address-table` in the enable mode.  
* `description` command is for documentation purposes only.
* `show ip arp` to show the arp table on the router.
* `show ip route` gives me info about the routers ports and what's connected to them.
* When `ping`ing the router (default gateway) for the first time it will give us this output
    ```console
    Request timed out.
    Reply from 192.168.1.2: bytes=32 time<1ms TTL=255
    Reply from 192.168.1.2: bytes=32 time<1ms TTL=255
    Reply from 192.168.1.2: bytes=32 time<1ms TTL=255
    ```
   It timed out on the first request because it was still learning it sent an ARP request and got an ARP reply and then it send the actual message.  

* I can telnet the switch with `telnet [VLAN'S IP ADDRESS]`