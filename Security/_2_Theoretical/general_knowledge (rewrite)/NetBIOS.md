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


## <span class="copyright">Machine #1<span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">NetBIOS


<span class="date">Friday, 16/7/2021</span> 


<br/> 

### <span class="lameMach subtitle">What Is It?  
* It stands for Network Basic Input/Output System.  
* Provides related services to the session layer allowing seperated computers to communicate over a LAN.  
* Quoted from *lifewire.com*  
  <blockquote>

  *NetBIOS provides communication services on local networks. It uses a software protocol called NetBIOS Frames that allows applications and computers on a local area network to communicate with network hardware and to transmit data across the network.*
  </blockquote>

* Turns out it's an API.  
 
<br/><br/> 

### <span class="lameMach subtitle">How Does It Work?  

Also quoted from *lifewire.com*  

  <blockquote>

  *Software applications on a NetBIOS network locate and identify each other through their NetBIOS names. In Windows, the NetBIOS name is separate from the computer name and can be up to 16 characters long.*
  </blockquote>  
  It also states that applications on other computers access NetBIOS names over UDP.

<br/><br/> 

### <span class="lameMach subtitle">Workgroup vs Domain  
Workgroup provides a network that is peer-to-peer with max 10 computers and Domain provides a network that is client-server with almost 2000 possible computers.  

<br/><br/> 

### <span class="lameMach subtitle">Services NetBIOS Provides  
1. Name Service (NetBIOS-NS) for name registration and resolution.
2. Datagram distribution service (NetBIOS-DGM) for connectionless communication.
3. Session Service (NetBIOS-SSN) for connection-oriented communication.  

<br/><br/> 

### <span class="lameMach subtitle">NetBIOS-SSN  
For now I'm more interested in the session service (because of the machine I'm solving).