# <span style="color:[COLOR]">Machine #22 Pandora</span>  


## <span style="color:[COLOR]">Notes During Working on the Machine 🧐🤓   

* The "Send Us Message" could be something. 
* Seems like there's a virtual host called `panada.htb`.
* The "send us" is a GET request   
`GET /?fullName=&email=&phone=&message= HTTP/1.1`  

* Is this something to think of as important?  `<a href="javascript:void(0)" class="ud-main-btn ud-white-btn">`
* These might mean something  
    ```html
       <!-- Primary Meta Tags -->
    <meta name="title" content="Play - Free Open Source HTML Bootstrap Template by UIdeck">
    <meta name="description" content="Play - Free Open Source HTML Bootstrap Template by UIdeck Team">

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://uideck.com/play/">
    <meta property="og:title" content="Play - Free Open Source HTML Bootstrap Template by UIdeck">
    <meta property="og:description" content="Play - Free Open Source HTML Bootstrap Template by UIdeck Team">
    <meta property="og:image" content="https://uideck.com/wp-content/uploads/2021/09/play-meta-bs.jpg">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://uideck.com/play/">
    <meta property="twitter:title" content="Play - Free Open Source HTML Bootstrap Template by UIdeck">
    <meta property="twitter:description" content="Play - Free Open Source HTML Bootstrap Template by UIdeck Team">
    <meta property="twitter:image" content="https://uideck.com/wp-content/uploads/2021/09/play-meta-bs.jpg">
    ```
* The site could be built on wordpress. But is it possible that it be built on wp and wp mesh fad7een eldenyah about it.
* Yeah I think the UIDeck itself is the one that is wordpress.  

* This sentence might mean something *"PLAY is an extension of Panda.HTB"*. 
* Found an open UDP port `161` it's usually for SNMP (Simple Network Management Protocol).
* I say just to be safe I should do the udp scan along with the other scans.
* Somehow I was able to view the processes of the system and in one of these were the credentials of a user daniel/HotelBabylon23.  
* matt seems to be the admin of the web app.
* GRANT ALL PRIVILEGES ON pandora.* TO 'pandora'@'IP' IDENTIFIED BY 'password'
* Found a bunch of "pandora fms" exploits.
* Found this to get to matt 

```sql
INSERT INTO `tusuario` (`id_user`, `fullname`, `firstname`, `lastname`, `middlename`, `password`, `comments`, `last_connect`, `registered`, `email`, `phone`, `is_admin`, `language`, `block_size`, `section`, `data_section`, `metaconsole_access`) VALUES
('admin', 'Pandora', 'Pandora', 'Admin', '', '1da7ee7d45b96d0e1f45ee4ee23da560', 'Admin Pandora', 1232642121, 0, 'admin@example.com', '555-555-5555', 1, 'default', 0, 'Default', '', 'advanced');

```



## <span style="color:[COLOR]">How Did I Solve the Machine 😎🥳 


<br/><br/>



## <span style="color:[COLOR]">Where I Got Stuck?😡😧  


<br/><br/>



## <span style="color:[COLOR]">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:[COLOR]">Writeups ✍🏽📓   


<br/><br/>




<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->