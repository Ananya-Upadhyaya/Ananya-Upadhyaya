from numpy import array
a=array([1,2,3,4,5,6]) # odds from here
b=array([7,8,9,10,11]) # evens from here


c = [*a[a%2 != 0], *b[b%2 == 0]]
print(c)
