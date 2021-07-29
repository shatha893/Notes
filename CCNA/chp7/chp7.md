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

# <span class="title"> Ethernet Switching

<span class="date">Tuesday, 27/7/2021</span> 

<br/><br/>

### <span class="chapter2subs subtitle">Ethernet Encapsulation  

* Ethernet operates in both the physical and data link layers. 
* Ethernet supports data bandwidths of the following
  * 10 Mbps  
    100 Mbps  
    1000 Mbps (1 Gbps)  
    10,000 Mbps (10 Gbps)  
    40,000 Mbps (40 Gbps)  
    100,000 Mbps (100 Gbps)  

<br/><br/>

### <span class="chapter2subs subtitle">Frame Fields  

* Maximum size of the frame is 1518 bytes and the minimum is 64 bytes.
* If the frame recieved was of size greater than 1518 bytes it is called a Jumbo Frame (GET BACK TO IT!)
<img src="https://o.quizlet.com/TkpN3m81NtdmoiTjM48Cag_b.png">   

<br/><br/>

### <span class="chapter2subs subtitle">Preamble  

  * We don't include the preamble with the size of the frame.  
  * It takes 8 bytes.
  * It contains 7 bytes of rubbsih values for *synchronization*, and 1 byte to point the start of the frame.

<br/><br/>

### <span class="chapter2subs subtitle">Type  
   
   * The field that is called *length* in the previous illustration is the same as the type field.
   * If it was 0x800 then it means IPv4.
   * If it was 0x86DD then its IPv6.
   * If it was 0x806 then it indicates ARP.  

<br/><br/>

### <span class="chapter2subs subtitle">Frame Check Sequence (FCS)  

   * It uses the CRC (Cyclic Redundancy Check) which is a value that relies on a specific calculation which is calculated first in the sender and then the same calculation is done and the value of that calculation is compared with the sent value if they're not equal then the frame is dropped.

<br/><br/>

### <span class="chapter2subs subtitle">Ethernet MAC Address  

* It's consisting of 48 bits (24-bits for OUI && 24-bits for Vendor Assignment).

* Destination MAC address could be  
  * Unicast MAC Address
  * Multicast MAC Address  
     To send a message to multiple recievers the MAC should start with  
       * 01-00-5E type IPv4.
       * 33-33    type IPv6.  
  
  * Broadcast MAC Address  
    To broadcast a message the MAC address has to be like this  
      * FF-FF-FF-FF-FF-FF  

<br/><br/>

### <span class="chapter2subs subtitle">MAC Address Table aka Content Addressable Memory(CAM)  
* This table is stored in the switch's RAM.
* It's the place where the switch stores the MAC addresses of the devices it learned along with the device's port.
* 
