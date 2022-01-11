* Why does UDP nmap take forever?  
  <blockquote>
  UDP scanning is likely to be slower than TCP due to the differences in how the protocol works (i.e. with TCP it's easier to establish that a port is open due to the three-way handshake).
  </blockquote>

* To scan for UDP ports with nmap write the following `sudo nmap -Pn -sV -sU 10.129.126.250 `
* UDP nmap results  

```
PORT   STATE         SERVICE
68/udp open|filtered dhcpc
69/udp open|filtered tftp  
```



* We can use the option `-oA [FILE NAME]` to save the nmap output in a file in the working directory.
  ```console
  nmap -p- --open -oA nibbles_full_tcp_scan 10.129.42.190
  ```   



  * It's best to do *aggressive* scanning on the services seperately e.g. the following command    

  ```
  nmap -Pn -p22 10.10.10.3 -A 
  ```
  The output would look something like this  

  ```
  PORT   STATE SERVICE VERSION
  22/tcp open  ssh     OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)
  | ssh-hostkey: 
  |   1024 60:0f:cf:e1:c0:5f:6a:74:d6:90:24:fa:c4:d5:6c:cd (DSA)
  |_  2048 56:56:24:0f:21:1d:de:a7:2b:ae:61:b1:24:3d:e8:f3 (RSA)
  Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
  ```  
   After I made sure that there is an ssh service on the port 22 with the normal scan I did the aggressive one.
   Even do the banner grabbing `-sV` for each service separately.
