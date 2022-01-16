```
python3.5 -c 'import sys; print( "\n".join(sys.path))'
``` 


## Spawn a Shell When Connecting to a Reverse Shell   
	```console
	python -c 'import pty;pty.spawn("/bin/bash");'

	//or

	python3 -c 'import pty;pty.spawn("/bin/bash");'
	```  


* Using Python for a psuedo terminal  
	```console
	python -c 'import pty; pty.spawn("/bin/bash")'
	```   


1. Using `wget`  
* We run a Python HTTP server on our machine and wget or cURL on the victim to download the file   

* On my machine
  ```console
  Shatha Barqawi@htb[/htb]$ cd /tmp
  Shatha Barqawi@htb[/htb]$ python3 -m http.server 8000
  #or 
Shatha Barqawi@htb[/htb]$ python3 -m SimpleHttpServer 8000  # Make sure of this

  Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
  ```
