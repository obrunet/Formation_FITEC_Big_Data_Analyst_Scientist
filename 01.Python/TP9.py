"""
Parcourir les nombres de 0 jusqu'à 10, avec :
Pour chaque itération : afficher "j'affiche quelque chose"
si le compteur vaut 5 : afficher "j'affiche autre chose"
si le compteur vaut 7 : interrompre la boucle en affichant "arrêt prématuré"
"""

for i in range(10):
    if i == 5:
        print("j'affiche autre chose")
    elif i == 7:
        print("arrêt prématuré")
        break
    else:
        print("j'affiche quelque chose")