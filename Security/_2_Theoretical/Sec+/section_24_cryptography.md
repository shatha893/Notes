# Section 24: Cryptography  

## Cryptography  
* The practice and study of writing and solving codes in order to hide the true meaning of information.  
* Encryption is the process of converting ordinary information (plaintext) into an unintelligible form (ciphertext).  
* Encryption protects data at rest, data in transit, or data in use.
* Data at Rest: Inactive data that is archived, such as data resident on a hard disk drive.
* Data in Use: Data that is undergoing constant change.  
* Cipher is an algorithm which performs the encryption or decryption.
* Symmetric encryption can assure confidentiality but it cannot ensure nonrepudiation.  

## 209. Symmetric vs Asymmetric  
* Hybird Implementation: Utilizes asymmetric encryption to securely transfer a private key that can then be used with symmetric encryption.
* Encryption algorithms can also be classified into either stream ciphers or block ciphers.
  * Stream ciphers perform their computations and encryption a single byte at a time ( They are well suited for securing real-time communication data streams like streaming audio or video). Stream Ciphers are symmetric algorithms.
  * Block ciphers break input into fixed length blocks of data before performing the encryption and then each block is processed by the cipher. Block ciphers have several advantages over a stream cipher such as easier implementation and that it's less susceptible to security problems.
  * Block ciphers are easily implemented through software solutions whereas stream cipher tend to be used in hardware solutions.