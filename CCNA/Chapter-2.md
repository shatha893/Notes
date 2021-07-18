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

# <span class="title">Chapter 2 : Basic Switch and End-Device Configuration


<span class="date">Tuesday, 29/6/2021</span> 
<br/><br/>

### <span class="chapter2subs subtitle"> General Knowledge
* IOS is originally owned by cisco and cisco gave it to apple to use it for it's mobile phones.  
* On cisco routers today they have IOS 15.  
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

<span class="chapter2subs">1. Out-of-Band (Local).</span>  
   * To access a cisco device locally we use something called the **console cable** which is usually used to connect the device to a computer for maintenance and the initial configuration.  
  
   * To connect the console cable to the computer we need a RS 252 port and a RJ45 port in the switch.  

   * When do we have to use the console?
      1. When I have a new device.
      2. Intial Configuration.
      3. Remote.
      4. Recovery of Password.(At the end of the course).  
   
<br/>
<span class="chapter2subs">2. In-Band (Remotely). </span>   

   * We use Virtual teletype (VTY) which allows me to access the device remotely.  
   According to *techopedia* a vty is

      <blockquote>
         a command line interface (CLI) created in a router and used to facilitate a connection to the daemon via Telnet, a network protocol used in local area networks. To connect to a VTY, users must present a valid password.
      </blockquote>  
   * See what do we mean by daemon [^1]. 
   <br/>

   * Both Telnet and SSH  can be used to connect to a device remotely but the deference is that SSH establishes a secure connection whereas Telnet establishes an unsecure.  
<br/><br/>

### <span class="chapter2subs subtitle"> Terminal in Packet Tracer  
  * What do we use to configure a device?  
  In real devices we use something called *Emulation Software (PuTTY)* but in Packet Tracer the devices have something called *Terminal*.
<br/><br/>


### <span class="chapter2subs subtitle"> Navigation Through IOS (Command Modes)   

<span class="chapter2subs"> 1. User exec Mode ``>``.</span>  
   Has access to a limited number of monitoring commands such as:  
   * **Ping:** which is a protocol to check the ability to connect to another device, so by providing the IP of the other device it will tell me if we can connect to it or not by an "echo request" that is sent to the IP and the IP sends back an "echo reply" and this reply is what tells me "I can connect to that IP".

   * **TraceRoot:** shows me all the IPs that were hopped upon in the path until we get to the destination IP.  

   * To switch up to the next mode which is *Privileged Mode* use the following command  

         Enable
      

<span class="chapter2subs">2. Privileged Mode (aka Enabled Mode) ``#`` </span>  
   * Allows access to all commands and features such as show, copy, delete and reload (troubleshooting and check).  
    To get to the next mode we need to, first, go to the privileged mode and then to the Global configuration mode.  

   * Command to get to the *Global Configuration Mode*  
      ```console
          Switch# configure terminal  
      ```
   * Command to go back to the user mode  
  
         Switch# disable  

   * To see what are the applied configurations we use the running-config with this command  

         Switch# show running-config 

   * To copy the configurations from the RAM to the NVRAM to save everything  
            
         Switch# copy running-config startup-config
   * To get out of the device entirely we use  

         Switch# exit
  
<br/>


