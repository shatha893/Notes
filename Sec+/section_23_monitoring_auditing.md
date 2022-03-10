# Section 23: Monitoring and Auditing  

## 

* Automated Monitoring Methods  
  * Signature-based: (Least false positives) Network traffic is analyzed for predetermined attack patterns.
  * Anomaly-based: (average false positives ) A baseline is established and any network traffic that is outside of the baseline is evaluated
  * Behaviour-based: (Most false positives ) Activity is evaluated based on the previous behaviour of applications, executables, and the operating system in comparison to the current activity of the system.  

* In some IDS/IPS systems methods maybe combined into a hybrid approach.  

## 197. Performance Baselining  

* Baselining is the process of measuring changes, in networking, hardware, software, and applications.
* Baseline Reporting is documenting and reporting on the changes in a baseline.
* Security Posture is risk level to which a system or other technology element is exposed.  

## 198. Protocol Analyzers  

* It's used to capture and analyze network traffic.
* E.g. Wireshark.
* They could be connected to the network either in *Promiscuous mode* or *Non-promiscuous mode*.
  * *Promiscuous mode* is when the network adapter is able to capture all of the packets on the nework regrdless of the destination MAC address of the frames carrying them (We use this mode to captur ethe most information).
  * *Non-promiscuous mode* is when the network adapter only captures the packets addressed to itself directly.
* To configure port analyzers we do what we call *Port Mirroring* which is when one or more switch ports are configured to forward all of their packets to another port on the switch. This port is called *SPAN port*.
* When you can't configure a SPAN port you can use a network tap instead.  
* Sometimes the logical operations that are required in a SPAN port could put additional processing on the switch's CPU.
* *Network tap* is a physical device that allows you to intercept the traffic between two points on the network.  

## 199. SNMP  

* Def. (Simple Network Management Protocol) A TCP/IP protocol that aids in monitoring network-attached devices and computers.
* This protocol is incorporated into a network management and monitoring system.
* It consists of 3 components  
    1. Managed Devices
        * Computers and other network-attached devices monitored through thte use of agents by a network management system.
    2. Agents
       * Software that is loaded on a managed device to redirect information to the network management system. 
    3. Network Mangement Systems (NMS)
       * Software run on one or more servers to control the monitoring of network-attached devices and computers.
* SNMP is the glue to all these components.   
* Three versions of SNMP v1, v2 and v3.
* v1 and v2 are insecure due to the use of community strings to access a device.
* That's why we should be using SNMP v3 which is a version that provides integrity, authentication, and encryption of the messages being sent over the network.
* v3 uses DES to provide privacy and confidentiality.
* We can send SNMP data with two ways  
  * Either *In-band* which means we send it over the same network that's carrying your corporate information and normal data ( Cheaper, easier and less secure).
  * Or *Out-of-band* network which is a secondary network where all the management occurs ( More secure ).  

## 200. Auditing  
* Def A technical assessment conducted on applications, systems or networks ( A detective control ).  
* Auditing can be conducted 
  * Manually with  
    * Security logs.
    * ACLs
    * User rights/permissions.
    * Group policies (GPOs).
    * Vulnerability scans.
    * Written organizational policies.
    * Interviewing personnel.
  * Using Software Tools  
* Usually auditing is a combination of both.
* Logs are a big part of auditing.

## 203. Logging  

* Def Data files that contain the accounting and audit trail for actions performed by a user on the computer or network.  
* On a linux system logs are stored in `/var/log`.  
* On a Windows system we have Security, system and application logs that should be audited.  
* *Security logs* are the events such as successful and unsuccessful logons on the system.
* *System logs* are logs that events such as a system shutdown and driver failures.
* *Application logs* are logs that events for the operating system and third-party applications.
* On a server there are also other types of logs *Distributed File System Replication Services*, *DNS Server*, *DHCP servers* *Directory service logs* and many others. 
* The previous ones can be accessed from the *Event Viewer* but it's not the most effecient way to view them we can use the *SYSLOG server* instead. It's easier to correlate logs when using a SYSLOG server.
* *SYSLOG* is a standardized format used for computer message logging that allows for the separation of the software that generates messages, the system that stores them, and the software that reports and analyzes them.  
* All the servers send their logs to a centralized SYSLOG server. So this server saves all the log files into a centralized repository.  
* SYSLOC sends all the data on port 514 over UDP.  

