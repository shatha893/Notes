

### <span class="linuxBasicsSubs subtitle">More & More Directories  

<img src="https://lcom.static.linuxfound.org/sites/lcom/files/standard-unix-filesystem-hierarchy.png">  

<br/><br/>

### <span class="linuxBasicsSubs subtitle">What Is a Virtual Directory?  
???????  

<br/><br/>





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
    
    ```

  * For the change in  the contents of a variable to be for all we have to export it  
    ```console
    export [ENVE VAR]
    ```  


 <br/><br/> 


  


## What does Focal Fossa mean?  
Ubuntu code names contain 2 parts the first is an adjective and the second is an animal name. That being said "Focal" is an adjective that means "Focus" and "Fossa" is an animal name.  


## Linux's Terminal Commands  

### `cd`    

* We can use `cd -` to go back to the previous working directory.  



### `xxd`    

* We can convert Hex to ASCII using this command.  


### `proxychains`   

* We can obscure our traffic by using proxies.
* Specifically, in Kali Linux there's a command for proxying called *proxychains*  
  ```console
  kali> proxychains [THE COMMAND YOU WANT TO PROXY] [ARGUMENTS]
  ``` 
* The configurations of `proxychains` are stored in a config file `/etc/proxychains.conf`. We can edit this file to set a proxy for the `proxychains` command to use.  


### `echo`  

* Can be used to print out an environment variable `echo $[ENV VAR]`.
* Can be used to create a file `echo "content of file" > [FILE NAME]`.    
* Can be used to just echo stuff `echo "stuff"`.  

### `python` or `python3`  

* Used to run python code.  

### `php`  

* Used to run php code.  

### `sed`  

* Is mostly used to replace inner strings with other values. E.g. `$sed 's/unix/linux/' geekfile.txt` this command replaces the word unix with linux.  

### To Color Code when `cat`ing it in terminal
* We can use this command `cat [FILE] | jq` to color json. I'm not sure if it also works on other languages.  


### `rest-server`  

* You can create a restful server with this command `./rest-server --path /tmp/restic --no-auth --debug`. 
* The `--debug` option is to see if the request went in successfully and if not then what's the problem.
