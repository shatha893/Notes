# Section 20: Access Control  

## 173. Access Control  

* Access Control: is the methods used to secure data and information by verifying a user has permissions to read, write, delete, or otherwise modify it.  

## 174. Access Control Models  

* We have 4 Access Control Models  
  1. DAC (Discretionary Access Control)  
     * The access control policy is determined by *the owner*.  
     * To be able to use this there are specific things that has to be met in the system  
       1. Every object in a system must have an owner. 
       2. The owner determines access rights and permissions for each object.  

  2. MAC (Mandatory Access Control)  
     * An access control policy where the computer system determines the access control for an object. 
     * The owner chooses permissions in DAC but in MAC, the computer does.  
     * MAC relies on security labels being assigned to every user (called a subject) and every file/folder/device or network connection (called an object).
     * Data labels create trust levels for all subjects and objects.
     * Labels can be (top secret, secret, unclassified, confidential,...etc).
     * Not only you need to meet the minimum level but you have to have something called "need-to-know".  
     * MAC can be implemented in two ways  
       1. It can be Rule-Based  
          * Label-based access control that defines whether access should be granted or denied to objects by comparing the object label with the subject label. 
       2. Lattice-Based  
          * Utilizes complex mathematics to create sets of objects and subjects to define how they interact. 
     * MAC can be implemented in FreeBSD and SELinux operating systems ( Windows does not use this). 
     * These types of Access control systems can only be seen in high security systems due to its complex configuration and the fact that it's expensive.
  3. RBAC (Role Based Access Control)  
    * Def. An access model that is controlled by the system (like MAC) but utilizes a set of permissions instead of a single data label to define the permission level.
    * Power users is a role-based permission. These users are not normal users nor administrator users but something in the middle.

  4. ABAC (Attribute-Based Access Control)  
    * Def. An access model that is dynamic and context-aware using IF-THEN statements.
    * Newer forms of access control.
    * If Jason is in HR, then give him access to \\fileserver\HR.  

## 175. Best Practices  

* Access control best practices are as follows  
  1. Implicit Deny  
     * All access to a resource should be denied by default and only be allowed when explicitly stated.  
  2. Least Privilege  
     * Users are only given the lowest level of access needed to perform their job functions.  
  3. Separation of Duties  
     * Requires more than one person to conduct a sensitive task or operation. 
     * To stop fraud from happening to some extent.  
     * Saparation of duties can be implemented by a single user with a user and admin account (To prevent malware from infecting the admin user too if it was installed on the user account).  

  4. Job Rotation  
     * Occurs when users are cycled through various jobs to learn the overall operations better, reduce their boredom, enchance their skill level, and most importantly increase our security. 
     * Helps identify theft, fraud and abuse of position.

## 176. Users and Groups  

* Subjects can be users and objects can be files, folder or devices and it can also be a group of users.  
* A group can contain multiple users and it can also contain multiple groups.
* In ADUC( Active Directory Users and Computers) we can open it on windows to check all the users and groups on the system.  
* User Rights are permissions assigned to a given user.  
* Groups are a collection of users based on common attributes (generally work roles).  
* Permissions in Windows  
  * Full Control.
  * Modify.
  * Read & Execute.
  * List Folder Contents.
  * Read.
  * Write.  
* Permissions in Linux  
  * Read.
  * Write.
  * Execute.  
* These permissions can be assigned to Owners (U), Groups (G), and all users (O or A).  
* In linux we have `chmod` which is a program that is used to change the persmissions or rights of a file or folder using a shorthand number system.  
* The shorthand numbering system  
  * Read R : 4.
  * Write W : 2.
  * Execute X : 1.  
* Privilege Creep  
  * Occurs when a user get additional persmission over time as they rotate through different positions or roles.  
  * It violates the principles of least privilege.  
  * Permissions creeped up over time.  
  * To prevent privilege creeping we use *User Access Recertification* which is the process where each user's rights and persimssion are revalidated to ensure they are correct.  
  * When someone gets hired, fired or promoted this should trigger a User Access Recertification.

## 177. Permissions  

* Inheritance  
  * Whenever a new folder is created it inherits the permissions of it's parent folder.  
  * Any permissions added/removed from the parent folder will pass to the child by default too. 


* Propagation  
  * Occurs when permissions are passed to a subfolder from the parent through inheritance.  
  * We can disable inheritance.  
  * Use groups for roles and do not assign users directly to a folder's permissions.

* If you copy a folder, then persmissions are inherited from the parent folder it's copied into.  

* If you move a folder, then persmissions are retained from its original permissions.

## 178. Usernames and Passwords  

* Strong Passwords  
  * Contain uppercase letters, lowercase letters, numbers, special characters, and at least 8 characters or more ( preferably 14 or more).
   

* Six key tips for keeping your usernames and passwords secure  
  1. Always require the user to change thedefault password when the account is created.  
  2. Require that the password is changed frequently (every 90 days).
  3. Always change the default administrator or root password (by default in Windows the password for the administrator is NOTHING). 
  4. Disable the Guest account on your system (in windows).
  5. Enable `ctrl + alt + del` for logging into the system (In Windows).  
  6. Use good, strong policies in regards to your passwords.   

## 180. User Account Control  
* Def. It's a security component in Windows that keeps every user in standard user mode instead of acting like an administrative user (only exception is the administrator account).
* Disabling the administrator account is advised.
* How does that benefit us?  
  1. Eliminates unnecessary admin-level reqeuest for Windows resources. 
  2. Reduces risk of malware using admin-level privileges to cause system issues.  

* We can disable UAC from the control panel (but it's not advised to do so).