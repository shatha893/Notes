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

# <span class="title">Chapter 6 : Data Link Layer

<span class="date">Monday, 26/7/2021</span> 

<br/><br/>

### <span class="chapter4color subtitle">Data Link Layer Functionalities  
1. Communication between devices in the same network.
2. The type of addressing used in this layer is *MAC Address/Physical Address*.
3. Error Detection.
4. Control the data on the media (Prevention or Detection of Collisions).

<br/><br/>

### <span class="chapter4color subtitle">Why Does Error Detection Happen in this Layer?   
Because most of the corruption of data happens in the physical layer.

<br/><br/>

### <span class="chapter4color subtitle">Two Sublayers Divide the Data Link Layer  
1. Logical Link Control Sublayer (LLC)
   Which provides communication between hardware layers and software layers.  

2. MAC Sublayer  
   It has multiple functionalities:
   * Frame Delimiting, which's the process of building the ethernet header, in other words, building the structure of the frame.
   * Addressing, which's, as the name suggests, adding the source MAC address and the destination MAC address.
   * Error Detection, which's also as the name suggests, the process of checking if there are any problems with the frame.  
   * Media Access Control, which's the process of controlling collisions that are or might be encountered (with the help of CSMA/CD or CSMA/CA).

<br/><br/>

### <span class="chapter4color subtitle">MAC Address  
* Is written in Hexadecimal to be precise it consists of 12 hexa digits.  
* It exists so that devices on the same network can communicate with each other.  
* Example on a MAC address: ABCD.1234.56FP
* The first part " ABCD.12 " is called the OUI (Organizational Unique Identifier). 
* The second part " 34.56FP " is *Vendor Assigned*.  

<br/>

* If we're talking about **switches** each one has only **one MAC address**. 
* On the other hand, **routers** have a **MAC address for each port**.  

<br/>

* To know a MAC address of the PC open CMD on it and write the command `ipconfig /all`.  

* Levels of communications through a network  
<img src="example.PNG">