# <span style="color:#009688">Tools --*Netcat*--</span> 

## <span style="color:#009688">Special Usage  

* Transferring files through nc  

    * On the recieving end  
    ```console
    nc -l -p 1234 > out.file
    ```  

    * On the sending end  
    ```console
    nc -w 3 [destination] 1234 < out.file
    ```  


  * It can be used to scan for open ports `nc -z -v 10.10.8.8 20-80`.   

<br/><br/>

## <span style="color:#009688">Normal Usage  


<br/><br/>

## <span style="color:#009688">Options/Flags/Switches  

<br/><br/>



    