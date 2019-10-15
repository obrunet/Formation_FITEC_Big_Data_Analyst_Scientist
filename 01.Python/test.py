a = 10
b = a
print(a is b)
print(id(a), id(b))
a = 20
print(a, b)
print(a is b)
print(id(a), id(b))



print('\n')
a = b = 333
print(a is b)
print(id(a), id(b))

a += 444
print(a, b)
print(a is b)
print(id(a), id(b))