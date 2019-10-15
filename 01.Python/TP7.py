"""
Deviner mon nombre
Le jeu consiste à deviner un nombre entre 1 et 100 chois aléatoirement par le programme.
Le joueur dispose de 5 essais pour deviner le nombre, à chquae fois le proframme signalesi le nombre saisi est plus grand,
plus petit, ou s'il a trouvé le nombre.
"""

from random import randint

nb_to_guess, nb_attempt = randint(0, 100), 0
while nb_attempt <= 5:
    nb_attempt += 1
    user_guess = int(input(f"Try to guess the program's number between 0 and 100 - attempt #{nb_attempt} : "))
    if nb_attempt == 5 and user_guess != nb_to_guess:
        print("You loose !")
        nb_attempt += 1
    elif user_guess < nb_to_guess:
        print("Try a higher number !")
    elif user_guess > nb_to_guess:
        print("Try a lower number !")
    else:
        print("You win !")
        break
