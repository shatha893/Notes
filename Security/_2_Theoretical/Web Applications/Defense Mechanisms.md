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
