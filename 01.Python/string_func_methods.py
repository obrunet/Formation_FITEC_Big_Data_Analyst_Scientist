s = "   this is a long long string motherf*ckaz   "
print(s)
print(s.strip())
print(s.replace(" ", "-"))

l = s.split(" ")
print(l)

print("\\".join(l))

print(s.find("i"))

print(s.replace("i", "XXX"))

