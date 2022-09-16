# <span style="color:#660066">Machine #31 Node</span>  



## <span style="color:#660066">Checklist 🤓   
- [ ] SSTI
- [ ] I could guess the admin's session if I was able to decode the users' session cookies that I have. But there's some kind of secret that is used to do that.
- [ ] ~~This exploit `MongoDB 2.2.3 - nativeHelper.apply Remote Code Execution`~~
<br/><br/>


## <span style="color:#660066">What Do We Have? 🤔🤔  
* Machine IP: `10.129.84.208`.
* Some kind of templating is being used.  
* Nodejs backend. 
* Express.
* Apache Hadoop (hadoop-tasktracker)
  * Written in Java.
  * It's an open source, java-based software platform that manges data processing and storage for big data applications.
* Found this in the code `/api/admin/backup`
* The bloody password is sent with the request to the users like this
  * Request:
    ```
    GET /api/users/tom HTTP/1.1
    Host: 10.129.84.208:3000
    Accept: application/json, text/plain, */*
    User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36
    Referer: http://10.129.84.208:3000/profiles/mark
    Accept-Encoding: gzip, deflate
    Accept-Language: en-US,en;q=0.9
    Connection: close
    ```  
  * Response:  
    ```
    HTTP/1.1 200 OK
    X-Powered-By: Express
    Content-Type: application/json; charset=utf-8
    Content-Length: 146
    ETag: W/"92-i7KsecITBt58aCBrfJ2ziyXT+uA"
    Date: Fri, 08 Jul 2022 19:20:26 GMT
    Connection: close


    {"_id":"59a7368398aa325cc03ee51d","username":"tom","password":"f0e2e750791171b0391b682ec35835bd6a5c3f7c8d1d0191451ec77b4d75f240","is_admin":false}
    ```  

* The hash above is `SHA256` and it's breakable and I got the passwords:
  * tom:spongebob
  * mark:snowflake

* Seems like I need to guess how the session cookies are working so that I could find the admin's session 
                 Session ID 
  * mark ==> s:NioWtqGyzDPRnkxMzHvQWUKhnC976Q3G.qjV6kskzlnr2gE6qX1SEG8DjBlYZrrLUbErSYm2BPZ4
  * tom  ==> s%3 AEonc0Dxm2Q3Dr2mf42BlU1axWPMr_R-Y. vyKMaxF2JZgi0ej6fCvUkc%2ByUiO1WP5HA3Tt2CUdyG8

* This page `http://10.129.84.208:3000/partials/admin.html` has a button "Download Backup" but it's not doing anything.  

* `http://10.129.84.208:3000/api/users` when I visited this it gave me a list of all the users including the admin.  
```
[{"_id":"59a7365b98aa325cc03ee51c","username":"myP14ceAdm1nAcc0uNT","password":"dffc504aa55359b9265cbebe1e4032fe600b64475ae3fd29c07d23223334d0af","is_admin":true}, // Password: manchester
{"_id":"59a7368398aa325cc03ee51d","username":"tom","password":"f0e2e750791171b0391b682ec35835bd6a5c3f7c8d1d0191451ec77b4d75f240","is_admin":false},{"_id":"59a7368e98aa325cc03ee51e","username":"mark","password":"de5a1adf4fedcce1533915edc60177547f1057b61b7119fd130e1f7428705f73","is_admin":false},{"_id":"59aa9781cced6f1d1490fce9","username":"rastating","password":"5065db2df0d4ee53562c650c29bacf55b97e231e3fe88570abc9edd8b78ac2f0","is_admin":false}]
```  

* Zip file protected with password. I bruteforced the password and found it using `fcrackzip` `magicword`  

* Found this url that is being used to login into mongodb by nodejs `mongodb://mark:5AYRft73VtFpc84k@localhost:27017/myplace?authMechanism=DEFAULT&authSource=myplace` I GOT MARK
* I sshed into mark through these creds above. 




<br/><br/>


## <span style="color:#660066">Random Notes👀

<br/><br/>  


## <span style="color:#660066">How Did I Own This Shit 😎🥳  

<br/><br/>



## <span style="color:#660066">Where I Got Stuck?😡😧  


<br/><br/>



## <span style="color:#660066">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:#660066">Writeups ✍🏽📓   


<br/><br/>

<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->