# Section 18: Facilities Security  

## 154. Fire Suppression  

* The process of controlling and/or extinguishing fires to protect an organization's employees, data, equipment and buildings.  
* Three Types of fire suppression techniques  
  * Handheld.
  * Spinklers.
  * Special Hazard Protection.

* Don't use water based extinguisher in a server room.  

* Classes of fire we have  
  * class A ( Use water base extinguisher) 
  * class B  
    * Flammable gases or liquids
    * Extinguished with a CO2 based fire extinguisher.
  * Class C
    * Electrical Fires.
    * CO2 based extinguisher.
  * Class D  
    * Laptops have lethuim.
  * class K  
    * Cooking oil.
  
* Two types of sprinklers  
  * Wet Pipe Sprinkler System  
    * Pipes are filled with water all the way to the sprinkler head and are just waiting for the bulb to be melted or broken.

   * Dry Pipe Sprinkler System  
     * Pipes are filled with pressurized air and only push water into the pipes when needed to combat the fire.  

   * We also have the pre-action sprinkler system that will activate if there was smoke in the room and not wait for a bulb to melt.  

* In server rooms we use "Clean Agent System"  
  * Fire suppression system that relies upon gas (HALON, FM-200, or CO2) instead of water to extinguish fire.


## 155. HVAC  

* Heating, Ventilation and Air Conditioning system which has to be in server rooms. 
* Because servers can produce too much heat and if it's not dealt with it will give us results we don't wish for.  
* Also, HVAC systems controls the humidity in the room.
* Humidity should be kept at 40% ( not too high nor too low).  


## 156. Sheilding  

* Use STP instead of UTP which adds a layer of shielding inside the cable.  
* We should shield our HVAC systems to prevent it from interfering with our network, because anything with a generator can cause interference.  

* Faraday Cage  
  * Is a shielding installed around an entire room that prevents electromagnetic energy and radio frequencies from entering or leaving the room.   

* TEMPEST  
  * U.S. Government standards for the level of shielding required in a building to ensure emissions and interference cannot enter or exit the facility.
  * TEMPEST certified buildings are used to store goverment secret data. That's why they don't want anything leaking in or out.  
  * TEMPEST facilities are also resistant to EMPs (electromagnetic pulses).  

## 157. Vehicular Vulnerabilities  

* According to Google *Vehicular* means *"involving or by means of a vehicle or vehicles"*.  
* Anything like cars, or any vehicle that might have software which means that they definitly might have vulnerablities.  

* Vehicles connect numerous subsystems over a *controller area network (CAN)* which is a *digital serial dta communications network used within vehicles*.  

* To reach to this network that could be inside cars we use an *OBD-II* which is teh primary external interface and it stands for *Onboard Diagnostics module*. Which is put in all cars.  

* CANs are built very similarly like ethernet (They're built around the fact that everyone on the network is trusted just like ethernet)  
* IF the CAN is isolated it could be pretty secure. But now adays some cars have other networks built into them like wifi...etc.
* No concept of source addressing or message authentication in a CAN bus which means any message that goes on the can bus is considered safe.  

* CHECK THE VIDEO "Hackers Remotely Kill a Jeep on the Highway--With Me in It"  

* So how can a hacker get into a vehicle?  
  * They have to get into the CAN bus. How?  
    * Attach an exploit locally to the OBD-II (It's underneath the dashboard).  
    * Exploit over onboard cellular.
      * Cars have two seperate systems between entertainment networks and the CAN network so that this exploit can't happen.
      * So you have to make sure that your manufacturer separates those two networks.  
    * Exploit over onboard Wi-Fi.  
      * If we can get a link between CAN and wifi I can send malicious stuff.

## 158. IoT Vulnerabilities  

* Anything that can connect to the internet is a part of the IoT.  
* Internet of Things is a group of objects (electronic or not) that are connected to the wider internet by using embedded electronic components.  
* Most smart devices use an embedded version of Linux or Adnroid as their OS and that's why they're vulnerable for attacks.  
* Devices must be secured and updated when new vulnerabilities are found.
* IoT and security don't go two well together.  
* Segment devices on their own network and that they should not be able to communicate with corporate network.  

## 160. Embedded System Vulnerabilities  

* What is an embedded system?  
  * It's a computer system that is designed to performa a specific, dedicated function.  
* Some embedded systems are considered static environments where frequent changes are not made or allowed. Because these systems are designed for one purpose only.

* System-On-Chip (SoC)  ---A type of embedded system.
  * A processor that integrates the platform functionality of multiple logical ocntrollers onto a single chip.
  * Power efficient.
* Real-Time Operating System (RTOS)  
  * A type of OS that prioritizes deterministic execution of operations to ensure consistent response for time-critical tasks.

* Embedded systems typically cannot tolerate reboots or crashes and must have response times that are predictable to within microsecond tolerances.  

* Field Programmable Gate Array (FPGA)  
  * A processor that can be programmed to perform a specific function by a customer rather than at the time of manufacture.  

## 161. ICS and SCADA Vulnerabilities  

* When we're talking about ICS and SCADA we're talking about OT (Operational Technology). What is this?  
  * A communications network designed to implement an industrial control system rather than data networking.