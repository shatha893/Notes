* In a regular Redis instance you can just connect using nc or you could also use redis-cli.

* <blockquote>
  but you have to keep in mind that it can also implement ssl/tls.
  </blockquote>  

* When first connecting to a redis service we want to provide the command `info`.  
* If after providing the `info` command you get this message *-NOAUTH Authentication required* then you need to first authenticate other than that you're good, I guess.


## Accessing redis with `redis-cli`  

### The option `-x`  

<blockquote>
Instead, the -x option was specified and a file was redirected to the CLI's standard input. So the input was read, and was used as the final argument for the command. This is useful for scripting.
</blockquote>