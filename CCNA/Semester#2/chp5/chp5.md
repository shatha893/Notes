* Issues with Layer 1 Redundancy (When there are multiple links in the network)
  1. MAC Address Instability (MAC Address Flapping): it's when a switch recieves the same MAC address from 2 interfaces. Whichs shouldn't happen.
  2. Broadcast Storm: A problem could start as instability and continue with a broadcast storm. The switches keep sending broadcasts infinitly until the CPU and the links are full and can't handle any more traffic.
  3. Duplicate Unicast Frame (Almost rare to happen): when the switch doesn't know the destination MAC it broadcasts it and it's called Unknow Unicast and when this happens there might happen that a PC recieves a duplicate frame.  

* Does these things happen only to switches and not routers(Layer 3 Devices)?  
  Yes, they only happen to switches because
  1. Routers don't forward broadcast outside of the link or network.
  2. Each packet has a TTL which means we won't have an infinite loop because when the TTL reaches 0 the packet will be dropped. 


* Spanning Tree Protocol (STP)
  * We have a *Spanning Tree Algorithm (STA)*.
  * It exists to solve the redundancy problems we talked about previously.
  * The STA works as follows:
    1. Election Root Switch (switch za3eem lal7ara).
        * This root switch if it detects that it recieved the same frame from 2 interfaces and when this happens it sets one of these 2 links temporarily *down* until it's needed.

       * Each switch has a BID (Bridge ID) which is MAC + priority of the switch.
       * The less the *priority* is the better.  
       * The election of the Root switch happens as follows:
       * Lowest BID which means Lowest Priority first and then if the lowest priority is equal we look at the Lowest MAC Address. 
       * The priority can be a value in range 0-65536 and it's default value is 32768. It also had to be from the مضاعفات the number 4096.  

    2. Ports Election  
       * Designated Port: 
         * It's the port that the *root bridge* uses to communicate with other switches. 
         * How to choose (elect) this type of port:
           1. All root switch ports.
           2. One DP per segment link(each link should have a DP).  
        * To decide which one of the ports on the link is the designated one we look at the BID and the switch with the lowest BID is the one we choose to put the DP on it. 
   
       * Root Port: 
         * It's the port that gets the switch to the shortest path to get to the root bridge.  
         * How it gets elected:
            * One RP per switch.

       * Blocking Port: It's any other port and traffic doesn't go through it. 

       * Path Cost could be 
         * 10gig ==path=cost== 2
         * 1gig ==path=cost== 4
         * Fast Ethernet ==path=cost== 19
         * Ethernet ==path=cost== 100   

* BPDU (Bridge Protocol Data Unit)
  * It consists of the following:
    * Protocol ID.
    * Version.
    * Message Type.
    * Flag.  

    * Root ID (Bridge ID of the root Bridge. By default every switch considers itself as the root bridge).
    * Cost of the Path.
    * Bridge ID.
    * Port ID (The port that the BPDU got out from).

    * Message age.
    * Max age (the max time the root switch waits for BPDUs so that it can decide if the link is down).
    * Hello time (time intervals that BPDUs gets sent in).
    * Forward Delay.
  * When the switches agree on a root switch this root switch will be the only one that sends BPDU.

* Each VLAN has a BID.
* And the BID in this case consists of 
  * Extended System ID (12 bits).
  * Priority (4 bit).
  * MAC (48 bit).
  * The extended and priority are summed up.
* PVST+  
  * Each VLAN has it's own calculations.
* RSTP  
  * All vlans has one calculation.
  * Fast.
* Rapid-PVST+  
  * Used everywhere in the world.
* MSTP & MST(CCNP).


```console
S1# config t
S1(config)# spanning-tree vlan 10 priority 0
//ORRR 
S1(config)# spanning-tree vlan 10 root primary
//                range      1-4096
S1(config)# spanning-tree vlan 10 root secondary
//show spanning-tree
```  
* STP  
  * sth????
    * Disabled (shutdown)
    * Blocked (no traffic)
    * Listening (BPDU only).
    * Learning (BPDU + MAC Learning).
    * Forwarding (Forward Traffic).
  * Port Fast (same idea as "edge" in the RSTP. Command `S1(config-if)# spanning-tree portfast`).
  * BPDU Guard( command `S1(config-if)# spanning-tree bpduguard enable`)
  * Uplink Fast(legacy)
  * Backbone Fast(legacy)
  * BPDU filter.
  * Loop Guard
  * Root Guard

* RSTP
  * sth????
    * Discarding (immediatly).
    * Learning.
    * Forwarding.
  * Edge

* In RSTP 
  * Edge Port
    * Any port that is connected to an end host is considered an edge port
  * Link Type  
    * Connected to SW or Hub.  
    * Could be either *point to point (Full Duplex)* or *shared (Half Duplex)*.

* Port Priority.  
* How to change the spanning tree mode 
```console
S1(config)# spanning-tree mode ?
```