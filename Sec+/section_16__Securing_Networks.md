# Section 16/Securing Networks  

## 146. WPA3  

### Perfect Forward Secrecy or Forward Secrecy  
* A feature of key agreement protocols (like SAE) that provides assurance that session keys will not be compromised even if long-term secrets used in the session key exchange are compromised.  
* Which means that if the long term password gets compromised then the attacker can't authenticate as the owner.  
* Perfect Forward Secrecy or Forward Secrecy goes through a 5 step process:  
  1. The AP and the client use of public key system **to generate a pair of long-term keys**. 
  2. The AP and the client **exchange a one-time use session key using a secure algorithm** like Diffie-Hellman.
  3. The AP sends the client messages and **encrypt them using the session key** created in step 2.  
  4. Client **decrypts the messages** recieved using the same one-time use session key.  
  5. The **process repeats** for every message being sent, starting at step 2 to ensure forward secrecy.  

* As we can see the benefit of WPA3 over its predecessors is that each time we want to send a message we keep using a new "one time session key" which maintains forward secrecy
  

## 147. Other Wireless Technologies  

### Bluetooth  
* Blue-Jacking(Send Information)  
  * Sending of unsolicited messages to Bluetooth-enabled devices such as mobile phones and tablets.  
* Blue-Snarfing(Take Information)  
  * Unauthorized access of information from a wireless device through a Bluetooth connection.

* Always change bluetooth PIN to something other than the default.  


### Radio Frequency Identification (RFID)  

* Devices that use a radio frequency signal to transmit identifying information about the device or token holder.  
* Door access cards or cards for alarm systems.
* Can Operate in large environments and small ones.  
* It's easily intercepted because it can work in large areas. 

### New Field Communication (NFC)  
* Allows two devices to transmit information when they are within close range through automated pairing and transmission.   
* It could also be intercepted.


### Cellular  
* Better than wifi I guess.  
  
### GPS  
* Gets it's data from three satellites orbitting around the earth.   
* Always have redundancy in place when relying on GPS for critical matters in the organization.   

### Satellite Communications  

* Used in areas that, normally, don't have any other way of accessing the internet.   
* It's also subject to interference, jamming and interception.  

