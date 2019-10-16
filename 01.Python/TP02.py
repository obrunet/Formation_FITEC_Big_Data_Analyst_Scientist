"""Ecrivez un programme qui calcule l'aire et le périmètre d'un carré à partir de la longueur du côté.
Ecrivez un programme qui calcule l'aire et le périmètre d'un rectanble à partir des longueur et largeur.
Ecrivez un programme qui calcule l'aire et le périmètre d'un cercle à partir de la longueur du rayon.

lancer ces programmes de différentes manières :
- depuis la console
- à l'aide d'un double clic"""

from math import pi

def square(a):
    """calcule l'aire et le périmètre d'un carré à partir de la longueur du côté"""
    return 4*a, a**2

def rectangle(a, b):
    """calcule l'aire et le périmètre d'un rectanble à partir des longueur et largeur"""
    return (a+b)*2, a*b

def circle(r):
    """calcule l'aire et le périmètre d'un cercle à partir de la longueur du rayon"""
    return 2*pi*r, pi*r**2


a, b, r = 5, 9, 17
print(f"Square of side a = {a}, perimeter = {square(a)[0]}, area = {square(a)[1]}")
print(f"Rectangle of sides a = {a} and b = {b}, perimeter = {rectangle(a, b)[0]}, area = {rectangle(a, b)[1]}")
print(f"Square of radius r = {r}, perimeter = {circle(r)[0]:.2f}, area = {circle(r)[1]:.2f}")