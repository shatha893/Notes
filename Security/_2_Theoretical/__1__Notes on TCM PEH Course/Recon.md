# Subdomains  

## Enumerating for Subdomains  

* We can look for subdomains using the tool `Sublist3r`.
* We can open the website `crt.sh` too to find certificates there which could help me find subdomains.
* We can use `Amass` to find MORE subdomains.
* There's also a tool called `tomnomnom/httprobe`.

<br/><br/>

# Identifying Website Technologies  

## Tools  

* There's a tool called `builtwith`.
* The one that we know `wappalyzer`.
* `whatweb` command also could be of help.  

<br/><br/>

# BurpSuite  

* Open `Target` tab and then `Site Map`.
* There, we can see all the traffic that has been intercepted. All the requests that has been made and their bodies. We can view the response as well.  
* The kind of enumeration or recon I usually do with burp turned out to be considered as "Passive Recon".
* There's an Active scan feature in burp suite pro that does an active VA.  
* There's another tab in the `Target` tab called `Scope` which inside of it I can decide what is the scope I want for Burp to catch. I specify the domain.

<br/><br/>  

# Googling  

* We can use `site:tesla.com` without the `www` because this will limit us to only the one domain but if we want to get the results of everthing except for the `www` domain we can do this `site:tesla.com -www`.
* We can search for specific file types with something like this `site:tesla.com filetype:docx`.
* I guess we can google the rest of the ways we can do Google dorking.  

<br/><br/>  

# Utilizing Social Media in OSINT  

* We can utilize pictures on social media of an organization to look for badges.
* Twitter is a gold mine for these stuff and LinkedIn   
* People will always be the weakest link in an organization and they will always be lazy with their passwords unless you make them use long passwords.
