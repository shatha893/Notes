# <span style="color:#009688">Tools --*git*--</span> 

## <span style="color:#009688"> Some Notes  

### <span style="color:#009688"> Found a `.git` Directory  

* We open the `.git/HEAD` directory which should have a reference to a `master` file `.git/refs/heads/master` which points to the object that stores the directory tree. Then we examine the tree object and open it's contents to find out what is the nature of all the other objects.

<br/><br/><br/><br/>

## <span style="color:#009688">Normal Usage  
 
* `git show`  could be used to view the git objects.  

<br/><br/>
* How to create a local git repository:
  1. Navigate to the root directory of the project.
  2. Initialize the local directory as a git repository `git init -b main`.
  3. Stage and commit all files on the project `git add . && git commit -m "initial commit"`.
  4. Create a respository on github using this command `gh repo create`. 
  5. You can download this command on a Debian based OS by doing the following      
     ```
     curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
     echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
     sudo apt update
     sudo apt install gh
     ```  
  6. Follow the interactive prompt until you successfully create a remote respository.
  7. Then to commit changes we can use `git add .` 
  8. Then commit the files that were staged with `git commit -m "First commit"`.
  9. Then use this `git remote add origin [REMOTE URL]` and `git remote -v` to make sure the command before it worked correctly.
  10. And finally `git push origin main` to push the changes.  

<br/><br/>

* If we add anything to the repository we have to:  
  * First stage the changes with `git add .`.
  * Then commit them `git commit -m "Add existing file"`.
  * Then push them `git push origin your-branch`.
  
<br/><br/><br/><br/>

## <span style="color:#009688">Options/Flags/Switches  

<br/><br/>