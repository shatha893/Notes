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

# <span class="title">Chapter 11: IPv4 Addressing

<span class="date">Monday, 9/8/2021</span> 

<br/><br/>

### <span class="[chapterColor] subtitle">Network Portion and Host Portion  
* IP address consists of 32 bits.
* Network portion is the same on all devices on the same network (It's what indicates the network the device is on).  


* How to know the network from the host portion?
We put the IP address and the subnet mask and we AND them (after converting to binary).  
After ANDing the ones represent the network portion whereas the zeros represent the host portion.  
* Anything mapped with the 255 is a network portion and anything mapped with 0 is a host portion.

* Most famous 3 subnet masks?
  * 255.0.0.0, 255.255.0.0 and 255.255.255.0 . 

* When we write the subnet mask in this way *e.g \24*  
    It means that the network portion consists of 24 bit that is one. 

* We can extract the network address, broadcast address and host address using the subnet mask.
    
    1. Network Address (Network ID) : Usually the 1st IP in the network. Which's the result of the ANDing of the IP with the subnet mask.
    2. Broadcast Address : Usually the last IP in the network. Which is *e.g 192.168.1.255* (replace the zeros in the network id with 255s).
    * It's forbidden to use the previous 2 addresses as an IP for any of the hosts (because they're reserved).   
    4. Host Address : the 1st IP address allowed for hosts is *e.g 192.168.1.1* and the last available one is *e.g. 192.168.255.254*. Meaning the number of hosts is 2^16-2.

* some shit??
  1. Unicast
  2. Broadcast
     There are 2 types of it:
        1. Direct Broadcast  
           By default disabled (no ip redirect-broadcast).
           A PC wants to send a broadcast message to all devices in another network.  

        2. Limited Broadcast
           255.255.255.255
           Broadcast inside the same network.  
   <br/>

  3. Multicast  
     It has reserved IP addresses of its own 224.0.0.0 - 239.255.255.255.
     Multicast can be 2 types:
        1. Reserved Link Local Address (224.0.0.0 - 224.0.0.255). 
           Here TTL=1, meaning it doesn't go out of the network (local).  
        3. Globally Scoped Address (224.0.1.0 - 239.255.255.255) (Internet). 


* Two types of IP Addresses
  1. Private IP Address.
     * Not allowed on the internet. 
     * Local in the network.  
     * Free.
     * Range of private IP addresses: 
       * 10.0.0.0/8 (10.0.0.0 - 10.255.255.255)
       * 172.16.0.0/12 (172.16.0.0 - 172.31.255.255)
       * 192.168.0.0/16 (192.168.0.0 - 192.168.255.255)

  3. Public IP Address. 
     * Routed through the internet. 
     * You have to pay to buy public IPs.

<br/><br/>

### <span class="[chapterColor] subtitle">Loopback 
* Usually is 127.0.0.1
* It can be 127.0.0.0 - 127.255.255.255

<br/><br/>

### <span class="[chapterColor] subtitle">Link Local Address
* APIP
* If the DHCP doesn't know what IP to put it will put an IP from this range (169.254.0.0 - 169.254.255.255).
* TTL = 1. 

<br/><br/>

### <span class="[chapterColor] subtitle">Test - Net Address  
* For testing purposes
* It ranges between (192.0.2.0 - 192.0.2.255)

<br/><br/>

### <span class="[chapterColor] subtitle">Classes of IP  

| IP Class | IP Starts With | Subnet Mask |
|----------|----------------|-------------|
| Class A  | 0 - 127        | /8          |
| Class B  | 128 - 191      | /16         |
| Class C  | 192 -223       | /24         |
| Class D  | 224 - 239      | Multicast   |
| Class E  | 240 - 255      |             |  

* IP address with subnet mask the same as the one it's supposed to have according to its class is called **Classfull**.
* IP address that has a subnet mask different than the one that it's supposed to have according to the class it's in is called **Classless**.  

<br/><br/>

### <span class="[chapterColor] subtitle">Subnetting  

* This screenshot is good 
 <img src="subnetting.PNG">

<br/><br/>

### <span class="[chapterColor] subtitle">VLSM (Variable Lenght Subnet Mask)  
* The number of users is what I depend on to subnet the network.  
* I think the screenshot is enough
  <img src="vlsm_subnetting.PNG">