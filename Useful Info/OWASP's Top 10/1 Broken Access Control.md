# 1 Broken Access Control   

### Access Control?   
* Access Control enforces policy such that users * **cannot** act outside of their intended permissions*.   

### Failures of Access Control   
* Failures of access control lead to unauthorized information disclosure, modification, or destruction of all data or performing a business function outside the user's limits. 
* Common access control vulnerabilities include:   
	1. *Violation of the principle of least privilege* (or deny by default), where access should only be granted for particular  capabilities, roles, or users, but is abailable to anyone.
	2. *Bypassing access control* checks by modifying the URL (parameter tampering or force browsing), internal application state, or the HTML page, or by using an attack tool modifying API requests.  
	3. *Permitting viewing or editing someone else's account, by providing its unique identifier* (insecure direct object references).
	4. *Accessing API with missing access controls* for POST, PUT and DELETE.   
	5. *Elevation of privilege*. Acting as a user without logging in or as an admin when logged in as a user.  
	6. *Metadata manipulation*, such as replaying or tampering with JSON Web Token (JWT) access control token, or a cookie or hidden field manipulated to elevate privileges or abusing JWT invalidation.   
	7. *CORS misconfiguration* allows API access from unauthorized/untrusted origins.  
	8. *Force browsing to authenticated pages as an unauthenticated user* or *to privileged pages as a standard user*.   


### How to Prevent Broken Access Control?    
* When is access control most effective?   
	* In trusted server-side code or server-less API, where the attacker cannot modify the access control check or metadata.  

* How to protect against it?  
	1. Except for public resources, deny by default.
	2. Implement access control mechanisms once and re-use them throughout the application, including minimizing Cross-Origin Resource Sharing (CORS) usage.
	3. Model access controls should enforce record ownership rather than accepting that the user can create, read, update, or delete any record.  [WHAT THE HELL DOES THAT MEAN?]
	4. Unique application business limit requirements should be enforced by domain models.  
	5. Disable web server directory listing and ensure file metadata (e.g. git) and backup files are not present within web roots.
	6. Log access control failures, alert admins when appropriate (e.g. repeated failures).
	7. Rate limit API and controller access to minimize the harm from automated attack tooling.
	8. Stateful session identifiers should be invalidated on the server after logout. 

























