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
* What's the role of the *Subnet Mask*?  
  To identify the network/host portion of the IPv4 address.  

* Prefix Length: is the alternative to writing the long decimal subnet mask address and it represents the number of *ones* set in the subnet mask.  
* Network Prefix: is another name for the network address and that's why we call the other notation of the subnet mask *"prefix length"*.  
* IP address consists of 32 bits.
* Network portion is the same on all devices on the same network (It's what indicates the network the device is on).  


* How to know the network from the host portion?
  * The subnet mask does not actually contain the network portion and the host portion. The actual process to identify the network and host portion is the ANDing.
  * We put the IP address and the subnet mask and we AND them (after converting to binary).  
  * After ANDing the ones represent the network portion whereas the zeros represent the host portion.  
  * Anything mapped with the 255 is a network portion and anything mapped with 0 is a host portion.

* Most famous 3 subnet masks?
  * 255.0.0.0, 255.255.0.0 and 255.255.255.0 . 

* When we write the subnet mask in this way *e.g \24*  
    It means that the network portion consists of 24 bit that is one. 

* We can extract the network address, broadcast address and host address using the subnet mask.
    
* Within each network there is 3 types of IP addresses:
    1. Network Address (Network ID) : Usually the 1st IP in the network. Which's the result of the ANDing of the IP with the subnet mask.
    2. Broadcast Address : Usually the last IP in the network. Which is *e.g 192.168.1.255* (replace the zeros in the network id with 255s).
    * It's forbidden to use the previous 2 addresses as an IP for any of the hosts (because they're reserved).   
    3. Host Address : the 1st IP address allowed for hosts is *e.g 192.168.1.1* and the last available one is *e.g. 192.168.255.254*. Meaning the number of hosts is 2^16-2.

* There are different ways to send a packet from a source device and these 3 ways affect the destination IPv4 address:
  1. Unicast
     * The source IP address is always unicast because a packet can only originate from a single device. 
  2. Broadcast
     * There's broadcast in IPv4 but no broadcast in IPv6.
     * There are 2 types of it:
        1. Direct Broadcast  
           * By default disabled (with the command `no ip redirect-broadcast`).
           * A PC wants to send a broadcast message to all devices in another network.  
           * The host uses the target network address with all the host bits as *ones*.

        2. Limited Broadcast
           255.255.255.255
           Broadcast inside the same network. Sends packet to all devices on the same network (By default routers don't forward broadcasts).  
   <br/>

  3. Multicast  
     It has reserved IP addresses of its own 224.0.0.0 - 239.255.255.255.
     Multicast can be 2 types:
        1. Reserved Link Local Address (224.0.0.0 - 224.0.0.255). 
           Here TTL=1, meaning it doesn't go out of the network (local).  
        2. Globally Scoped Address (224.0.1.0 - 239.255.255.255) (Internet). 

<br/><br/>

### <span class="[chapterColor] subtitle">Types of IPv4 Addresses  

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

* NATing stands for (Network Address Translation) which as the name states translates private IPs to public ones so that it can be transmitted and understood through the internet. It usually happens on the router that connects the internal network to the ISP network.  

* Note: Although, a device with a private IPv4 address is not directly accessible from another device across the internet, the IETF does not consider private IPv4 addresses or NAT as effective security measures.

<br/><br/>

### <span class="[chapterColor] subtitle">Loopback 
* Usually is 127.0.0.1
* It can be 127.0.0.0 - 127.255.255.255
* For example, it can be used on a host to test if the TCP/IP configuration is operational

<br/><br/>

### <span class="[chapterColor] subtitle">Link Local Address
* APIPA (Automatic Private IP Addressing)addresses or self-assigned addresses. 
* It's used by the Windows DHCP client if there was no DHCP server available.
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

* In the mid-1990s, with the introduction of the World Wide Web (WWW), classful addressing was deprecated to more efficiently allocate the limited IPv4 address space. Classful address allocation was replaced with classless addressing, which is used today. Classless addressing ignores the rules of classes (A, B, C). Public IPv4 network addresses (network addresses and subnet masks) are allocated based on the number of addresses that can be justified.
<br/><br/>

### <span class="[chapterColor] subtitle">Subnetting (Network Segementation)  

* Reasons for Subnetting?  
  Subnetting reduces overall network traffic and improves network performance. It also enables an administrator to implement security policies such as which subnets are allowed or not allowed to communicate together. Another reason is that it reduces the number of devices affected by abnormal broadcast traffic due to misconfigurations, hardware/software problems, or malicious intent.

* Subnetting can be accomplished depending on:
  1. Location.
  2. Device Type.
  3. Group or Function. 

* The /24 boundary is very popular in subnetting because it accommodates a reasonable number of hosts and conveniently subnets at the octet boundary.  

* A subnet bits are the bits that are borrowed from the host bits and when the number of subnet bits is put as power of 2 the result is *the number of subnets I can make* and *the number of hosts* would be the number of zeros left for the host as power of 2.  

* The network administrator subnets their public address space into subnets with different subnet masks, in order to minimize the number of unused host addresses per subnet. This is known as Variable Subnet Length Masking (VLSM).

* This screenshot is good 
 <img src="subnetting.PNG">

<br/><br/>

### <span class="[chapterColor] subtitle">VLSM (Variable Length Subnet Mask)  
* The number of users is what I depend on to subnet the network.  
* I think the screenshot is enough
  <img src="vlsm_subnetting.PNG">  

* It's called that way because subnets don't have to be of equal size as long as the address ranges do not overlap.  

* The variable-length subnet mask (VLSM) was developed to avoid wasting addresses by enabling us to subnet a subnet.