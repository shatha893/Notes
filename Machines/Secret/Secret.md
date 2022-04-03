# <span style="color:#FF5050">Machine #21 Secret</span>  


## <span style="color:#FF5050">Checklist 🤓   

- [x] Maybe I could find out what to put in the api url after I comb the website for more stuff.
- [x] Check the zip file. What does it contain the source code of the authentication api functionality?Seems like it contains the source code of everything.
- [x] ~~The search could be vulnerable to SQL Injection.~~
- [x] The ppp port (What can I do with it?). Turns out it's not ppp it's the port where the api is working.
- [x] The credentials in the documentation could be real. The names are but the password is not.
- [ ] ~~Check the admin creds~~.
- [x] Try to imitate the jwt in the documentation.
- [x] Check if there are any nginx vulnerabilities for 1.18.0.
- [ ] ~Maybe I can get to "theadmin" by trying to create a new user with this name~
- [x] Maybe I have to find theadmin's password somewhere
- [ ] Maybe use the `/download` functionality to do something.
- [x] NoSQL Injection (The string validation using Joi is not helping)
- [x] None algorithm JWT.
- [x] Cracking the secret.
- [x] `kid` parameter.
- [x] Substitution attack.
- [x] NoSQL Injection(Because of the string validation).  
- [x] Check if any package being used is vulnerable to anything or old but they're not.
- [x] Bruteforcing the password of "theadmin".
- [x] Maybe I can access the `.env` file somehow ( In the `.git` directory)

* We have the verification code of the jwt which is the core of trying to exploit it by using one of the jwt attacks or bad practices  
  ```js
  const jwt = require("jsonwebtoken");

  module.exports = function (req, res, next) {
      const token = req.header("auth-token");
      if (!token) return res.status(401).send("Access Denied");

      try {
          const verified = jwt.verify(token, process.env.TOKEN_SECRET);
          req.user = verified;
          next();
      } catch (err) {
          res.status(400).send("Invalid Token");
      }
  };
  ```

  - [ ] ~~Using `decode()` instead of `verify`.~~   
  - [ ] ~~Trying to use `none` algorithm ( It's not allowed because for it to be allowed I have to put the second parameter or maybe the third as `"algorithms":["none","HMAC256"]` but that's not the case because I the parameter does not exist which means it's the default and the default is "HMAC256" on it's own).~~ 
  - [ ] ~~Trying to use the RSA (Asymmetric Algo) instead of HMAC but that won't work too because for the RSA to work I have to replace the secret key with the public key and I don't have either public key or the ability to replacet the key with anything.~~
- [ ] Analyze the source code more and in a more effecient way I think it should be my way in whether it was the logs dir or something else.
<br/><br/>


## <span style="color:#FF5050">What Do We Have? 🤔🤔 

* Seems like the api is using the 3000 port.
* I'll try and -sV the port.
* Turns out the port 3000 is not for ppp it's for `3000/tcp open  http    Node.js (Express middleware)` this which could be using ppp I'm not sure.
* I got access to the openssh rsa key through `ssh-keyscan [IP ADDRESS]` which is probably useless because I can't really change the key that the jwt is signed with.  


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

* The "Download Source Code" downloads the source code of the whole website and not only the code for the api. 
* But there's something weird. The /download takes files from a directory called `sources` and that's not in the code I downloaded. Maybe the code gets created later.  
* To make the system's security better:  
  * In the source code download there shouldn't have been the `.git` directory.
<br/><br/>

## <span style="color:#FF5050">How Did I Own This Shit 😎🥳 

1. Downloaded the source code of the Authentication API.
2. Looked through the website for a while.
3. Looked through the code for a little too long while.
4. Turns out it's the `.git` folder that was maybe the only file that I did not look into other than `node_modules` which is definitly not worth looking into.
5. So while searching the `objects` directory it had a bunch of objects that when I unzipped them I found data on the previous commits
6. Given that a commit in the `logs` directory had something that said `I removed .env file for security reasons` it meant that the `.env` file existed at some point and that it might exist in the .git timeline.
7. It did. And sure as hell it contained the `TOKEN_SECRET` that is being used to sign the jwt.
8. I found that after falling into the rabbit holes of jwt attacks and NoSQL Injection.
9. The root was the pkexec polkit's CVE which gives root instantanuously after compiling the c code.
10. The writeup mentions another way of privesc but I'm not sure I totally understood what it's talking about.

<br/><br/>

## <span style="color:#FF5050">Writeups ✍🏽📓   


<br/><br/> 
