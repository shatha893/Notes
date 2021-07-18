<link href="../styles.module.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Encode+Sans+SC&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">


## <span class="copyright">Personal Security Notes <span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">Nmap  

<span class="date">Wednesday, 14/7/2021</span>
<br/><br/>

### <span class="linuxBasicsSubs subtitle">Nmap Different Options
<a href="https://stationx-public-download.s3.us-west-2.amazonaws.com/nmap_cheet_sheet_v7.pdf">A cheat sheet on the `nmap` command</a>.

 
<br/><br/>
### <span class="linuxBasicsSubs subtitle"> Banner Grabbing  
I can accomplish banner grabbing using the tool `nmap` which shows me the versions of the service as follows:  

```console
┌──(kali㉿kali)-[~]
└─$ nmap -sV 192.168.1.1 
Starting Nmap 7.91 ( https://nmap.org ) at 2021-07-15 08:34 EDT
Nmap scan report for fiberbox.home (192.168.1.1)
Host is up (0.017s latency).
Not shown: 985 filtered ports
PORT    STATE SERVICE     VERSION
25/tcp  open  smtp?
53/tcp  open  domain      dnsmasq 2.78
80/tcp  open  http
110/tcp open  pop3?
119/tcp open  nntp?
139/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
143/tcp open  imap?
443/tcp open  ssl/https
445/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
465/tcp open  smtps?
563/tcp open  snews?
587/tcp open  submission?
631/tcp open  ipp         CUPS 1.3
993/tcp open  imaps?
995/tcp open  pop3s?
2 services unrecognized despite returning data. If you know the service/version, please submit the following fingerprints at https://nmap.org/cgi-bin/submit.cgi?new-service :
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port80-TCP:V=7.91%I=7%D=7/15%Time=60F02B65%P=x86_64-pc-linux-gnu%r(GetR
SF:equest,155,"HTTP/1\.0\x20307\x20Temporary\x20Redirect\r\nTE:\x20chunked
SF:\r\nTransfer-Encoding:\x20chunked\r\nContent-Type:\x20text/html\r\nLoca
SF:tion:\x20/myNetwork\.html\r\nCache-Control:\x20no-cache\r\n\r\nB1\r\n<h
SF:tml><head><title>Temporary\x20Redirect</title></head><body><h1>307\x20-
SF:\x20Temporary\x20Redirect</h1><p>This\x20page\x20has\x20moved\x20to\x20
SF:<a\x20href=\"/myNetwork\.html\">/myNetwork\.html</a></body></html>\n\r\
SF:n0\r\n\r\n")%r(HTTPOptions,155,"HTTP/1\.0\x20307\x20Temporary\x20Redire
SF:ct\r\nTE:\x20chunked\r\nTransfer-Encoding:\x20chunked\r\nContent-Type:\
SF:x20text/html\r\nLocation:\x20/myNetwork\.html\r\nCache-Control:\x20no-c
SF:ache\r\n\r\nB1\r\n<html><head><title>Temporary\x20Redirect</title></hea
SF:d><body><h1>307\x20-\x20Temporary\x20Redirect</h1><p>This\x20page\x20ha
SF:s\x20moved\x20to\x20<a\x20href=\"/myNetwork\.html\">/myNetwork\.html</a
SF:></body></html>\n\r\n0\r\n\r\n")%r(RTSPRequest,155,"HTTP/1\.0\x20307\x2
SF:0Temporary\x20Redirect\r\nTE:\x20chunked\r\nTransfer-Encoding:\x20chunk
SF:ed\r\nContent-Type:\x20text/html\r\nLocation:\x20/myNetwork\.html\r\nCa
SF:che-Control:\x20no-cache\r\n\r\nB1\r\n<html><head><title>Temporary\x20R
SF:edirect</title></head><body><h1>307\x20-\x20Temporary\x20Redirect</h1><
SF:p>This\x20page\x20has\x20moved\x20to\x20<a\x20href=\"/myNetwork\.html\"
SF:>/myNetwork\.html</a></body></html>\n\r\n0\r\n\r\n")%r(FourOhFourReques
SF:t,13C,"HTTP/1\.0\x20404\x20Not\x20Found\r\nCache-Control:\x20public,max
SF:-age=31536000\r\nETAG:\x20ad9bbf00\r\nCache-Control:\x20public,max-age=
SF:31536000\r\nX-Frame-Options:\x20SAMEORIGIN\r\nTE:\x20chunked\r\nTransfe
SF:r-Encoding:\x20chunked\r\nContent-Type:\x20text/html\r\n\r\n58\r\n<html
SF:><head><title>Not\x20Found</title></head><body><h1>404\x20-\x20Not\x20F
SF:ound</h1></body></html>\n\r\n0\r\n\r\n");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port443-TCP:V=7.91%T=SSL%I=7%D=7/15%Time=60F02B6C%P=x86_64-pc-linux-gnu
SF:%r(GetRequest,155,"HTTP/1\.0\x20307\x20Temporary\x20Redirect\r\nTE:\x20
SF:chunked\r\nTransfer-Encoding:\x20chunked\r\nContent-Type:\x20text/html\
SF:r\nLocation:\x20/myNetwork\.html\r\nCache-Control:\x20no-cache\r\n\r\nB
SF:1\r\n<html><head><title>Temporary\x20Redirect</title></head><body><h1>3
SF:07\x20-\x20Temporary\x20Redirect</h1><p>This\x20page\x20has\x20moved\x2
SF:0to\x20<a\x20href=\"/myNetwork\.html\">/myNetwork\.html</a></body></htm
SF:l>\n\r\n0\r\n\r\n")%r(HTTPOptions,155,"HTTP/1\.0\x20307\x20Temporary\x2
SF:0Redirect\r\nTE:\x20chunked\r\nTransfer-Encoding:\x20chunked\r\nContent
SF:-Type:\x20text/html\r\nLocation:\x20/myNetwork\.html\r\nCache-Control:\
SF:x20no-cache\r\n\r\nB1\r\n<html><head><title>Temporary\x20Redirect</titl
SF:e></head><body><h1>307\x20-\x20Temporary\x20Redirect</h1><p>This\x20pag
SF:e\x20has\x20moved\x20to\x20<a\x20href=\"/myNetwork\.html\">/myNetwork\.
SF:html</a></body></html>\n\r\n0\r\n\r\n")%r(FourOhFourRequest,13C,"HTTP/1
SF:\.0\x20404\x20Not\x20Found\r\nCache-Control:\x20public,max-age=31536000
SF:\r\nETAG:\x20ad9bbf00\r\nCache-Control:\x20public,max-age=31536000\r\nX
SF:-Frame-Options:\x20SAMEORIGIN\r\nTE:\x20chunked\r\nTransfer-Encoding:\x
SF:20chunked\r\nContent-Type:\x20text/html\r\n\r\n58\r\n<html><head><title
SF:>Not\x20Found</title></head><body><h1>404\x20-\x20Not\x20Found</h1></bo
SF:dy></html>\n\r\n0\r\n\r\n")%r(RTSPRequest,155,"HTTP/1\.0\x20307\x20Temp
SF:orary\x20Redirect\r\nTE:\x20chunked\r\nTransfer-Encoding:\x20chunked\r\
SF:nContent-Type:\x20text/html\r\nLocation:\x20/myNetwork\.html\r\nCache-C
SF:ontrol:\x20no-cache\r\n\r\nB1\r\n<html><head><title>Temporary\x20Redire
SF:ct</title></head><body><h1>307\x20-\x20Temporary\x20Redirect</h1><p>Thi
SF:s\x20page\x20has\x20moved\x20to\x20<a\x20href=\"/myNetwork\.html\">/myN
SF:etwork\.html</a></body></html>\n\r\n0\r\n\r\n");

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 174.95 seconds
                                                            
```

This is the output I got after I tried to nmap the fiber wifi router I have at home.  

<br/><br/>

### <span class="linuxBasicsSubs subtitle">Best Practices  
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
