""""
Nombre d'Armstrong :
Un nombre de Armstrong est un entier positif égale à la somme des cubes de ses chiffres.
Exemple : 153 = 1³ + 5³ + 3³ = 1 + 125 + 27
1. Ecrire une fonction qui retourne True si ne est un nombre d'Armstrong sinon False
2. Ecrire la fonction nombres_armstrong(n) qui affiche tous les nombres inf ou égales à n
"""


def is_armstrong(n):
    """Return True if n is an Armstrong nb otherwise False"""
    sum, l = 0, [int(i) for i in list(str(n))]
    for i in l:
        sum += i**3
    if sum == n: return True
    return False


def armstrong_nb(n):
    """Print all Armstrong nb until n"""
    print(f'All Armstrong nb until n={n} are : ', end=' ')
    for i in range(n+1):
        if is_armstrong(i): print(i, end=' - ')


#print(is_armstrong.__doc__)
print(is_armstrong(153))
print(is_armstrong(158))
#print(armstrong_nb.__doc__)
armstrong_nb(100000) # 0 - 1 - 153 - 370 - 371 - 407