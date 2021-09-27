# Inter-VLAN Routing Operation  

  * Inter-VLAN routing is the process of forwarding network traffic from one vlan to another.
  * 3 inter-VLAN routing options
    * Legacy Inter-VLAN routing  
      * LEGACY.
      * Not scalable.
      * The router would have multiple interfaces, an interface for each vlan.  
    * Router on a Stick  
      * Overcomes the limitations of the previous option. It only requires one physical ethernet interface.
      * The router's interface is configured into subinterfaces to identify routable vlans.
      * The subinterfaces are software-based virtual interfaces.
      * The mechanism works like this, the sender's message that is intended to the other vlan is forwarded to the router then the router forwards the message to the subinterface. After a routing decision is made based on the destination IP address the data frame gets tagged with the new vlan number and it's forwarded to the exit interface.
    * Layer 3 switch using switched vitrual interfaces (SVIs)
      * It provides layer 3 processing for packets that are sent to or from all switch ports associated with that vlan. 
      * Advantages:
        * Much faster than a router on a stick because everything is *hardware* switched and routed.  
        * There's no need for external links from the switch to a router for routing.
        * They're not limited to one link (because Layer 2 EtherChannels can be used as trunk links between the switches to increase bandwidth). 
        * Latency is much lower because data does not need to leave the switch in order to be routed to a different network.
        * More commonly deployed in a campus LAN than routers.
      * The only *disadvantage* is that it's more expensive.  

<br/><br/>

## Router On A Stick Inter-VLAN  

* For PCs on different LANs to be able to communicate the **switches** in the network has to have **VLANs** and **trunk ports** configured and the **routers** have **inter-VLANs** configured.  

* The configuration of vlan and trunking happens as follows:
  1. Create and name the vlans  
```console
S1(config)# vlan 10
S1(config-vlan)# name LAN10
S1(config-vlan)# exit
S1(config)# vlan 20 
S1(config-vlan)# name LAN20 
S1(config-vlan)# exit  
S1(config)# vlan 99 
S1(config-vlan)# name management
S1(config-vlan)# exit
```
  2. Create the management interface.
  3. Configure access ports.
  4. Configure trunking ports.   

* The subinterface configuration  
  * The subinterface syntax is the *physical interface* followed by a period and a *subinterface number*.
  * It's customary to match the subinterface number with the vlan's number.
  * For each subinterface we write the following commands (the physical interface and vlan number can be different of course)
    ```
    R1(config)# interface G0/0/1.10
    R1(config-subif)# description [SOME DESCRIPTION]
    R1(config-subif)# encapsulation dot1Q 10
    R1(config-subif)# ip add [IP ADDRESS] [SUBNET MASK]
    R1(config-subif)# exit
    ```  

  * To verify the Router on a stick inter-vlan configuration we can use
    * `show ip route` which displays for me that the subinterfaces are appearing in the routing table of R1.
    * `show ip interface brief` its output shows that the subinterfaces have the correct IPv4 address configured and that they're operational.
    * `show interfaces [SUBINTERFACE ID]` which can be used to verify the subinterfaces too.  
    * `show interfaces trunk` could show me if there are any misconfigurations with the trunk ports.

## Layer 3 Switch Intervlan-Routing  

* What are the capabilities of a layer 3 switch
  1. Route from one vlan to another using multiple switched vlan interfaces (SVIs).
  2. Convert a layer 2 switchport to a layer 3 interface (i.e. routed port). A routed port is similar to a physical interface of a router.  

* Layer 3 Switch Configuration  
  1. Create the vlans.
  2. Create the svi vlan interfaces  
     ```
     D1(config)# interface vlan 10
     D1(config-if)# description Default Gateway SVI for 192.168.10.0/24
     D1(config-if)# ip add 192.168.10.1 255.255.255.0
     D1(config-if)# no shut
     D1(config-if)# exit
     ```
  3. Configure access ports.
  4. Enable IP routing  
     * In global configuration mode we write the command `ip routing`.  

* If vlans are to be reachable by other layer 3 devices, then they must be advertised using static or dynamic routing.
* To enable routing
* A routed port is created on a Layer 3 switch by disabling the switchport feature on a layer 2 port that is connected to another layer 3 device. Specifically, configuring the `no switchport` interface configuration command.  

<br/>

* Routing Configuration on a Layer 3 Switch  
  1. Configure the routed port  
        ```
        D1(config)# interface GigabitEthernet1/0/1
        D1(config-if)# description routed Port Link to R1
        D1(config-if)# no switchport
        D1(config-if)# ip address 10.10.10.2 255.255.255.0
        D1(config-if)# no shut
        D1(config-if)# exit
        ```
  2. Enable routing
  3. Configure routing  
     * By configuring the routing protocol OSPF as follows
       ```
       D1(config)# router ospf 10
       D1(config-router)# network 192.168.10.0 0.0.0.255 area 0
       D1(config-router)# network 192.168.20.0 0.0.0.255 area 0
       D1(config-router)# network 10.10.10.0 0.0.0.3 area 0
       ``` 
  4. Verify routing
  5. Verify connectivity 
