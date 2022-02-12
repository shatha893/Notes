* Transferring files through nc  

    * On the recieving end  
    ```console
    nc -l -p 1234 > out.file
    ```  

    * On the sending end  
    ```console
    nc -w 3 [destination] 1234 < out.file
    ```

    