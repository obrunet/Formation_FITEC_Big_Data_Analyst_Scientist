"""la légende raconte que Jules César transmettait ses messages en décalant chaque lettre de 3 positions : A devient D,
B devient E, ...X devient A, écrire un programme que crypte un message"""

s = "ABCdef123"
for i, c in enumerate(s):
    ord_c = ord(c)
    # number
    if 48 <= ord(c) <= 57:
        ord_c += 3
        if ord_c > 57: ord_c -= 10
    # uppercase
    elif 65 <= ord(c) <= 90:
        ord_c += 3
        if ord_c > 90: ord_c -= 26
    # lowercase
    elif 97 <= ord(c) <= 122:
        ord_c += 3
        if ord_c > 122: ord_c -= 26
    else:
        print('special char !')
    # replace char
    s = s[:i] + chr(ord_c) + s[i+1:]

print(s)