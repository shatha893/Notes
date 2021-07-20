<link href="styles.module.css" rel="stylesheet">
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

# <span class="title">Chapter 2 : Initial Configurations


<span class="date">Tuesday, 29/6/2021 && Tuesday, 13/7/2021</span> 
<br/><br/>

### <span class="chapter2subs subtitle">What is an operating system?  
  It's the software that runs the hardware of the computer. Whereas the os kernel is what connects the shell to the hardware.  

<br/><br/>
### <span class="chapter2subs subtitle">IOS?
Cisco made a processor of their own called *silicon one* after using *intel*'s processor for a while and that's what Apple did they in a way borrowed IOS from CISCO.   

<br/><br/>
### <span class="chapter2subs subtitle">How to talk with the device?  
Either through the CLI (Command Line Interface) or the GUI (Graphical User Interface).  
Each CLI of each OS has its own commands.  

<br/><br/>
### <span class="chapter2subs subtitle"> Latest IOS or Suggested IOS?  
Specifically in cisco the latest IOS is the newest and the suggested is tested, so there could be bugs in the newest version because it's not tested before its available to the public, they test it afterwards.

<br/><br/>
### <span class="chapter2subs subtitle"> Cisco Device Booting Process  

 1. The device performs POST (Power-On Self-Test) where it discovers and verifies its hardware.  
 2. If the post test is successful, the bootstrap program is copied from the ROM to the RAM.  
 3. The bootstrap program decides which IOS image to load from the flash memory or load a backup from the TFTP into the RAM, then loads the chosen IOS. If no IOS image was found the device goes into ROMmon mode. 
 4. IOS finds the startup configuration file usually located in the NVRAM and loads it into the RAM as the running configuration.  
<br/><br/>

<span class="chapter2subs subtitle"> Some Terminologies' Explanations  


* <span class="chapter2subs">NVRAM</span>  
According to Wikipedia a Non Volatile Random Access Memory (NVRAM) is  
  <blockquote>

  *is random-access memory that retains data without applied power.*
  </blockquote>

* <span class="chapter2subs">TFTP</span>  
According to Lifewire TFTP is  
      <blockquote>
      *Trivial File Transfer Protocol is a technology that transfers files between network devices and is a simplified version of the more robust File Transfer Protocol.*
      </blockquote>

* <span class="chapter2subs">ROMmon Mode</span>  
  Taken From Cisco Community website  
    <blockquote>

    *These are three ways the router can enter ROM Monitor (ROMmon) mode (rommon#>):*   

    * *Reload, initialize, or power cycle the router with the configuration register boot field set to 0.*  
    * *Reload, initialize, or power cycle the router without having a Cisco IOS  Software image to boot from.*   
    * *Press the Break key within the first 60 seconds of the system boot. The break function is enabled during this period.*  
    </blockquote>
<br/><br/>
### <span class="chapter2subs  subtitle"> Access Methods  
<span class="chapter2subs">1. Physically</span>  

   * When do we *have* to access the device physically?  
      * When the device is new for initial configurations.
      * Password recovery.  

   * How to access a device physically?  
      With the *console cable* which lets me gain access to the device by connecting my PC with it through this cable.
      The cable is connected to the switch's RJ45 port and the PC's RS 252 port.
  
   *  To use the console we need a *Terminal Emulation Program* and this program can be  
      1) PuTTY.  
      2) Hyper Terminal.  
      3) Teraterm.  
      4) Secure CRT.
   
<br/>
<span class="chapter2subs">2. Remotely </span>   

  * How to connect to a device remotely?  
    Either by SSH (Secure SHell) or by using Telnet.  
    Cisco's advice is to not use *Telnet* at all because it's not secure and use *SSH* instead.  

   * What are the conditions to connect to a device remotely?    
    1) It has to be inside the network of the device it wants to connect to.  
    2) They both have to have IP addresses.  
   
   * We use Virtual teletype (VTY) which allows me to access the device remotely.  
   According to *techopedia* a vty is
      <blockquote>

       *a command line interface (CLI) created in a router and used to facilitate a connection to the daemon via Telnet, a network protocol used in local area networks.*   
       *To connect to a VTY, users must present a valid password.*
      </blockquote>  

   * See what do we mean by daemon [^1].  
