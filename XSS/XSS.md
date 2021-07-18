<link href="XSS.module.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cedarville+Cursive&family=Encode+Sans+SC&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">

## <span class="copyright">General Notes <span style="float:right;">By Shatha Barqawi</span>

<br/><br/>

# <span class="title">Cross-site Scripting ( XSS )


<span class="date">Wednesday, 7/7/2021</span>  
<span class="date">Friday, 9/7/2021</span>  
<br/><br/>

<li class="list"> What is Cross-site Scripting?</li>  
According to PortSwigger  
<blockquote>

*is a web security vulnerability that allows an attacker to compromise the interactions that users have with a vulnerable application.*  
*It allows an attacker to circumvent the same origin policy, which is designed to segregate different websites from each other.*  
*Cross-site scripting vulnerabilities normally allow an attacker to masquerade as a victim user, to carry out any actions that the user is able to perform, and to access any of the user's data. If the victim user has privileged access within the application, then the attacker might be able to gain full control over all of the application's functionality and data.*
</blockquote>  
<br/><br/>  

<li class="list"> How Does it Work?</li>  
By sending the users malicious JS code so that when the code executes inside the victim's browser the attacker can compromise the user's interaction with the application.  
<br/><br/>

<li class="list">Types of XSS Attacks</li>  

* **Reflected XSS** (Simplest)  
    where the malicious script comes from the current http request.  
    It arises when an application takes user input from the request and includes it in the immediate response in a very unsafe way.
   


* **Stored XSS**   
   where the malicious script comes from the website's DB.  
   It arises when the malicious code is sent with *later* http requests. This code can be submitted on the application via http requests or via a webmail application displaying messages over SMTP.

* **DOM-based XSS**  
   where the vulnerability exists in client-side code rather than server-side code.  
   As quoted from PortSwigger  
   <blockquote>

   *DOM-based XSS (also known as DOM XSS) arises when an application contains some client-side JavaScript that processes data from an untrusted source in an unsafe way, usually by writing the data back to the DOM.*
   </blockquote>
<br/><br/>

<li class="list">How to Exploit the XSS Vulnerability</li>  

* Exploiting XSS to steal Cookies.  
  We can send the victim's cookies to our own domain and then inject the cookies into our browser and by that impersonating the victim.  

  But this approach has its downsides:  

   1. The victim might *not* be logged in.
   2. Many applications use the *httpOnly* flag which hides cookies from JS.
   3. Sessions might be related to other users' factors like e.g. their IP address. 
   4. The session might time out before we can hijack it.  
   <br/>

* Exploiting XSS to capture passwords.  
   An attacker can steal a user's password if they have a password manager that auto-fills their password so they take the autofilled password send it to their domain and use it to gain access without needing the headache of the cookies situation. An attacker can also have access to other accounts that the victim uses the same password for.  
   The obvious disadvantage of this exploit is the need for the user to be using a password manager to be able to steel the auto-filled password.  
   <br/>

* Exploiting XSS to perform CSRF.  
  Depending on the vulnerable website with XSS we can do legitimate user acts like sending a message or accepting a friend request posing as the user. Such thing is referred to as CSRF.  

  