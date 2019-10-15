def calc():
	"""Simulates the behavior of a simple calc.exe, user provides 2 operators and 1 operation, the func returns the result"""
	def add(a, b): return a + b
	def sub(a, b): return a - b
	def mul(a, b): return a * b
	def div(a, b): return a / b
	operation_dict = {'+': add, '-': sub, '*': mul, '/': div}
	operande_1 = float(input("Entrer l'opérande 1: "))
	while True:
		operation = input("Entrer l'opération '+', '-', '*', '/': ")
		print(operation)
		if operation in  operation_dict.keys():
			break
		else:
			print('Entrer une opération dans la liste')
	operande_2 = float(input("Entrer l'opérande 2: "))
	print(f"Le resultat de l opération {str(operande_1) + operation + str(operande_2) + ' ='}", operation_dict[operation](operande_1, operande_2))

print(calc.__doc__)
calc()
