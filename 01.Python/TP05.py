"""
Traitement des doublons:
Ecrire une fonction supprimer_doublon(liste) qui supprime tous les doublons d'une liste sans ajouter des listes supplémentaires
Element de solution : pop

Exemple d'exécution:
>> L=[1, 2, 5, 8, 6, 2, 5, 9, 1, 8, 8]
>> supprimer_doublon(L)
[1, 2, 5, 8, 6, 9]
"""

l = [1, 2, 5, 8, 6, 2, 5, 9, 1, 8, 8]


# ----------- 1st solution with set  -----------
print("First solution with set : ", list(set(l)))


# ----------- 2nd solution with a loop  -----------
l = sorted(l)
i, ln = 0, len(l)
while i < (ln-1):
    if l[i] == l[i+1]:
        l.pop(i)
        ln = len(l)
    i += 1
print("Second solution with a while loop and pop", l)


# ----------- 3rd solution with an exception -----------
l = [1, 2, 5, 8, 6, 2, 5, 9, 1, 8, 8]
l = sorted(l)
for i in range(1, len(l)):
    try:
        if l[i-1] == l[i]:
            l.pop(i)

    except IndexError:
        break
print("Third solution with an exception", l)