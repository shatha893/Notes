# <span style="color:#009688">Services --*SSH*--</span> 

## <span style="color:#009688">Special Usage  

* We can login with ssh by using the private key of the user as follows  
  ```
  ssh -i [KEY FILE NAME] [USERNAME]@[HOSTNAME OR IP ADDRESS]
  ```  

* Create ssh keys to be able to login through them as follows  
  ```
  ssh-keygen -t [KEY TYPE]
  ```
* Permissions of a private ssh key has to be `600`.
* Key types can be  
	* rsa
	* dsa
	* ecdsa
	* ed25519

* Three classes of encryptions 
* Understand how asymmetric keys work  
  * So the private key is used to derive the public key. Maybe that's how they check if the private key is valid instead of both sides having the key.
  * Also, the public key can't derive the private key which makes it much more secure than symmetric keys

### Enumerating SSH  
* If we try to ssh to an IP we might get a message saying *"Unable to negotiate ...no matching key exchange method...Their offer..."* we can benefit from what's written after their offer and write the following command:  
```
ssh [IP ADDRESS] -oKexAlgorithms=+[THE OFFER]
```   
* Then it might tell me *"not matching cipher found"* so we add the following to the command  
```
ssh [IP ADDRESS] -oKexAlgorithms=+[THE OFFER] -c [THE OFFERED CIPHER]
```

<br/><br/>

## <span style="color:#009688">Normal Usage  

* Logging in through the `ssh` command as follows  
  ```
  ssh [USERNAME]@[HOSTNAME OR IP ADDRESS]
  ```  

<br/><br/>

## <span style="color:#009688">Options/Flags/Switches  

### The `-i` option  
* To login using ssh key.
<br/><br/>