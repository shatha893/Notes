# <span style="color:#9933FF">Machine #16 Registery</span>  


## <span style="color:#9933FF">Notes During Working on the Machine 🧐🤓   

* The http service `-sV` `80/tcp open  http    nginx 1.14.0 (Ubuntu)`.  
* `/install` found it with the gobuster command and it contains pure gebbrish.  
* The web application just loads when provided with `backup.php` and then it opens a blank page. Which means the page exists because I tried some random shit .php and it gave me 404.  
* Found a couple of configuration files.
* Seems like there's a LFI vulnerability.
* Because I'm able to open files in directories I'm forbidden to access.
* Still no trace of a login page (If it's necessary anyway).
* gobuster dir -u http://10.10.10.159/install -x .php,.txt,.html,.md -w /usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt
 -b 403,404  

 gobuster dns -d registry.htb -w ./test.wordlist  

 * Version of bolt I found is 3.6.4 .  
 * Seems that bolt is coded with php.  
 * I tried to gobuster with different directories but it's no use. It's not giving me anything new.
 * I also tried to gobuster the subfolders.
 * Found twig files in `/bolt/theme/base-2018/[FILENAME]` or something like that. Not sure that I remember it correctly.

* Ok I'm going to check all the files I can.  
* I think the only thing that might be useful at the moment in the bolt website is this message  
  <img src="something.png">  
  * Still not sure how thooo.
<br/><br/>



## <span style="color:#9933FF">How Did I Solve the Machine 😎🥳 


<br/><br/>



## <span style="color:#9933FF">Where I Got Stuck?😡😧  


<br/><br/>



## <span style="color:#9933FF">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:#9933FF">Writeups ✍🏽📓   


<br/><br/>
* feroxbuster's results  
```
301        7l       13w      194c http://10.10.10.159/bolt/.git
403        7l       11w      178c http://10.10.10.159/bolt/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/.git/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/.git/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/app
403        7l       11w      178c http://10.10.10.159/bolt/app/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/app/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/.git/branches
403        7l       11w      178c http://10.10.10.159/bolt/.git/branches/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/.git/branches/.htpasswd
200       11l       29w      251c http://10.10.10.159/bolt/.git/config
200        1l       10w       73c http://10.10.10.159/bolt/.git/description
301        7l       13w      194c http://10.10.10.159/bolt/app/cache
403        7l       11w      178c http://10.10.10.159/bolt/app/cache/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/app/cache/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/extensions
403        7l       11w      178c http://10.10.10.159/bolt/extensions/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/extensions/.htaccess
301        7l       13w      194c http://10.10.10.159/bolt/files
403        7l       11w      178c http://10.10.10.159/bolt/files/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/files/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/app/config
403        7l       11w      178c http://10.10.10.159/bolt/app/config/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/app/config/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/app/database
403        7l       11w      178c http://10.10.10.159/bolt/app/database/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/app/database/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/.git/hooks
403        7l       11w      178c http://10.10.10.159/bolt/.git/hooks/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/.git/hooks/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/.git/info
403        7l       11w      178c http://10.10.10.159/bolt/.git/info/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/.git/info/.htpasswd
200      735l     3068w   282698c http://10.10.10.159/bolt/.git/index
301        7l       13w      194c http://10.10.10.159/bolt/.git/logs
403        7l       11w      178c http://10.10.10.159/bolt/.git/logs/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/.git/logs/.htaccess
301        7l       13w      194c http://10.10.10.159/bolt/app/cache/development
301        7l       13w      194c http://10.10.10.159/bolt/.git/objects
403        7l       11w      178c http://10.10.10.159/bolt/.git/objects/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/.git/objects/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/app/config/extensions
301        7l       13w      194c http://10.10.10.159/bolt/.git/refs
403        7l       11w      178c http://10.10.10.159/bolt/.git/refs/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/.git/refs/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/src
200        6l       43w      240c http://10.10.10.159/bolt/.git/info/exclude
403        7l       11w      178c http://10.10.10.159/bolt/src/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/src/.htaccess
301        7l       13w      194c http://10.10.10.159/bolt/tests
301        7l       13w      194c http://10.10.10.159/bolt/app/resources
301        7l       13w      194c http://10.10.10.159/bolt/theme
403        7l       11w      178c http://10.10.10.159/bolt/tests/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/tests/.htaccess
301        7l       13w      194c http://10.10.10.159/bolt/src/Events
403        7l       11w      178c http://10.10.10.159/bolt/app/resources/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/app/resources/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/theme/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/src/Events/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/src/Events/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/src/Security
403        7l       11w      178c http://10.10.10.159/bolt/theme/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/src/Security/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/src/Security/.htaccess
301        7l       13w      194c http://10.10.10.159/bolt/vendor
403        7l       11w      178c http://10.10.10.159/bolt/vendor/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/vendor/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/app/src
403        7l       11w      178c http://10.10.10.159/bolt/app/src/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/app/src/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/app/cache/profiler
301        7l       13w      194c http://10.10.10.159/bolt/app/view
403        7l       11w      178c http://10.10.10.159/bolt/app/view/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/app/view/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/vendor/bin
403        7l       11w      178c http://10.10.10.159/bolt/vendor/bin/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/vendor/bin/.htaccess
301        7l       13w      194c http://10.10.10.159/bolt/.git/objects/info
301        7l       13w      194c http://10.10.10.159/bolt/.git/refs/heads
301        7l       13w      194c http://10.10.10.159/bolt/vendor/composer
301        7l       13w      194c http://10.10.10.159/bolt/vendor/contao
403        7l       11w      178c http://10.10.10.159/bolt/vendor/composer/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/vendor/composer/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/vendor/contao/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/vendor/contao/.htaccess
301        7l       13w      194c http://10.10.10.159/bolt/app/cache/trans
301        7l       13w      194c http://10.10.10.159/bolt/vendor/embed
301        7l       13w      194c http://10.10.10.159/bolt/.git/logs/refs
301        7l       13w      194c http://10.10.10.159/bolt/vendor/facebook
403        7l       11w      178c http://10.10.10.159/bolt/vendor/embed/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/vendor/embed/.htaccess
301        7l       13w      194c http://10.10.10.159/bolt/.git/objects/pack
403        7l       11w      178c http://10.10.10.159/bolt/vendor/facebook/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/vendor/facebook/.htaccess
301        7l       13w      194c http://10.10.10.159/bolt/app/view/css
200       62l      177w     1757c http://10.10.10.159/bolt/vendor/bin/composer
301        7l       13w      194c http://10.10.10.159/bolt/vendor/imagine
403        7l       11w      178c http://10.10.10.159/bolt/vendor/imagine/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/vendor/imagine/.htaccess
301        7l       13w      194c http://10.10.10.159/bolt/vendor/composer/composer
301        7l       13w      194c http://10.10.10.159/bolt/app/view/fonts
301        7l       13w      194c http://10.10.10.159/bolt/app/src/js
301        7l       13w      194c http://10.10.10.159/bolt/vendor/league
403        7l       11w      178c http://10.10.10.159/bolt/vendor/league/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/vendor/league/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/app/src/lib
301        7l       13w      194c http://10.10.10.159/bolt/.git/refs/remotes
301        7l       13w      194c http://10.10.10.159/bolt/app/view/img
301        7l       13w      194c http://10.10.10.159/bolt/app/view/js
301        7l       13w      194c http://10.10.10.159/bolt/.git/refs/tags
301        7l       13w      194c http://10.10.10.159/bolt/vendor/embed/embed
301        7l       13w      194c http://10.10.10.159/bolt/tests/scripts
403        7l       11w      178c http://10.10.10.159/bolt/tests/scripts/.htpasswd
403        7l       11w      178c http://10.10.10.159/bolt/tests/scripts/.htaccess
301        7l       13w      194c http://10.10.10.159/bolt/theme/skeleton
403        7l       11w      178c http://10.10.10.159/bolt/theme/skeleton/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/theme/skeleton/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/app/resources/translations
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony
403        7l       11w      178c http://10.10.10.159/bolt/vendor/symfony/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/vendor/symfony/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/vendor/twig
403        7l       11w      178c http://10.10.10.159/bolt/vendor/twig/.htaccess
403        7l       11w      178c http://10.10.10.159/bolt/vendor/twig/.htpasswd
301        7l       13w      194c http://10.10.10.159/bolt/vendor/imagine/imagine
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/asset
301        7l       13w      194c http://10.10.10.159/bolt/app/view/toolbar
301        7l       13w      194c http://10.10.10.159/bolt/theme/skeleton/css
301        7l       13w      194c http://10.10.10.159/bolt/app/view/twig
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/config
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/console
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/debug
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/finder
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/form
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/intl
301        7l       13w      194c http://10.10.10.159/bolt/theme/skeleton/partials
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/process
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/routing
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/security
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/translation
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/validator
301        7l       13w      194c http://10.10.10.159/bolt/vendor/twig/twig
301        7l       13w      194c http://10.10.10.159/bolt/vendor/symfony/yaml
```

<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->