<span class="chapter2subs">3. Global Configuration Mode ``(config)#``.</span>
   * It gives me the ability to configure the hostname, clock and allows the transition to the next mode(gives me the ability to do *basic configurations*).  

   * You can set a **name** to the current **device** (host) using  

         Switch(config)# hostname [NAME OF MY CHOOSING]  
   
      To reverse the command that I did just now  

            Switch(config)# no hostname sw1  
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

            ctrl+shift+6  

      1. Removing the whole lookup thing using  

               Switch(config)# no ip domain-lookup

   * To put a **Message of the Day** use the following  

         Switch(config)# banner motd $[TEXT USUALLY "Authorized Only"]$  

   * **Configuring Passwords**  
   We configure the passwords for  
   1. The Console.  
      To log into the console  

            Switch(config)# line console 0

      If we don't write the command ``login`` the device won't ask us for the password.
         

   2. The VTY.  
      To login through the vty use (The range we put is the number of users that can connect)  

            Switch(config)# line vty [SESSION NUMBER AS A RANGE "e.g. 0 4"]  
      
      To hash or encrypt the password we have we use the following command  

            Switch(config)# service password-encryption

      When using the keyword ``password`` it gets hashed with md7 but when we use the keyword ``secret`` if gets hashed with md5 which is much better.  

   * To be able to **connect to the switch remotely** it needs an IP address but switches exist in the data link layer so what are we supposed to do about this?  
   A **Switch Virtual Interface (SVI)** that will have the same characteristics as a router and can be created by creating a VLAN  

         Switch(config)# interface VLAN 1   


   * To connect to the switch remotely write the following command in the **Command Line**  
 
          C:/ telnet [IP ADDRESS]
          
   * To switch up to the next mode (*specific configuration mode*) if it was an interface we do the following  
  
         Switch(config)# interface [PORT TYPE]  

   * To shutdown the chosen port  
  
         Switch(config)# shutdown  

   * When putting a ``?`` after a part of the command it will give me hints on what the command might be.  
   * Putting ``?`` alone it will give me the commands I can execute in the current mode.  
   * To erase all of the configurations we either just **reload** the device if we didn't copy the configs but if we did copy them we write the following command  

            Switch(config)# erase startup-config
   * To go back to the privileged mode use the command  
            
          Switch(config)# exit

<span class="chapter2subs">4. Line Sub-Configuration Mode ``(config-line)#``.</span>  

* Used to configure console, SSH, Telnet and AUX access.
* To configure the **Console**'s or **VTY**'s password  

      Switch(config-line)# password [PASSWORD]  
      Switch(config-line)# login

* To get back to the global config mode use  
  
      Switch(config-line)# exit

<span class="chapter2subs">5. Interface Sub-Configuration Mode ``(config-if)#``.</span>  
* Used to configure a switch's physical port (I'm guessing the logical port) or interface.
* After executing the command ``interface vlan`` we do the following to create an ip address for the switch  
 
      Switch(config-if)# ip address [IP ADDRESS] [SUBNET MASK]
      Switch(config-if)# no shutdown
* To get back to the global config mode use  
  
      Switch(config-if)# exit  

<br/><br/>

# <span class="title">Initial Configuration  
<span class="date">Tuesday, 13/7/2021 --- Eng Hamzeh's Lecture</span> 

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
### <span class="chapter2subs subtitle"> Access Methods to the Switch  

1. Physically using the console cable. When the device is new we can't access it but using the console. Also, if we want to accomplish password recovery we only can do that using the console.  
* To use the console we need a *Terminal Emulation Program* and this program can be  

   1)Putty.  
   2)Hyper Terminal.  
   3)Teraterm.  
   4)Secure CRT.    


2. Remotly either by SSH (Secure SHell) or by using Telnet.  
* Cisco's advice is to not use *Telnet* at all because it's not secure and use *SSH* instead.  
* Two conditions to connect remotely:  
  1) It has to be inside the network of the device it wants to connect to.  
  2) They both have to have IP addresses.

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
After putting the running configuration from the RAM into the NVRAM and it becomes startup config.  

cIOS Command Structure  

```console
show IP protocol
show version
ping [IP ADDRESS]
```
* We'll know the meaning of each of these commands later on.  
* We can write an abbreviation of the command e.g. show version make it sh ver.  
* In some commands the `Enter` button scrolls down line by line and `space` button scrolls down page by page.  

* What is the DNS lookup?  
  Looks for the ip address of the input I put in the privilege mode in the device's terminal.  

<br/><br/>

### <span class="chapter2subs subtitle">Passwords  

```console
Router(config)# enable password CCNA 
Router(config)# enable secret CCNA 
```
The first is not hashed but the second is hashed with MD5 and it might as well not be hashed because it's kind of useless because of a tool called "hashcat"

[^1]:In multitasking computer operating systems, a daemon is a computer program that runs as a background process, rather than being under the direct control of an interactive user.