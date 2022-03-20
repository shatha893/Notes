# Section 26: Public Key Infrastructure  

## Public Key Infrastructure  

* We use PKI to create a secure SSL/TLS tunnel. How?  
  * When visting an `https` website our web browser would go to a trusted third part called "certificate authority" and it's going to ask them for a copy of my web server's public key.
  * Then the web browser will pick a random long number to use a shared secret key for use with the symmetric algorithm (sth like AES) but we have to get this key securely to the web server that's why we use public key encryption.
* PKI is not the same as Public Key Encryption. PKI is the system that creates the asymmetrical key pairs that consist of those public and private keys that are used in the encryption and decryption process and manages those key pairs to make sure they're valid and can be trusted.  

* When talking about Public Key Cryptography on the other hand we're talking about the encryption and decryption process only.  

* For all this to occur successfully we need to have a trusted third party known as *Certificate Authority* which will issue digital certificates and will keep the level of trust between all of the certificate authorities around the world.  

## Digital Certificates  

* Definition. It's a digitally-signed electronic document that binds a public key with a user's identity.  

### X.509  
* Is the standard used in PKI for digital certificates and contains the owner/users information and the certificate authority's information.  
* To get a digital certificate you have to purchase it from a certificate authority.  

### Wildcard Certificates  
* Allow all of the subdomains to use the same public key certificate and have it displayed as valid.  
* Negativity of using If the certificate is compromised it will affect all of the subdomains.  

### Subject Alternative Name (SAN)  

* Allows a certificate owner to specify additional domains and IP addresses to be supported.  

### Single-sided certs and Dual-sided certs  

* Single-sided certificates only required the server to be validated.  
* Dual-sided certificates require both the server and teh user to be validated.  

### Chain of Trust  

* Digital certificates are validated using this concept *Chain of Trust*.  

### Digital Certificates have to be Encoded  
* Encoding methods for digital certificates are classified under the *X.690* standard. They're known as BER, CER, and DER.  

### BER (Basic Encoding Rules)  
* It's the original ruleset governing the encoding of data structures for certificates where several different encoding types can be utilized.  
* BER has the ability to have multiple encoding types.  

### CER (Canonical Encoding Rules)  
* A restricted version of the BER that only allows the use of one encoding type.   

### DER (Distinguished Encoding Rules)  
* Restricted version of the BER which allows one encoding type and has more restrictive rules for length, character strings, and how elements of a digital certificate are stored in X.509.  

### File types relating to Digital Certificates  

* PEM, CER, CRT, KEY 
  * Privacy-Enhanced Electronic Mail.  
  * .pem and sometimes it also stores itself as .cer, .crt or .key  
  * Uses DER encoding method
 
* P12  
  * Public Key Cryptographic System #12 (PKCS#12) 
  * It's used to store a server certificate, an intermediate certificate and a private key in one encrypted file.
  * It's the binary format of the Public Key Cryptographic System #12 (PKCS#12).
* PFX  
  * Personal Information Exchange.
  * Used by Microsoft for release signing.
  * It will contain both public and private keys.
* P7B  
  * It's the basis for S/MIME the secure email protocol.
  * It's called that way because it's based on the PKCS#7   

## Certificate Authorities  

### RA (Registration Authority)  
* Used to verify information about a user prior to requesting that a certificate authority issue the certificate.  

### CA (Certificate Authority)  
* It's the entity that issues certificates to a user.  
* Examples on Root CAs Verisign, Digisign and many others.  

### Certificate Revocation List (CRL)  
* An online list of digital certificates that the certificate authority has revoked.

### OCSP (Online Certificate Status Protocol)  
* A protocol that allows you to determine the revocation status of a digital certificate using its serial number.  


### OCSP Stapling  
* Allows the certificate holder to get the OCSP record from the server at regular intervals and include it as part of the SSL or TLS handshake.
* Alternative to OCSP.  

### Public Key Pinning  
* Allows an HTTPS website to resist impersonation attacks by presenting a set of trusted public keys to the user's web browser as part of the HTTP header.  

### Key Escrow and Key Recovery Agent  

* *Key Escrow* occurs when a secure copy of a user's private key is held in case the user accidently loses their key.  
* *Key Recovery Agent* is a specialized type of software that allows the restoration of a lost or corrupted key to be performed.  

* All of a CA's certificates must be revoked if it's compromised.  

### Web of Trust  
* A decentralized trust model that addresses issues associated with the public authentication of public keys within a CA-based PKI system.
* Peer-to-peer model is used here where I trust you and you trust me and because of that we can give that trust to other people.
* Certificates are created as *self-signed*. When having a self-signed certificate the website will give you an error and according to that error you'll either choose to trust the website or not. 
* It's not advised to use a self-signed certificate.  
* PGP (Pretty Goood Privacy) uses web of trust