## 204. Log Files  

* Log files are important to your ability to reconstruct an event after it occurs.  
* We perform *log file maintainance* which is actions taken to ensure the proper creation and storage of a log file, such as the proper configuration, saving, backing up, securing, and encrypting of the log files.  
* Log files should be saved to a different partition or an external server.  
* *Overwrite events* when a maximum log size is reached, the system can begin overwriting the oldest events in the log files to make room.  
* Write Once Read Many (WORM) Technology like  DVD-R that allows data to be written only once but read unlimited times. This insures integrity of the logs.
* Logs should be encrypted to protect them from prying eyes.  

## 205. SIEM  

* Def (Security Information and Mangement Systems) A solution that provides real-time or near-real-time analysis of security alert generated by network hardware and applications.
* Log review is a critical part of security assurance.  
* SIEM sollutions can be implemented as software, hardware appliances, or outsourced manged services.
* To effectively deploy SIEM  
  * Log all relevant events and filter out any irrelevant events.
  * Establish and document scope of events.
  * Develop use cases to define a threat.
  * Plan incident response for an event.
  * Establish a ticketing process to track events.
  * Schedule regular threat hunting.
  * Provide auditors and analysts an exidence trail.
* There are alot of SIEM solutions available
  * Splunk: A market-leading big data information gathering and analysis tool that can import machine-generated data via a connector or visibility add-on (Can be installed locally or cloud-based).
  * ELK/Elastic Stack: Collection of free and open-source SIEM tools that provides storage, search, and analysis functions. It's made up of 4 components 1. Elasticsearch, 2. Logstash, 3. Kibana, 4. Beats
  * ArcSight: A SIEM log management and analytics software tha tcan be used for compliance reporting for legislation and regulations like HIPPA, SOX, and PCI DSS.
  * QRadar: A SIEM log management, analytics, and compliance reporting platform created by IBM.
  * Alien Vault and OSSIM (Open Source Security Information Management): A SIEM solution originally developed by Alien Vault, now owned by AT&T and rebranded as AT&T Cybersecurity. OSSIM can integrate other open-source tools, such as the Snort IDS and OpenVAS vulnerability scanner, and provide an integrated web administrative tool to manage the whole security environment.
  * Graylog: An open-source SIEM with an enterprise version focused on compliance and supporting IT operations and DevOps  

## 206. Syslog  

* Def A protocol enabling different appliances and software applications to transmit logs or event records toa central server.
* Syslog follows a client-server model and is the de facto standard for logging of events from distributed systems.
* Syslog runs on most operating system network equipment using port 514 UDP over TCP/IP.  
* A syslog message contains a PRI code, a header and a message portion.
  * PRI code is calculated from the facility and severity level of the data.
  * A header contains the timestamp of the event and the hostname.
  * The message portion contains the source process of the event and related content.
* Drawback in the original syslog is that it relied on UDP which can result in delivery issues within congested networks.
* Newer implementations have more perks  
  1. Can use port 1468 (TCP) for consistent delivery .
  2. Can use TLS to encrypt messages sent to servers.
  3. Use MD5 or SHA1 for authentication and integrity (prevents man-in-the-middle attack).
  4. Some newer implementations can use message filtering, automated log analysis, event response scripting, and alternate message formats.
  * The first three are the most important.  

* When saying syslog it can refer to one of three things  
  1. Syslog protocol.
  2. Syslog server.
  3. Syslog data. 

## 207. SOAR  

* Def (Security Orchestration, Automation, and Response) A class of security tools that facilitates incident response, threat hunting, and security configuration by orchestrating automated runbooks and delivering data enrichment.  
* SOAR is primarly used for incident response because it can automate so many of your actions.
* Next-gen SIEM (SIEM 2.0) A security information and event monitoring system with an integrated SOAR.  
* It gives us the ability to 
  * Scan security/threat data
  * Analyze it with ML
  * Automate data enrichment
  * Provision new resources.  
* Playbook: A checklist of actions to perform to detect and respond to a specific type of incident.
* Runbook: An automated version of a playbook that leaves clearly defined interaction points for human analysis.