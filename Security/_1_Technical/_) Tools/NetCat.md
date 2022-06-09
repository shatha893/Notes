# <span style="color:#009688">Tools --*Netcat*--</span> 

## <span style="color:#009688"> Brief Description  

* Netcat is used to connect devices using TCP or UDP. We can read from and write to devices.

<br/><br/>

## <span style="color:#009688">Special Usage  

* Transferring files through nc  

  * On the recieving end  
    ```console
    nc -l -p 4445 > source.zip
    ```  

  * On the sending end  
    ```console
    nc -w 3 10.10.14.9 4445 < source.zip
    ```  


  * It can be used to scan for open ports `nc -z -v 1 10.10.11.164 20-80`.   

<br/><br/>

## <span style="color:#009688">Normal Usage  

* Connect to a device  
  ```cmd
  nc [IP ADDRESS] [PORT]
  ```

* Listen to connections  

  ```cmd
  nc -lnvp [PORT]
  ```


<br/><br/>

## <span style="color:#009688">`-h` Output  
  ```
  connect to somewhere:   nc [-options] hostname port[s] [ports] ... 
  listen for inbound:     nc -l -p port [-options] [hostname] [port]
  options:
          -c shell commands       as `-e'; use /bin/sh to exec [dangerous!!]
          -e filename             program to exec after connect [dangerous!!]
          -b                      allow broadcasts
          -g gateway              source-routing hop point[s], up to 8
          -G num                  source-routing pointer: 4, 8, 12, ...
          -h                      this cruft
          -i secs                 delay interval for lines sent, ports scanned
          -k                      set keepalive option on socket
          -l                      listen mode, for inbound connects
          -n                      numeric-only IP addresses, no DNS
          -o file                 hex dump of traffic
          -p port                 local port number
          -r                      randomize local and remote ports
          -q secs                 quit after EOF on stdin and delay of secs
          -s addr                 local source address
          -T tos                  set Type Of Service
          -t                      answer TELNET negotiation
          -u                      UDP mode
          -v                      verbose [use twice to be more verbose]
          -w secs                 timeout for connects and final net reads
          -C                      Send CRLF as line-ending
          -z                      zero-I/O mode [used for scanning]
  port numbers can be individual or ranges: lo-hi [inclusive];
  hyphens in port names must be backslash escaped (e.g. 'ftp\-data').
  ```

<br/><br/>

## <span style="color:#009688">Options/Flags/Switches  

<br/><br/>



    