## Pspy   

* Tutorial on downloading it <a href="https://vk9-sec.com/how-to-enumerate-services-in-use-with-pspy/">Access Here!</a>
* Not everything in the previous link might work, so here's what I did:  
  * If you get this error  
    ```console
    go: cannot find main module, but found Gopkg.lock in /home/kali/Documents/cloned_reps/pspy
      to create a module there, run:
      go mod init
    ```   
	write the following command `go mod init Gopkg.lock`.
  * `go mod tidy` after the previous command.
  * Then after this if you get another error when running `go build` use the command `go mod vendor` and it should work fine.  
  * After doing all this the excutable should be called 'Gopkg.lock' and I just can `cp` it with another name "pspy" for example.

* If you get this error while `go build`ing `go build Gopkg.lock: build output "Gopkg.lock" already exists and is not an object file` remove the "Gopkg.lock" `rm Gopkg.lock` and then `go build`.