"""
Calcul de la note moyenne :
Programme qui demande à l'utilisateur de saisir 5 notes puis il affiche leur moyenne ainsi qua la note minimale et la note maximale.

Variété : affecter un coefficient à chaque note
Exemple d'éxécution :
>> Veuillez entrer la note n°1: 12
>> Veuillez entrer la note n°2: 23
>> Attention une note est comprise entre 0 et 20
>> Veuillez entrer la note n°2: 10
>> Veuillez entrer la note n°3: 8
>> Veuillez entrer la note n°4: 9
>> Veuillez entrer la note n°5: 13
>> La moeyenne des notes est 10.4
>> La note minimale est 8.0
>> La note maximale est 13.0
"""


def notation_mean():
    """Ask the user to enter 5 notations between 0 and 20, then print mean, min & max"""
    l, nb_notes = [], 1

    while True:
        current_note = int(input(f"Enter the notation n°{nb_notes} : "))
        if current_note not in range(21):
            print("Beware, the notation should stay between 0 and 20 !")
            continue
        else:
            l.append(current_note)
            nb_notes += 1   # inc for next notation
            if nb_notes > 5: break

    print("The notations entered by the user are : ", l)
    print(f"The mean is equal to {sum(l)/len(l)}, the min is : {min(l)}, and the max is : {max(l)}")


def weighted_notation_mean():
    """Ask the user to enter 5 notations with a weight for each, then print mean, min & max"""
    nb_notes, notations, weights = 1, [], []

    while True:
        user_input = input(f"Enter the notation n°{nb_notes} with its weight in the form 'n, w' : ")
        user_input = [int(i) for i in user_input.replace(' ', '').split(',')]
        n, w = tuple(user_input)        # equivalent to   n, w = user_input[0], user_input[1]

        if n not in range(21):
            print("Beware the notation should be between 0 and 20 !")
            continue
        else:
            notations.append(n)
            weights.append(w)
            nb_notes += 1
            if nb_notes > 5: break

    print("The notations entered by the user are : ", notations, " the weights are : ", weights)
    weighted_sum = 0
    for i in range(len(notations)):
        weighted_sum += notations[i] * weights[i]
    print(f"The weighted mean is equal to {weighted_sum/sum(weights):.2f}, the min is : {min(notations)}, and the max is : {max(notations)}")


notation_mean()
weighted_notation_mean()