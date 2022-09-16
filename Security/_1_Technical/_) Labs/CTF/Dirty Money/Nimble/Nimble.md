* We only have ssh and http services.
* The pages I found so far on the website  
```
signup.php
login.php
index.php
malwares.php
messages.php
account.php
download.php
```  

* PHPSESSION  
```
t08oom87asd0ig9trc8u1gutok
t0r0dgibdhj2128joc5ma63ad4
7scalesgo3rv0431sphln0ts4c
vkdff5k5q46uadpn0hu5ujciaa
bu7i80eibg8bote5ff379nfskt
ffqfkoek6ctlurqtfn14bkcd75
5sab31r9bmkaqcddhe37qdoco0
fhhbmse51h2f9138i68aijrsv9

seavd6fbkbciq04qk8dtclh5pc
r5qihdmtm7ofe1366r54h6u364
m25tacr5mjb3ei2mhlnrih8s9b
bgt5fgeq0kmotkj7egv297r14u
```
* It uses the phpsessid to identify who's the current user. So maybe if I figure out how it's generated I could get a session of another user and maybe get something from there
* Evidently, the backend seems to be running on php.  


```
Content-Type: application/x-www-form-urlencoded Nimble/1.0
nimble.htb  /add_infected_host.php POST &token=.&username=..&hostname=..
uuid=....Not actually malware
2c352b34c756e52504f0a41

SELECT * FROM Win32_ComputerSystemProduct
```