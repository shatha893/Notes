# .NET 5 & .NET Core 3.1 Web API & Entity Framework  

## Creating a Dotnet Project  

1. Create a folder for the project.
2. Open it in VSCode.
3. Open a terminal.
4. Type `dotnet new` shows all the templates we can use.  
5. The template we use for web APIs is called "ASP .NET Core Web API `webapi`".
6. Type `dotnet new webapi`.

## Exploring the Project's Structure  

* We can find our running service in a url in a file called `launchSettings.json` in the `Properties` directory.  

## Starting the Application  

* We enter `dotnet run`.  
* `[Route("[controller]")]` this means that we can access the controller through its name if put right before the controller method.
* When adding the project to a git repository we should add a "gitignore" file because we don't have to commit everthing.
* We create the .gitignore file by typing the command `dotnet new gitignore`. And that's it!