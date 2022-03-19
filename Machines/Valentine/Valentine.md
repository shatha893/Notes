# <span style="color:#FF5050">Machine #20 Valentine</span>  


## <span style="color:#FF5050">Checklist 🤓   

- [x]  ~~Comman Injection~~
- [x]  SSL Certificate  
    * ~~Found a domain but it got me nowhere.~~
    * The Heartbleed vulnerability is because of the OpenSSL
- [ ]  ~~Directory Traversal or LFI~~
- [x]  ~~SQL Injection~~ 
- [ ]  ~~Code Injection~~
- [x]  ~~Stegonography~~
- [x]  Find a passphrase somewhere for the key. Maybe, also, the user's name.
- [x]  ~~Virtual hosts~~
- [x]  ~~The TCN header (Transparent Content Negotiation)~~ 
    * It talks about how one uri can have multiple variants and that I can view these variants and I was able to view them but I didn't get much from it. 
    * I think I will drop it unless I find sth else interesting about it.  
- [x] ~~Investigate the other headers~~ 
  * Seems like there are alot of experimental ones.
  * There's this header that checks if I'm using a mobile or a desktop.
- [x] ~~Exploits of the PHP version that was revealed for us through the `X-Powered-By` header.~~  
  * Found these   
    ```
    PHP < 5.3.12 / < 5.4.2 - CGI Argument Injection                                               | php/remote/18836.py
    PHP < 5.6.2 - 'Shellshock' Safe Mode / disable_functions Bypass / Command Injection           | php/webapps/35146.txt
    ```   
    ```
    Apache + PHP < 5.3.12 / < 5.4.2 - cgi-bin Remote Code Execution                               | php/remote/29290.c
    Apache + PHP < 5.3.12 / < 5.4.2 - Remote Code Execution + Scanner                             | php/remote/29316.py
    ```  
  * The previous are the most relevant results.
- [x] The Heartbleed bug (I'm 99% sure it's this)- It is vulnerable.
- [x] ~~The web server is using SOAP APIs.~~  
- [x] The requests I'm sending are being stored on the server's memory.  
- [x] Maybe I can send a reverse shell in a php file somehow in the request and this way it will get saved and I can execute the file.  
  
<br/><br/>


## <span style="color:#FF5050">What Do We Have? 🤔🤔 
1. An image that I'm not sure if it has a meaning or not because why is it there if it does not have a meaning.
  2. An encode page that could be visited by either `encode` or `encode.php`. It does not specify what does it encode (It explicitly states that data is not stored on the server. I mean why would it be?).
  3. A decode page that could be visited by either `decode` or `decode.php`. I later found out that it decodes and the encode page are for base64 codes.
  4. The backend seems to be running on apache 2.2.22 and php 5.3.10.
  5. The image is saved directly in the web root.
  6. The inputs don't seem to be vulnerable to sql injection.
  7. SSL certificate is issued to a `valentine.htb` but when I added it to the host it did not give me anything new.
  8. The functionality of both `http` and `https` seem to be similar.
  9. Bruteforcing directories haven't yeld in anything but the `decode`, `encode` and a directory called `dev` which included a private key of someone and notes of maybe the developer which state the following  
  <blockquote>
  To do:

  1) Coffee.
  2) Research.
  3) Fix decoder/encoder before going live.
  4) Make sure encoding/decoding is only done client-side.
  5) Don't use the decoder/encoder until any of this is done.
  6) Find a better way to take notes.
  </blockquote><br/>     

     * My notes on these notes are    
       * Clearly the encoding/decoding isn't even remotely close to being done client-side.
       * There seems to have been an issue with the decoder/encoder that she/he was reminding him/her-self of fixing it but I'm not sure what.  
       * Obviously this is a horrible way of taking notes.
  10. The rsa private key I found is called `hype_key` which makes me think maybe the user is called `hype`? When I tried to ssh with it I was prompted to enter a passphrase.
  11. The encoder/decoder website's header is "Secure Data Encoder" why is it saying "Data" like maybe that means something.  
  12. Since the backend is php I tried researching ways to decode and encode base64 with php and found a function but still this is getting me nowhere. I mean I know it's php but there could be a number of possibilties for the logic of the backend for the encoding to happen and I'm not sure what that is.  
  13. `/icons/` works and give forbidden but `/icons` on it's own does not work. WHAT DOES THAT MEAN?

<br/><br/>


## <span style="color:#FF5050">Random Notes👀  
* The web service `http` uses php for the backend `X-Powered-By: PHP/5.3.10-1ubuntu3.26`.
* Imma try and see if there are any virtual hosts on the service from the https certificate I can get the domain.
* Tried to look for the way of encoding/decoding text into base64 and found a php function (actually two) that does that but I still don't know the exact code.  
* Sqlmap is giving me this output but I'll check it and try it manually  

  ```cmd
  [11:59:29] [INFO] POST parameter 'text' appears to be 'AND boolean-based blind - WHERE or HAVING clause' injectable (with --string="\x00\\xd0\\xfb;\x004>7Ӟ7\\xd3")
  ```  
* Seems like it's a false positive.  

* Response  

  ```
  Host: valentine.htb
  User-Agent: Mozilla/5.0 (compatible; Nmap Scripting Engine; https://nmap.org/book/nse.html)
  Connection: close
  ```
  ```
  Sec-Ch-Ua: "(Not(A:Brand";v="8", "Chromium";v="99" Sec-Ch-Ua-Mobile: ?0
  Sec-Ch-Ua-Platform: "Linux"
  Upgrade-Insecure-Requests: 1
  User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36
  Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
  Sec-Fetch-Site: none
  Sec-Fetch-Mode: navigate
  Sec-Fetch-User: ?1
  Sec-Fetch-Dest: document
  Accept-Encoding: gzip, deflate
  Accept-Language: en-US,en;q=0.9
  sConnection: close
  ```  
  ```xml
  <?xml version="1.0"?>

  <soap:Envelope
  xmlns:soap="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Header>
  <operationID>00000001-00000001</operationID>
  </soap:Header>
  <soap:Body>
  <RetrieveServiceContent xmlns="urn:internalvim25">
  <_this xsi:type="ManagedObjectReference" type="ServiceInstance">ServiceInstance</_this></RetrieveServiceContent>
  </soap:Body>
  </soap:Envelope>
  ```
<br/><br/>

## <span style="color:#FF5050">How Did I Own This Shit 😎🥳 

1. While researching I found the icon/picture of the openssl vulnerability (Heartbleed) which as the name suggests is a vulnerability that allows leaking of data stored in memory including credentials and other sensitive info.
2. So while trying the exploit for the vulnerability that gets me the leaked data I found an encoded text that turned out to be the passphrase for `hype`'s ssh key.
3. After using a workaround for the old algorithm used to generate the private key I got hype. What was left is root.
4. I got root as simple as running this command which opens a terminal and because it seems I'm a group that reads/writes the session file of the root's. So this got me root instantenuously.
5. There was also a kernel exploit because the kernel was old as hell.
6. There was another pkexec exploit also that could've been possible.

<br/><br/>

## <span style="color:#FF5050">Writeups ✍🏽📓   


<br/><br/>




<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->

