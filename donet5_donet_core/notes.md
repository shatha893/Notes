# .NET 5 & .NET Core 3.1 Web API & Entity Framework  

## Section 2: Web API .NET 5  

### 15. Best Practice: Web API Structure  
* Controllers should always be pretty simple and just forward data to the servers and return the results to the client.  
* We inject the necessary services into the controller by using Dependency Injection. 
* The best things about dependency injection is that we can use a service with multiple controllers.  
* DTOs are used for the communication between client and server.  
* Models are a representation of the database on the other hand DTOs are not mapped to the database.
* We use DTOs when we want to save information to the database but we don't want to send it back to the client.
* We use Automapper to get the model and the mapping information.
* All this gives us more freedom in what we want to return to the client.  
  
* EF (Entity Framework Core)