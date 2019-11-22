"""
Définir la classe Rectangle caractérisée par deux diagonales D1 et D2, et les méthodes :
- le constructeur pour initier l'objet
- getDiagonale1() qui retourne la 1ère diagonale D1 du quadrilatère
- getDiagonale2() qui retour la 2ème D2
- setDiagonale1(D) qui permet de modifier la 1ère diag
- setDiagonale2(D) qui permet de modifier la 2ème diag
- is_parallelogramme() qui retourne True si le quadrilatère en cours est un parallélogramme sinon False
- is_rectangle() qui retourne True si un rectangle
- affiche() qui affiche les informations relatives au quadrilatère en cours
"""


class Point():
    """Classe d'un point à partir de ses coordonnées x & y"""

    def __init__(self, x, y):
        self.x, self.y = x, y


class quadri():
    """Classe d'un quadrilatère à pratir de 4 points"""

    def __init__(self, p1, p2, p3, p4):
        self.p1, self.p2, self.p3, self.p4 = p1, p2, p3, p4
        self.diag1, self.diag2 = self.get_diag_1(), self.get_diag_2()

    def get_diag_1(self):
        self.diag1 = (self.p3.x-self.p1.x, self.p3.y-self.p1.y)
        return self.diag1

    def get_diag_2(self):
        self.diag2 = (self.p4.x-self.p2.x, self.p4.y-self.p2.y)
        return self.diag2

    def set_diag_1(self, new_diag):
        center_diag_2 = Point(self.p4.x-self.p2.x, self.p4.y-self.p2.y)############ unfinished
