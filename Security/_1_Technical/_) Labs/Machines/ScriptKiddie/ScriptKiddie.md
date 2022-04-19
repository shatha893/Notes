# <span style="color:#3333FF">Machine #24 ScriptKiddie</span>  


## <span style="color:#3333FF">Checklist 🤓   

- [ ] Command injection in the `searchsploit` entry ( If I can evade the validation that is clearly set there).
- [ ] Code injection on either the payload or the nmap entries because they seem to be more of pure python than just os commands.
- [x] Vulnerability of the Werkzeug version we have ( But it needs DEBUG to be enabled and we don't have that).
- [ ] Look more into the msfvenom download a template thing. What does it mean? what is done with the file exactly in the backend.
- [ ] Research how to implement msfvenom using Python.

<br/><br/>


## <span style="color:#3333FF">What Do We Have? 🤔🤔 

* We have a web server on port 5000 that seems to be a tool for "hacking". It has:  
  * An nmap scanner (which could be implemented using a python library called `nmap` or sth similar to that).
  * An msfvenom payload creator which creates reverse shells that are valid for only 5 minutes. I can only make rev shells for Windows and Android, I can't seem to be able to make a rev shell for Linux eventho I'm not sure how vulnerable the machine would be if it already had a rev shell on it. The only thing I could think of is if I was able to execute the file that's a different story but the only path I had to the file is a path that forces me to download the file instead of opening it on the server.
  * A searchsploit tool that seems to be well validated for any use of special characters which limits my attempts to inject commands there.
  * In the msfvenom tool I have the ability to download a template (I'm not sure what that means I should look more into it).  
  * I seem to be able to open files on the service but not directories which means there's no directory traversal (I think).
<br/><br/>


## <span style="color:#3333FF">Random Notes👀
  
* The web server being used and the language version 
```
Werkzeug/0.16.1 Python/3.8.5
```   


<br/><br/>  


## <span style="color:#3333FF">How Did I Own This Shit 😎🥳  


<br/><br/>

## <span style="color:#3333FF">Writeups ✍🏽📓   


<br/><br/> 
