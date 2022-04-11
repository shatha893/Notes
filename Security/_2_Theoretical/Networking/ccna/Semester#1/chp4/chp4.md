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

# <span class="title">Chapter 4: Physical Layer

<span class="date">Sunday, 25/7/2021</span> 

<br/><br/>

### <span class="chapter4color subtitle">Wifi Router (Home Router)  

<img src="https://previews.123rf.com/images/bedo/bedo0803/bedo080300097/2767484-back-of-wireless-router-in-isolated-white-background.jpg">  

* As illustrated in the above image the 4 LAN ports represent the switch meaning whatever devices are connected on them are considered on the same network.   
The port that is name *internet* is considered the router (WAN) which connects our LAN to the internet to a WAN just what a router does.  
The Antenna is to be considered an *access point* meaning it connects devices to the network wirelessly.  
This device also has a *firewall*.  
As mentioned above connections to this device can be wired or wireless.

* What is an *Access Point*?  
  According to *Wikipidea*  

  <blockquote>

  *In computer networking, a wireless access point (WAP), or more generally just access point (AP), is a networking hardware device that allows other Wi-Fi devices to connect to a wired network.*
  </blockquote>  

  <br/><br/>

### <span class="chapter4color subtitle">NIC Card  
* PC's can connect to network intermediate devices wirelessly or wiredly.  
* The NIC Card exists to establish a wired connection to routers and switches.  
* It's basically the hardware that the ethernet cable is plugged into in computers.  
* There's also NIC cards used for wireless connections (WLAN NICs).



  <br/><br/>

### <span class="chapter4color subtitle">Which Layers of the OSI Model Are Considered to Have a Physical Nature?  
* A part of the Data Link Layer is considered to be physical which's the part related to the MAC.  
    

 <br/><br/>

### <span class="chapter4color subtitle">Functions of The Physcial Layer  

1. Physical  Components.
   * Nic Cards.
   * Ports/Interfaces.
   * Copper/Fiber/Wireless.
   * Meaning, the first functionality of this layer is (quoted from the slides):

      <blockquote>

      *Provides the means to transport the bits that make up a data link layer frame across the network media*
      </blockquote>  

2. Encoding  
   Which means transforming the data into a specific pattern that is transmitted through a medium.  

3. Signaling  
   It's the process of having the data carried on the proper signal (e.g. Every ISP has its own frequency so that the data would be carried onto the right signal).

* A Nice Example That Sums It All Up  
  When a person is talking on the phone this is considered to be the **physical component**.  

  The words the person is saying through the phone are encoded into 0s and 1s which is called **encoding**.  

  These 0s and 1s are carried through the network on a specific signal which is called **signaling**.  

 <br/><br/>

### <span class="chapter4color subtitle">Important Terminologies  

1. Bandwidth  
   The link's capacity, for example, let's assume it's 1000Gbps (Theoritically).  

2. Throughput  
   It's the actual capacity that can be sent which in our example is 999Mbps (Practically).  

3. Goodput  
   The actual data the sender sent without counting the PDUs the acknowledgments and other stuff that doesn't concern the user.

4. Delay  
   It explains itself by itself but it could happen for multiple reasons.  

* A Nice Exmaple That Sums It All Up  
  
  الباص السريع  
  Theoritically they said it will fit half of the population of Jordan **(Bandwidth)**.  
  Turns out it only fits 30 people **(Throughput)**.
  If we exclude the driver, his helper and the bus control we will have 27 passengers **(Goodput)**.  
  A flock of sheep is cutting the street and the bus has to wait **(Delay)**.  

 <br/><br/>

### <span class="chapter4color subtitle">Cabling  

