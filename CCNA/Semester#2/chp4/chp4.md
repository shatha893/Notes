* Inter-VLAN Routing Operation  

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