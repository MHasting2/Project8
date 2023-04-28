#Pre: size is an exponent, as in 2^size.
#Post: program returns a large primes, p and a primitive root, g mod p
def param_gen(size):
    p = random_prime(2^size-1,False,2^(size-1))
    g = primitive_root(p)
    return p, g

#Pre: p, g are returned by param_gen
#Post: Returns computed A and and variable a, as defined in class and in McAndrew
def Alice(p,g): 
    a = randint(1, p-1)  # Choose a random number a between 1 and p-1
    A = power_mod(g, a, p)  # Compute A = g^a mod p
    return A, a

#Pre: p, g are returned by param_gen
#Post: Returns computed B and variable b as  defined in class and in McAndrew
def Bob(p,g):
    b = randint(1, p-1)  # Choose a random number b between 1 and p-1
    B = power_mod(g, b, p)  # Compute B = g^b mod p
    return B, b

#Pre: p is returned by param_gen, a by Alice, and B by Bob
#Post: Returns kalice as defined in class and in McAndrew
def Alice_Key(p,a,B):
    return power_mod(B, a, p)

#Pre: p is returned by param_gen, b by Bob, and A by Alice
#Post: Returns kBob as defined in class and in McAndrew
def Bob_Key(p,b,A):
    return power_mod(A, b, p)
    
peegee = param_gen(20)
p = peegee[0]
g = peegee[1]
ali = Alice(p,g)
bob = Bob(p,g)

print("kAlice: " + str(Alice_Key(bob[0], ali[1], p)))
print("kBob: " + str(Alice_Key(ali[0], bob[1], p)))