<br/><br/>

### <span class="chapter2subs subtitle"> Devices Components  
The router has the same components as the PC which are: 
1) Memory.
2) CPU.
3) Power Supply.
4) Interfaces.
5) Buses.

<br/><br/>

### <span class="chapter2subs subtitle"> Memory Types  

1) NVRAM has the *startup configuration*.
2) Flash Memory that has the IOS.
3) RAM has the running configuration and table.
4) ROM has the basic IOS and POST (Power On Self Test).

<br/><br/>

### <span class="chapter2subs subtitle"> First the ROM  
It starts the basic IOS and something called power on self test happens to check that everything is working properly.  

<br/><br/>

### <span class="chapter2subs subtitle">Then the Flash Memory  
Is a bit slow so the IOS is taken from it to the RAM because it's faster.  

<br/><br/>

### <span class="chapter2subs subtitle">Then the RAM  
We have the running configuration on the RAM and when we're finished with the configuration it's put in the NVRAM.  

<br/><br/>

### <span class="chapter2subs subtitle">Then the NVRAM  
After putting the running configurations from the RAM into the NVRAM and it becomes what we call startup configurations.  

<br/><br/>

### <span class="chapter2subs subtitle"> Command Structure  
<img src="https://ccna-200-301.online/wp-content/uploads/2020/04/Basic-IOS-Command-Structure.png">

* We can write an abbreviation of the command e.g. *show version* make it *sh ver*.  

* In some commands the `Enter` button scrolls down line by line and `space` button scrolls down page by page.  

* What is the DNS lookup?  
  Looks for the ip address of the input I put in the privilege mode in the device's terminal.  


<br/><br/>

### <span class="chapter2subs subtitle"> Navigation Through IOS (Command Modes)   

<span class="chapter2subs"> 1. User Exec Mode ``>``.</span>  
Has access to a limited number of monitoring commands such as:  

 * `Ping`: 
    * Command  
      ```console
      Switch>ping [IP ADDRESS]
      ```
    * Explanation  
    It's a protocol to check the ability to connect to another device, so by providing the IP of the other device it will tell me if we can connect to it or not by an "echo request" that is sent to the IP and the IP sends back an "echo reply" and this reply is what tells me "I can connect to that IP".  
<br/>

* `TraceRoot`: 
    * Command  
      ```console
      Switch>traceroute [IP ADDRESS]
      ```
    * Explanation  
      It shows me all the IPs that were hopped upon in the path until we get to the destination IP.  
<br/>

* To switch up to the *Privileged Mode* use the following command  
    ```console
    Switch>Enable
    ```
 <br/>     

<span class="chapter2subs">2. Privileged Mode (aka Enabled Mode) ``#`` </span>  
   * Allows access to all commands and features such as show, copy, delete and reload (troubleshooting and check).  
    To get to the next mode we need to, first, go to the privileged mode and then to the Global configuration mode.  

   * Command to get to the *Global Configuration Mode*  
      ```console
      Switch# configure terminal  
      ```
   * Command to go back to the user mode  
      ```console
      Switch# disable  
      ```
   * To see what are the applied configurations we use the running-config with this command  
      ```console
      Switch# show running-config 
      ```
   * To copy the configurations from the RAM to the NVRAM to save everything  
      ```console   
      Switch# copy running-config startup-config
      ```
   * To get out of the device entirely we use  
      ```console
      Switch# exit
      ```
<br/>


