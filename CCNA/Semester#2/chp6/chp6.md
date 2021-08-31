* Port channel is a protocol that allows me to make a bunch of physical links one logical link.
* Types of Port Channels:
  1. PAGP  
     * Conditions on both switches to use it:
       1. Same port type.
       2. Same configuration.
       3. Same vlan.   
    * Works only on Cisco devices (Cisco Proprietary).
    * Sends message each 30 seconds.
    * Types of PAGP:
      1. PAGP Desirable(It starts the negotiation on its own).
      2. PAGP Auto(Waits for someone to negotiate with it so that it can continue the negotiation).
      * On works with them( Not recommended because if there was a loop it won't be detected).   

       | Sw1        | ON(SW2)                                  | Desirable(SW2)  | Auto(SW2)      |
       |----------------|-------------------------------------|------------|------------|
       | ON             | It will work\n<br>{Not recommended} | Won't Work | Won't Work |
       | PAGP Desirable | Won't Work                          | Will Work  | Will Work  |
       | PAGP Auto      | Won't Work                          | Will Work  | Won't Work |  

   * LACP 
     * It's modes are:
       * ON
       * LACP Active Mode (Just like the desirable in PAGP).
       * LACP Passive Mode (Just like the Auto in PAGP).
  
       | Sw1        | ON(SW2)                                  | Active(SW2)  | Passive(SW2)      |
       |----------------|-------------------------------------|------------|------------|
       | ON             | It will work\n<br>{Not recommended} | Won't Work | Won't Work |
       | Active | Won't Work                          | Will Work  | Will Work  |
       | Passive      | Won't Work                          | Will Work  | Won't Work |  

   * Configuration:
     ```console
     SW1# config t
     SW1(config)# int rang gig0/1-2  
     SW1(config)# channel-group 1 mode active 
     SW1(config)# int portchannel 1 
     SW1(config)# switchport mode trunk 
     ```   

     ```console
     SW1# config t
     SW1(config)# int rang gig0/3-4  
     SW1(config)# channel-group 1 mode passive
     SW1(config)# int po1
     SW1(config)# switchport mode trunk 
     ```  

     ```console
     SW2(config)# show etherchannel summary
     ```  

   * Algorithm:
     * We can use an algorithm depending on:
       * Src MAC.
       * Src IP.
       * Dst MAC.
       * Dst IP.
     * And what makes sense is to depend on the source address because it doesn't make sense to depend on the destinations.