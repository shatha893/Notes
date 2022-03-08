	* How to use rsa id to ssh  
	
	```
	ssh -i id_rsa daniel@10.129.140.196
	```

	* how to create a key  
  ssh-keygen -t ed25519

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