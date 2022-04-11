# <span style="color:#009688">Tools --*Bloodhound*--</span> 

## <span style="color:#009688"> Some Notes on the Matter  
* It's an application used to virtualize active directory environments.

  <blockquote>
  Active Directory (AD) is a vital part of many IT environments out there. It allows IT departments to deploy, manage and remove their workstations, servers, users, user groups etc. in a structured way. But ‘structured’ does not always mean ‘clear’. Privilege creep, whereby a user collects more and more user rights throughout time (or as they change positions in an organization), is a dangerous issue. The wide range of AD configurations also allow IT administrators to configure a number of unsafe options, potentially opening the door for attackers to sneak through.

  For Red Teamers having obtained a foothold into a customer’s network, AD can be a real treasure trove. You may find paths to Domain Administrator, gain access and control over crucial resources, and discern paths for lateral movement towards parts of the environment that are less heavily monitored than the workstation that served as the likely initial access point. A pentester discovering a Windows Domain during post-exploitation, which will be the case in many Red Team exercises, will need to assess the AD environment for any weaknesses.

  For Engineers, auditing AD environments is vital to make sure attackers will not find paths to higher privileges or lateral movement inside the AD configuration.

  That’s where BloodHound comes in, as a tool allowing for the analysis of AD rights and relations, focusing on the ones that an attacker may abuse. After collecting AD data using one of the available ingestors, BloodHound will map out AD objects (users, groups, computers, …) and accesses and query these relationships in order to discern those that may lead to privilege escalation, lateral movement, etc.
  </blockquote>
