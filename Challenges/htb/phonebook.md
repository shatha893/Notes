* There seems to be an XSS  
```js
document.getElementById("message").innerHTML = message;
```  
* That's bad security for the javascript code to be just there for me to see it eventho I knew there was an XSS without even seeing the code but the code was a confirmation.
* I'm not sure if the javascript code is being executed and why it's not.  

* This opened up something  
`http://138.68.180.98:31314/964430b4cdd199af19b986eaf2193b21f32542d0/#`  

* This form tag looks weird  
```
<form class="form-inline my-2 my-lg-0" action="javascript:;" onsubmit="search(this)">
```