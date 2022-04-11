# Core Defense Mechanisms  

* The following mechanisms that we'll be writing about are not the only defensive mechanisms but they make the majority of a typical application's attack surface   

## Handling User Access  

* Which can be accomplished in three ways that are interrelated and most web applications use them  

  ### Authentication   
    * The lowest possible level of trust is *anonymous*.
    * Most web applications use the conventional way of authenticating users which is using a *username* and a *password*. Some apps that need higher levels of security use an additional way of authenticating.
    * Other authentication models can be used such as *client certificates*, *smartcards*, or *challenge-response tokens*.  
    * *Challenge-Response Tokens* what are they?
    * Authentication mechanisms can suffer from a wide range of defects that could allow an attacker to, maybe, identify other users' usernames, guess their passwords, or bypass the login function by exploiting defects in its logic.
    * Defects in authentication could allow an attacker to gain unauthorized access to sensitive data and functionality.

  <br/><br/>

    ### Session Management  
    * The web application needs to identify and process the series of requests sent by unique users to the server and this is accomplished using session tokens.  
    * The *session* itself is a set of data structures that track the state of the user's interactions with the server.
    * The *token* is a unique string that the application maps to the session.  
    * When a user recieves a token the browser automatically submits it back with each subsequent HTTP request enabling the application to associate the application with that specific user.
    * HTTP cookies are the standard method of transmitting session tokens.
    * Many applications use other ways of transmitting tokens like for example *hidden form fields*.
    * Tokens stored in *hidden form fields* are bad security right?
    * Session tokens expire if there was no interaction from the user to the server for a while.
    * The Session Management mechanism is highly dependent on the security of its tokens.
    * Defects in such mechanism can allow an attacker to maybe guess the tokens, or maybe defects in how the tokens are subsequently handled enabling an attacker to capture other users' tokens.

  <br/><br/>

    ### Access Control  
    * It's what decides whether the user is authorized to perform the action or access the data that he is requesting.
    * Because of the complex nature of this developers ofter make flawed assumptions about how users will interact with the application and frequently make oversights by omitting access control checks from some application functions.

<br/><br/><br/>

  ## Handling User Input  
* Some times applications need a wider range of inputs than Textfields and it could need to input data that is a code if it was some kind of a blog for example. Developers should make sure that this data is handled properly so that attackers won't be able to exploit it.
* For example if an attacker played with server-generated data that is not possible for an ordinary user to tamper with then the application should reject any requests of such thing and log the incident for potential investigation.  
* Approaches to handle input  

    <br/>

    ### *Reject Known Bad*  
    * This approach employs blacklisting literal strings and patterns that are known to be used in attacks.
    * This is considered the least effective approach to validate user input. Why?  
      1. The input on web applications can be provided in a variety of ways which can also be encoded and represented in various ways.
      2. Techniques for exploitation are constantly evolving.
   * In such approach filters that are designed to block certain approaches can be bypassed by using nonstandard characters between expressions to disrupt the tokenizing performed by the application.
   * Numerous blacklist-based filters are vulnerable to NULL byte attacks.
   * Before a blocked expression can cause some filters to stop processing the input and therefore not identify the expression    
      ```js
      %00<script>alert(1)</script>
      ```   

    <br/><br/>

    ### *Accept Known Good*  
    * This approach employs whitelisting literal strings, patterns or a set of criteria.
    * E.g. Before looking up a requested product code in the database, an application might validate that it contains only alphanumeric characters and is exactly six characters long.
    * It's regarded as the most effective way to handle potentially malicious input ( When it's feasible ).

    <br/><br/>

    ### *Sanitization*  
    * Malicious characters must be removed from the data, leaving only what is known to be safe, or they may be suitably encoded or escaped before further processing is perfomred.  
    * Sanitization is highly effective  and in many situations they can be relied on as a general solution.
    * The usual defense against <mark style="background-color: lightblue"> Cross Site Scripting (XSS) </mark> is to HTML-encode dangerous characters.  

    <br/><br/>

    ### *Safe Data Handling*  
    * Vulnerabilities can be usually avoided not just by validating but also by ensuring that the processing that is performed on it is inherently safe.  
    * <mark style="background-color: lightblue"> SQL Injection </mark> attacks can be prevented through the correct use of parameterized queries for database access.
    * What is parameterized queries?

    <br/><br/>  

    ### *Semantic Checks*  
    * Sometimes it's not the data that the attacker submits that is malicious. Meaning, the data that the attacker is submitting follows the rules of the validation on the form but what is malicious is the circumstances under which it is submitted.
    * E.g. An attacker gains access to another user's bank account information by changing an account number transmitted in a hidden form field.


    <br/><br/><br/>   


    ## Boundary Validation   
    * Input validation on the client side on its own isn't enough. Why is that? Because of the following:  
      1. There is a huge variety of input-based attackes each of which employs a diverse set of crafted data.
      2. A skilled attacker may be able to manipulate tha application to cause malicious input to be generated at a key stage of the processing attacking the component that receives the data if we have an application that processes the data in several components and processing types and not just one.
      3. Validation checks for different categories of input-based attacks could clash with each other. Like for example we want to HTML-encode the character `>` into `$gt;` to prevent XSS but we also want to prevent command injection which can be done by requiring the application to block `;` characters.   
    * That's why we use what we call *Boundary Validation* where each individual component or functional unit of the server-side application treats its inputs as coming from a potentially malicious source.  
    * Because the validation checks are performed on different stages they won't conflict with each other.

 