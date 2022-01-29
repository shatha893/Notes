

### <span class="linuxBasicsSubs subtitle">More & More Directories  

<img src="https://lcom.static.linuxfound.org/sites/lcom/files/standard-unix-filesystem-hierarchy.png">  

<br/><br/>

### <span class="linuxBasicsSubs subtitle">What Is a Virtual Directory?  
???????  

<br/><br/>


----------
* Command in linux   


### <span class="useful_shit subtitle">Web Testing  

* We can use the command `whatweb [IP ADDRESS]` to see info about the web server.

 <br/><br/> 

### <span class="useful_shit subtitle">Changing Process Priority with *nice*   

  ```console
  nice -n [niceness value] [command]
  ```
  * -ve value is most likely to receive priority.
  * +ve value is the least likely to receive priority.

 <br/><br/> 

### <span class="useful_shit subtitle">Environment Variables  

  * To view the contents of an env variable
    ```console
    echo $[ENV VAR]
    ```

  * For the change in  the contents of a variable to be for all we have to export it  
    ```console
    export [ENVE VAR]
    ```  


 <br/><br/> 



### <span class="useful_shit subtitle"> Proxy Servers  

* We can obscure our traffic by using proxies.
* Specifically, in Kali Linux there's a command for proxying called *proxychains*  
  ```console
  kali> proxychains [THE COMMAND YOU WANT TO PROXY] [ARGUMENTS]
  ``` 
* The configurations of `proxychains` are stored in a config file `/etc/proxychains.conf`. We can edit this file to set a proxy for the `proxychains` command to use.


 <br/><br/>   


 
* We can convert Hex to ASCII using the command `xxd`  


<br/> 



## What does Focal Fossa mean?  
Ubuntu code names contain 2 parts the first is an adjective and the second is an animal name. That being said "Focal" is an adjective that means "Focus" and "Fossa" is an animal name.