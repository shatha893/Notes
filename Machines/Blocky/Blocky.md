# Machine #9 Jarvis  


## Nmap Results  
  <img src="https://nmap.org/images/nmap-logo-256x256.png">   

* Initial nmap output  

  ```console
  PORT     STATE  SERVICE
  21/tcp   open   ftp
  22/tcp   open   ssh
  80/tcp   open   http
  8192/tcp closed sophos
  ```  

* Full scan output   

```console
PORT      STATE  SERVICE
21/tcp    open   ftp
22/tcp    open   ssh
80/tcp    open   http
8192/tcp  closed sophos
25565/tcp open   minecraft
```

<br/><br/>

## Banner Grabbing of Services  
 
 * The `Minecraft` service   
  ```console
  PORT      STATE SERVICE   VERSION
  25565/tcp open  minecraft Minecraft 1.11.2 (Protocol: 127, Message: A Minecraft Server, Users: 0/20)
  ```

<br/><br/>

## Searchsploiting Results   
  <img src="https://www.offensive-security.com/wp-content/uploads/2020/05/SearchSploit-1.png" width=400 height=200>   



<br/><br/>  

## Gobustering Stuff  
  <img src="https://cdn.akamai.steamstatic.com/steam/apps/1092880/capsule_616x353.jpg?t=1605640630" width=400 height=200>  



<br/><br/>

## Thinking Out Loud   

  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr4hzX6KoRN5PjPJjy8QC43K0T-CoXZHawDIxG4jCa9aMD1K8Vl3vhpG2a2OVbiy-i93c&usqp=CAU" width=200 height=200>  

* Found a login page when pressing "login" on the page.
* The website is using Wordpress which has a lot of security issues if not patched properly. I should look for a version
* Found the WordPress version `<generator>https://wordpress.org/?v=4.8</generator>`.
* 


## How Did I Solve the Machine 

   <img src="https://images.lifesizecustomcutouts.com/image/cache/catalog/febProds21/SP000081-500x500.png" width=200 height=200>   

   
   

## Where I Got Stuck?   
  

## What Did I learn from this Machine?  

















