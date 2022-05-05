# DNS Zone Transfer   

## What is `axfr`?  

<blockquote>
You can use different mechanisms for DNS zone transfer but the simplest one is AXFR (technically speaking, AXFR refers to the protocol used during a DNS zone transfer). It is a client-initiated request. Therefore, you can edit information on the primary DNS server and then use AXFR from the secondary DNS server to download the entire zone.
</blockquote>  

## AXFR Vulnerability   
* AXFR offers no authentication, so any client can ask a DNS server for a copy of the entire zone. 
  

## What is a zone?   
 

## Command to Use as a Client  

* On Linux we can use this command `dig axfr [DOMAIN] [NAMESERVER]`. I added the nameserver to the `resolv.conf` file and this way you can just write the command like this `dig axfr [DOMAIN]`