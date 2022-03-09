# <span style="color:#009688">Tools --*John the Ripper*--</span> 

## <span style="color:#009688">Special Usage  
### `ssh2john.py`  
* We can use this script to bruteforce the passphrase of a private key if I gain access to it. So we first run this and then we run `john` with a wordlist.
* Try `rockyou.txt` at first.  

### `office2john.py`

<br/><br/>

## <span style="color:#009688">Normal Usage  

```console
john --wordlist=[PATH/TO/WORDLIST] [PRIVATE KEY FILE]
```  

* We can use john the ripper to crack shadow file password by combining passwd and shadow first `unshadow /etc/passwd /etc/shadow > password.txt`.
* Then we just write `john password.txt`.
<br/><br/>

## <span style="color:#009688">Options/Flags/Switches  

<br/><br/>

