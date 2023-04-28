
#Pre: size is an exponent, as in 2^size.
#Post: program returns El Gamal parameters, large prime, p and primitive root, a mod p as defined in class and in McAndrew
def param_gen(size):
    p = random_prime(2^size-1,False,2^(size-1))
    a = primitive_root(p)
    return p,a

#Pre: p and a are returned by param_gen
#Post: returns private key, A, and public key, B as defined in class and in McAndrew
def key_gen(p,a):
    A = randint(1, p-1)
    B = power_mod(a, A, p)
    return A, B


#Pre: p and a are the returned by parem_gen. A is your private key
#Post: returns r and S as defined in class and in McAndrew
def sign(p, a, A, msg):
    r = randint(1, p-1)  
    h = txt_to_num(msg)
    S = (h - A*r) * power_mod(r, -1, p-1) % (p-1) 
    return r, S
    

###### Helper Functions ######
    
#Converts a string to a decimal digit sequence
#msg_in is a string
def txt_to_num(msg_in):      
  #transforms string to the indices of each letter in the 8-bit ASCII table
  #ex: "AB" becomes [65,66]
  msg_idx = list(map(ord,msg_in))

  #The integers in the list, since they are ASCII, are in the range 0..255
  #These are treated, collectively, as a base 256 integer, but from left to right
  #rather than right to left
  #This sequence of integers is converted to base 10 
  #ex: [65,66] = 65*256^0 + 66*256^1 = 16961
  num = ZZ(msg_idx,256)
  return num 

#Converts a digit sequence to a string
#num_in is a decimal integer, constructed from a string using txt_to_num 
def num_to_txt(num_in):
  #transforms the base 10 num_in to a list of base 256 digits. 256^0 is on the left 
  msg_idx = num_in.digits(256)

  #maps each index to its associated character in the ascii table 
  m = map(chr,msg_idx)

  #transforms the list to a string
  m = ''.join(m)
  return m


def main():
    msg = "Hello World!"
    m = txt_to_num(msg)
    print(m)
    params = param_gen(20)
    keys = key_gen(params[0], params[1])
    out = sign(params[0], params[1], keys[0], msg)
    
    print(out[0]) #r
    print(out[1]) #s
    print(params[0]) #p
    print(params[1]) #a

main()
