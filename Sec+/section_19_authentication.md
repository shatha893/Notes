# Section 19: Authentication  

## 163. Authentication  

* Multi-factor Authentication: the use of two or more authentication factors to prove a user's identity.
* Multi-factor Authentication when implemented makes the system exponentially more secure.  


* There are 5 basic factors of authentication that can be used to determine that someone is who they say they are:  
  1. Knowledge.
  2. Ownership (Token Devices ).
  3. Characteristic (Finger Print Scanner, Iris scanner, vocal pattern recognition and other stuff).
  4. Location.
  5. Action ( The way you sign your name or the way you draw a picture).  

* When using one of these you're only using "single-factor" authentication.  
* To increase security we have to use two factor authentication which means to use 2 of the five we mentioned above.
* The most security is when we use one-time passwords which are implemented either  
  * Time-based One Time Password (TOTP): A password is computed from a shared secret and current time.  
  * HMAC-based One Time Password (HOTP): A password is computed from a shared secret and is synchronized between the client and the server.  

## 164. Authentication Models  

* In addition to standard authentication and multi factor authentication we have other models of authentication which include  

  * Context-aware Authentication  
    * The process to check the user's or system's attributes or characteristics prior to allowing it to connect.
    * Can be used to restrict authentication based on the time of day or location.
    * Limit the geographic location the user can login from.  

  * Single Sign-On (SSO) Authentication
    * A default user profile for each user is created and linked with all of the resources needed.  
    * Compromised SSO credentials cause a big breach in security.

  * Federated identity management (FIdM) Authentication  
    * A single identity is created for a user and shared with all of the organizations in a federation.  
    * Cross-Certification: Utilizes a web of trust between organizations where each one certifies otehrs in the federation ( works well if small number inside federation ).  
    * Trusted Third party: Organizations are able to place their trust in a single third-part ( also called the bridge model ).
      * This model is  efficient even if the number of organizations in the federation is high.  

    * SMAL (Security Assertion Markup Language)  
      * Attestation model built upon XML used to share federated identity management information between systems.  
      * It's a standardrization of the single sign on process and it's used across the web and in a large number of organizations.  
    * OpenID: is an open standard and decentralized protocol that is used to authenticate users in a federated identity management system.
      * In OpenID user logs into an Identity Provider (IP) and uses their account at Relying Parties (RP).
      * Google is an openID provider.  
    * OpenID is easier to implement than SAML but SAML perform these functions more efficiently than OpenID.  

## 165. 802.1x  

* What is 802.1x?  
It's a standardized framework used for port-based authentication on wired and wireless networks.  

* RADIUS or TACACS+  they both can be used to implement authentication through 802.1x.
* We have a "supplicant", an "Authenticator", and an "Authentication Server". 
* This can prevent rogue devices from access network devices.  
* Extensible Authentication Protocol (EAP): A framework of protocols that allows for numerous methods of authentication including passwords, digital certificates, and public key infrastructure.  
* Types of EAP:  
  1. EAP-MD5 is a variation of EAP which uses simple passwords for its challenge-authentication.
  * It's a one way authentication process.  

  2. EAP-TLS uses public key authentication (digital certificates) for mutual authentication. 

  3. EAP-TTLS uses a server-side digital certificate and a client-side password for mutual authentication.
  * This variation is much more secure than the MD5 one.

  4. EAP-FAST provides flexible authentication via secure tunneling secure tunneling (FAST) by using  a protected access credential instead of a cerfiticate for mutual authentication.  


  5. Protected EAP (PEAP) which supports mutual authentication by using server certificates and Microsoft's Active Directory to authenticate a client's password. 

  6. LEAP which is a proprietary to Cisco-based networks.  

## 166. LDAP and Kerberos  

* What is LDAP?  
  * Stands for *Lightweight Directory Access Protocol*.
  * Definition *A database used to centralize information about clients and objects on the network*.  
  * LDAP communicates through port 389 when it's unencrypted.
  * But if you decide to encrypt its communication it will use port 636.  
  * Microsoft's AD (Active Directory) is microsoft's version of LDAP.
  * AD is used to manage everything on the network including clients, servers, devices, users and groups.  
  * AD can also be used as part of your security policies or access control .
* Kerberos is focused on authentication and authorization.
  * What is it?  
    * It's an authentication protocol used by Windows to provide for 2-way (mutual) authentication using a system of tickets.  
    * Anytime a user needs to access a resource the server, then, would provide them with either a ticket or a session key which ever one's appropriate.
    * Kerberos let's port 88 be open so that the requests for resources from the user can be accepted there.  
    * Kerberos relies on a domain controller to service that key destribution centre. This makes it a single point of failure for Kerberos. To prevent this we can have a primary and active domain controllers ( this form of redundancy ensures that kerberos is up and LDAP is working just fine).