<span class="chapter2subs">3. Global Configuration Mode ``(config)#``.</span>
   * It gives me the ability to configure the hostname, clock and allows the transition to the next mode(gives me the ability to do *basic configurations*).  

   * You can set a **name** to the current **device** (host) using  
      ```console
      Switch(config)# hostname [NAME OF MY CHOOSING]  
      ```  

      To reverse the command that I did just now   
      ```console
      Switch(config)# no hostname sw1  
      ```
      Or I can overwrite the command with a new name.  

      The constraints over host names are the following:  
      1. Start with a letter.
      2. Ends with a letter or digit.
      3. Letters, digits and dashes are the only allowed characters.
      4. No spaces.
      5. 64 character maximum (not so accurate because it depends on the type of device you have that's why it could be 64, 128 or 512).  
   <br/>  

   * To solve the problem of the **lookup** that happens when typing a wrong command by mistake we have 2 options:  
     1. Interrupting the lookup using   
         ```console
         ctrl+shift+6  
         ```  
      1. Removing the whole lookup thing using  
         ```console
         Switch(config)# no ip domain-lookup
         ```
   * To put a **Message of the Day** use the following  
      ```console
      Switch(config)# banner motd $[TEXT USUALLY "Authorized Only"]$  
      ```

   * To be able to **connect to the switch remotely** it needs an IP address but switches exist in the data link layer so what are we supposed to do about this?  
   A **Switch Virtual Interface (SVI)** that will have the same characteristics as a router and can be created by creating a VLAN  

      ```console
      Switch(config)# interface VLAN 1   
      ```

   * To connect to the switch remotely write the following command in the **Command Line**  
  
      ```console
      C:/ telnet [IP ADDRESS]
      ```
   * To switch up to the next mode (*specific configuration mode*) if it was an interface we do the following  
      ```console
      Switch(config)# interface [PORT TYPE]  
      ```
   * To shutdown the chosen port  
      ```console
      Switch(config)# shutdown  
      ```
   * When putting a ``?`` after a part of the command it will give me hints on what the command might be.  
   * Putting ``?`` alone it will give me the commands I can execute in the current mode.  
   * To erase all of the configurations we either just **reload** the device if we didn't copy the configs but if we did copy them we write the following command  
      ```console 
      Switch(config)# erase startup-config
      ```
   * To go back to the privileged mode use the command  
      ```console            
      Switch(config)# exit
      ```

<span class="chapter2subs">4. Line Sub-Configuration Mode ``(config-line)#``.</span>  

* To get into this mode as console we execute the following command  
  ```console
  Switch(config)# line console 0
  ```
* To get into it as vty we put the following(remote)  
  ```console
  Switch(config)# line vty [SESSION NUMBER AS A RANGE "e.g. 0 4"]  
  ```
* Used to configure console, SSH, Telnet and AUX access.
* To get back to the global config mode use  
  ```console  
  Switch(config-line)# exit  
  ```
<br/>

<span class="chapter2subs">5. Interface Sub-Configuration Mode `(config-if)#`.</span>  
* Used to configure a switch's physical port (I'm guessing the logical port) or interface.  

* After executing the command ``interface vlan`` we do the following to create an ip address for the switch  
  ```console
  Switch(config-if)# ip address [IP ADDRESS] [SUBNET MASK]
  Switch(config-if)# no shutdown
  ```  

* To get back to the global config mode use  
  ```console
  Switch(config-if)# exit  
  ```
<br/><br/>

### <span class="chapter2subs subtitle">Passwords  

* When trying to gain access to the privileged mode
  ```console
  Router(config)# enable password CCNA 
  Router(config)# enable secret CCNA 
  ```  
  The first is not hashed but the second is hashed with MD5 and it might as well not hashed because it's kind of useless because of a tool called "hashcat".  

* When accesssing the console subconfiguration mode  
  ```console
  Switch(config-line)# password [PASSWORD]  
  Switch(config-line)# login
  ```
* When accessing the interface subconfiguration mode  
  Same commands as the console  
  ```console
  Switch(config-line)# password [PASSWORD]  
  Switch(config-line)# login
  ```
* We can encrypt the passwords created with the command `password` with something called CISCO Level 7 Encryption using the following command  
  ```console
  Switch(config)# service password-encryption
  ```

[^1]:In multitasking computer operating systems, a daemon is a computer program that runs as a background process, rather than being under the direct control of an interactive user.