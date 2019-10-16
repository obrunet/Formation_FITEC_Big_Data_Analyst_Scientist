"""Ecrivez un comparateur python qui affiche le nombre le plus grand de cinq nombres réels saisis par l'utilisateur
exemple: - Entrer 5 nombres : 1, 2, 3, 4 ,5
         - maximum (1, 2, 3, 4 ,5) = 5"""

while True:
    user_input = input("Type 'exit' to quit or enter 5 integers - for instance 1, 2, 3, 4 ,5 : \n")
    if user_input == 'exit':
        print('Have a nice day !')
        break
    user_input = [int(i) for i in user_input.replace(' ', '').split(',')]

    print("You've entered", user_input)
    print(f"The maximum is {max(user_input)} with the max() function")

    user_max = 0
    for i in user_input:
        if i > user_max: user_max = i
    print(f"The maximum is {user_max} with the a loop")