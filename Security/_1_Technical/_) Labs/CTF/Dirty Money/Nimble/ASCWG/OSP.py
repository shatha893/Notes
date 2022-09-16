from Crypto.Util.number import getPrime, long_to_bytes, bytes_to_long, isPrime
from string import printable, ascii_letters
from secret import FLAG
import os

secret = os.urandom(len(FLAG))

def OSP(plain, secret):
    assert len(plain) == len(secret), 'The length has to be idenntical!'
    ct = []
    p = getPrime(256)
    for f, k in zip(FLAG, secret):
        ct.append((f * p + k))
    return ct, p 

ct, p = OSP(FLAG, secret)
print(ct)




def isprime(num):
    for n in range(2,int(num**0.5)+1):
        if num%n==0:
            return False
    return True

arr = []
for i in range(0,2**256-1):
    if isprime(i):
        arr.append(i)

print(arr)