* One of the biggest companies that manufactures cables is  **Bandwidth**.  
* Types of Connections  
  1. <span class="chapter4color">Copper cables (wired)</span>   
      * Problems:  
        |  No | Problem     | Explanation                                                                                                                                                                 | Solution                                                                                           |
        |-----|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
        | 1   | Attenuation | Can't carry data into long distances                                                                                                                                        | Install cables in reasonable distances                                                             |
        | 2   | EMI/RFI     | Electromagnetic Interference  also known as Radio Frequency Interference                                                                                                    | The shield in both types of twisted pairs protects from such interferences                                                   |
        | 3   | Crosstalk   | Which's what happens when we have 2 cables close to each other the resulting magnetic field from the electrical current in both wires will affect the other wire's current. |Twisting of each pair of copper wires in a way that the magnetic fields would eliminate each other |  


      * Types:  
        A. <span class="chapter4color">Twisted Pair Cable
          1. UTP (Unsheilded Twisted Pair).  
            It's much more popular than STP eventhough STP has better noise protection. Probably because of the problems STPs suffer from metioned below.    

          2. STP (Sheilded Twisted Pair).  
            It's more expensive and harder to be installed because of the many shields the wires are covered in.  
   
             Both of these are covered with a sheild to protect as mentioned before from outside interferences.

          
              Illustration of both types of twisted pairs
              <img src="https://instrumentationapplication896077558.files.wordpress.com/2020/07/s-u.png?w=506" width=400>  

        B. <span class="chapter4color">Coaxial Cable  

          These days it's only used with TV cabling.  
          <img src="https://res.cloudinary.com/rsc/image/upload/b_rgb:FFFFFF,c_pad,dpr_1.0,f_auto,h_843,q_auto,w_1500/c_pad,h_843,w_1500/R5217972-01?pgw=1&pgwact=1" width=200>  

  2. <span class="chapter4color">Fiber (wired)</span>  
   * Single Mode & Multi Mode  
      | Single Mode Fiber | Multi Mode Fiber |
      |-------------------|------------------|
      | Laser             | LED              |
      | Long Distance     | 550m / 400m      |
      | Yellow Jacket     | Orange Jacket    |
   * The problem with fiber cables is that connecting two cables is a pain in the ass.  
   * It has better tolerance against attenuation than copper wires.  
    
  3. <span class="chapter4color">Wireless Connection  
   * Problems:  
       1.  Bad Security.
       2.  More prone to interferences  
       Quoted from the slides  
           <blockquote>

           *Disrupted by such common devices as fluorescent lights, microwave ovens, and other wireless communications*
           </blockquote>  
       3. Coverage Area  
          Quoted from the slides  
          <blockquote>

          *Construction materials used in buildings and structures, and the local terrain, will limit the coverage*
          </blockquote>

       4. Shared Medium  
       Quoted from the slides  
          <blockquote>

          *Only one device can send or receive at a time and the wireless medium is shared amongst all wireless users.*
          </blockquote>  

   * Types of wireless connection  
       * Wifi
       * Cellular
       * Bluetooth
       * Wimax
       * IR 
       * Zigbee (Usually used with things related to IoT/Very similar to Bluetooth).  


   * Difference between Wifi and WiMax?  
     Wifi covers smaller areas and has lower speed than WiMax. 
 <br/><br/>

### <span class="chapter4color subtitle">UTP Cabling Standards  
* Standards for UTP are established by the TIA/EIA. TIA/EIA-568 standardizes elements as follows:  
  1. Cable Types.
  2. Cables Lengths.
  3. Connectors.
  4. Cable Termination.
  5. Testing Methods.  

* IEEE established electrical standards for copper cabling which rates the cable according to its performance  
1. Category 3 (CAT3).
2. Category 5 and 5e (CAT5 or CAT5e).
3. Category 6 (CAT6).  

* Connectors used by UTPs are the ones we calle *RJ45*.

* Straight-through and crossover UTP Cables  

  | Cable Type                | Standard                       | Application                                        |
  |---------------------------|--------------------------------|----------------------------------------------------|
  | Ethernet Straight-through | Both ends T568A or T568B       | Host to Network Device                             |
  | Ethernet Crossover        | One end T568A, other end T568B | Host to host, switch to switch or router to router |
  | Rollover                  | Cisco proprietary              | Standard for Console                               |

  * The straight through and crossover situation is considered legacy because of the existance of Auto MDIX which senses the cable type.  

<br/>

  <img src="https://cdn.shopify.com/s/files/1/0014/6404/1539/files/568a-vs-568b-chart_1024x1024.png?v=1567709877" >



