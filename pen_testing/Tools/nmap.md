# <span style="color:#009688">Tools --*Nmap*--</span> 

## <span style="color:#009688">Special Usage  

* To perform a udp scan ( It takes forever to finish )  
  ```console
  sudo nmap -Pn -sV -sU 10.129.126.250 
  ```  
* It has to be done with elevated privileges.

* Why does UDP nmap take forever?  
  <blockquote>
  UDP scanning is likely to be slower than TCP due to the differences in how the protocol works (i.e. with TCP it's easier to establish that a port is open due to the three-way handshake).
  </blockquote>

* It's best if we use the `-A` or `-sV` on the victim with each port on its own so that we be more stealthy.

<br/><br/>

## <span style="color:#009688">Normal Usage  
 
* It would be something like this  
  ```console
  nmap -Pn [IP ADDRESS]

  # or this for the full scan  

  nmap -Pn -p- [IP ADDRESS]  

  # or this for a scan on a specific port  

  nmap -Pn -p[PORT] [IP ADDRESS]
  ```

<br/><br/>

## <span style="color:#009688">Options/Flags/Switches  

### `-v` option  
* Can be used to see the progress of nmap while it's scanning.  

### `-sC` option  
* Quoted from "nmap.org" 

### `-o` option  
* To save output in a file.  

### `-sV` option  
* To enumerate versions.
* It's the flag that we use to grab banners which I think is equavelant to "enumerating versions".  
<blockquote>

Performs a script scan using the default set of scripts. It is equivalent to --script=default. **Some of the scripts in this default category are considered intrusive and should not be run against a target network without permission**.
</blockquote>  

### `-oA` option  
* We can use the option `-oA [FILE NAME]` to save the nmap output in a file in the working directory.
  ```console
  nmap -p- --open -oA nibbles_full_tcp_scan 10.129.42.190
  ``` 

<br/><br/>