# <span style="color:[COLOR]">Machine #26 Late</span>  



## <span style="color:[COLOR]">Checklist 🤓   

- [x] Scan for other subdomains on `late.htb`.
- [x] Check if there are exploits for `python-tesseract` because the website might be using it
- [x] Gobuster the root `late.htb` for hidden directories.
- [x] Gobuster `images.late.htb` for hidden directories.
- [ ] If the images are stored somewhere and I find that somewhere and was able to open them. Maybe then I can execute a shell if I inject it into the image file.
- [ ] The website states that there are "Utilities" but I can only see one. Is that normal?
- [ ] Maybe I can name the image a path but I'm not sure how much this would be useful.
- [ ] There is a possibility of Server-Side Template Injection (SSTI)

<br/><br/>


## <span style="color:[COLOR]">What Do We Have? 🤔🤔 

* Python backend because the `image.late.htb` page says "with Flask" which is a Python Microframework.   
<img src="images.late.htb.png">

* When I uploaded an image and "converted it into text" it gave me what seems to be an html code `<p></p>`
* It might be using this library `Python-tesseract` to convert the images into words. It's an optical character recognition tool (OCR) for python that takes characters in an image and puts them into a text file. 
* There's a non-functioning `contact.html` page.
<br/><br/>


## <span style="color:[COLOR]">Random Notes👀

* It's not working to inject a shell in the image because when the tool reads the image it returns an error message that indicates that something's wrong with the image. Actually even if it executes an error msg the file could've been stored before before it seems that the python function that converts the images takes the image's path.
* I needed to find a way of executing it anyway.
* Got this error when I tried to insert an image with this code inside  
<img src="template-injection.png">  
Which means I'm getting somewhere.
<br/><br/>  


## <span style="color:[COLOR]">How Did I Own This Shit 😎🥳  

<br/><br/>



## <span style="color:[COLOR]">Where I Got Stuck?😡😧  


<br/><br/>



## <span style="color:[COLOR]">What Did I learn from this Machine?👀  


<br/><br/>



## <span style="color:[COLOR]">Writeups ✍🏽📓   


<br/><br/>

<!-- @nested-tags:EXAMPLE/OF/NESTED/TAGS-->   

