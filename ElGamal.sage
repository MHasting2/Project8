Pre: size is an exponent, as in 2^size.
Post: program returns El Gamal parameters, large prime, p and primitive root, a mod p as defined in class and in McAndrew
param_gen(size)

Pre: p and a are returned by param_gen
Post: returns private key, A, and public key, B as defined in class and in McAndrew
key_gen(p,a)



Pre: p and a are the returned by parem_gen. A is your private key
Post: returns r and S as defined in class and in McAndrew
sign(p, a, A )

From the problem 6:
#transforms msg_in to a base 256 integer which it then returns
txt_to_num(msg_in)

#transforms a base 256 integer to a string which it then returns
num_to_text(num_in)
