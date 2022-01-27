# LAN Security Concepts  

* Attacks
  * DDOS  
    * A coordinated attack from multiple devices called zombies to degrade or halt public access to an organization's website or resources.  

  * Data Breach  
    * An organization's hosts or servers are compromised to steal confidential information.

  * Malware  
    * It's when an organization's hosts are infected with a malicious software that could cause several problems. 
    * E.g. The ransomware wannaCry.

* Protection (Network Security Devices)
  * Virtual Private Network (VPN)  
    * Provides secure connection to remote users from public network to the enterprise's network  

  * Next Generation Firewall (NGFW)  
    * Provides the following:
      1. Stateful packet instpection.
      2. Application visibility and control.
      3. A next generation intrusion prevention system.
      4. Advanced malware protection.
      5. URL filtering.

  * Network Access Control (NAC) Devices.
    * ISE
    * A NAC device includes AAA (Authentication, Authorization & Accounting)  

* Usually end points are connected to either switches or access points.
* Things to do to protect end point devices
  * Antivirus.
  * Host based Firewall.
  * Host based Intrusion Prevention System (HIPS).
  * NGFW will provide me with 
    * NGIPS.
    * AMP.
    * URL Filtering.  

<br/>

* ESA (Email Security Appliance)  
  *  Cisco’s Talos Intelligence Group.
  *  **Phishing** attacks entices the user to click on a link or open an attachment.
  *  **Spear Phishing** targets high-profile employees or executives that may have elevated login credentials.
  *  Cisco's ESA is designed to monitor SMTP (Simple Mail Transfer Protocol).
  *  The Cisco ESA is constantly updated by the Cisco Talos (The threat intellegence is pulled by the Cisco ESA every five to three minutes).
  *  Functions of Cisco's ESA
     * Block known threats.
     * Remediate against stealth malware that evaded initial detection.
     * Discard emails with bad links.
     * Block access to newly infected sites.
     * Encrypt content to outgoing email to prevent data loss.

<br/>

* WSA (Web Security Appliance)  
  * Cisco's Web Security Appliance is a mitigation technology for web-based threats.

<br/>

* Access Control  
  * Authentication with a Local Password is the easiest but the most vulnerable.
  ```console
  R1(config)# line vty 0 4
  R1(config-line)# password ci5c0
  R1(config-line)# login
  ```  

  * SSH is a more secure form of remote access. Why?
    * It requires a username and a password both of which are encrypted during transmission.
    * The username and password can be authenticated by the local database method.
    * It provides more accountability because the username is recorded when a user logs in.

    * The code to illustrate remote access via SSH  
    ```console
    R1(config)# ip domain-name example.com
    R1(config)# crypto key generate rsa general-keys modulus 2048
    R1(config)# username Admin secret Str0ng3rPa55w0rd
    R1(config)# ssh version 2
    R1(config)# line vty 0 4
    R1(config-line)# transport input ssh
    R1(config-line)# login local
    ```
