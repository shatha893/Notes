# <span style="color:#FF5050">Machine #21 Secret</span>  


## <span style="color:#FF5050">Checklist 🤓   

- [x] Maybe I could find out what to put in the api url after I comb the website for more stuff.
- [x] Check the zip file. What does it contain the source code of the authentication api functionality?Seems like it oontains the source code of everything.
- [x] ~~The search could be vulnerable to SQL Injection.~~
- [x] The ppp port (What can I do with it?). Turns out it's not ppp it's the port where the api is working.
- [x] The credentials in the documentation could be real. The names are but the password is not.
- [ ] Check the admin creds.
- [ ] Try to imitate the jwt in the documentation.
- [x] Check if there are any nginx vulnerabilities for 1.18.0.
- [ ] Maybe I can get to "theadmin" by trying to create a new user with this name
- [ ] Maybe I have to find theadmin's password somewhere
- [ ] Maybe use the `/download` functionality to do something.
<br/><br/>


## <span style="color:#FF5050">What Do We Have? 🤔🤔 

* Seems like the api is using the 3000 port.
* I'll try and -sV the port.
* Turns out the port 3000 is not for ppp it's for `3000/tcp open  http    Node.js (Express middleware)` this which could be using ppp I'm not sure.

<br/><br/>


## <span style="color:#FF5050">Random Notes👀  
* Damn I get the title of the website now "DUMBDocs" it means the documentation is absolutely stupid which could indicate that the credentials in the documentation are real. So the 

* I found this while researching apis  
  <blockquote>
  API locations may be discovered through many means including analysing JavaScript files, analysing exposed source code, observing host names
  </blockquote>
* That's exactly what "I have an exposed source code".
* The payload  
```json
{
    "_id": "6114654d77f9a54e00f05777",
    "name": "theadmin",
    "email": "root@dasith.works"
}
```

<br/><br/>

## <span style="color:#FF5050">How Did I Own This Shit 😎🥳 


<br/><br/>

## <span style="color:#FF5050">Writeups ✍🏽📓   


<br/><br/> 
