### <span class="useful_shit subtitle">MySQL  

  * To access mysql database on localhost we can use  
    ```
    mysql -u [USERNAME] -p
    ```  

  * To access the database remotely  
    ```
    mysql -u [USERNAME] -p [IP ADDRESS]
    ```  

  * In the default configuration of mysql the root user's password is *empty*.

  * Mysql's command prompt. Some of its commands

    ```console
    mysql> show databases;
    mysql> select * from [TABLE NAME];
    mysql> use [DATABASE NAME];
    mysql> show tables;
    ```

  * Mysql is a service that can be run on a computer and I can run it as follows
    ```console
    kali> service mysql start
    ```

`--dbs` to discover databases.
`--tables -D safecosmetics` find tables in a specific database

 <br/><br/> 