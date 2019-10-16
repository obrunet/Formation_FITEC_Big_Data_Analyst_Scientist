class Point:
    """Classe caractérisée par ses coordonnées : abscisse et ordonné"""
    def __init__(self, x=0, y=0):
        self.x, self.y = x, y

    def get_abscisse(self):
        return self.x

    def get_ordonnee(self):
        return self.y

    def set_abscisse(self, new_x):
        self.x = new_x

    def set_ordonnee(self, new_y):
        self.y = new_y

    def distance(self, point_p):
        return round(((self.x - point_p.x)**2 + (self.y - point_p.y)**2)**0.5, 4)

    def is_identique(self, point_p):
        return self.x == point_p.x and self.y == point_p.y

    def affiche(self):
        print(f"Coordonnées du point : x = {self.x}, y = {self.y}")


class Segment:
    """Classe Segment caractérisée le point d’origine et le point d’extrémité"""
    def __init__(self, point_origin=Point(), point_end=Point()):
        self.point_origin, self.point_end = point_origin, point_end

    def get_extremite(self):
        return self.point_end

    def get_origin(self):
        return self.point_origin

    def set_extremite(self, point_end):
        self.point_end = point_end

    def set_origin(self, point_origin):
        self.point_origin = point_origin

    def longueur(self):
        return self.point_origin.distance(self.point_end)

    def get_milieu(self):
        return Point(x=round((self.point_end.x + self.point_origin.x)/2, 4), y=round((self.point_end.y + self.point_origin.x)/2, 4))

    def affiche(self):
        print("Infos sur le segment\nOrigine :")
        self.point_origin.affiche()
        print("Extrémité : ")
        self.point_end.affiche()


class Quadrilatere:
    """Classe Rectangle caractérisée par deux diagonales D1 et D2"""

    def __init__(self, diag1=Segment(), diag2=Segment()):
        self.diag1, self.diag2 = diag1, diag2

    def get_diag_1(self):
        return self.diag1

    def get_diag_2(self):
        return self.diag2

    def set_diag_1(self, diag1=Segment()):
        self.diag1 = diag1

    def set_diag_2(self, diag2=Segment()):
        self.diag2 = diag2

    def is_parallelogramme(self):
        m1, m2 = self.diag1.get_milieu(), self.diag2.get_milieu()
        return m1.is_identique(m2)

    def is_rectangle(self):
        return self.diag1.get_milieu() == self.diag2.get_milieu() and self.diag1.longueur() == self.diag2.longueur()

    def affiche(self):
        print("Infos sur le rectangle\nDiagonale 1 : ")
        self.diag1.affiche()
        print("Diagonale 2 : ")
        self.diag2.affiche()


def infos_quad(quad):
    """Affiche les longueurs des diag et les milieux ainsi que si parallelogramme ou rectangle"""
    print(f"longueur de la diag 1 = {quad.diag1.longueur()} et de la diag 2 = {quad.diag2.longueur()}")
    #print(f"milieu diag 1 {quad.diag1.get_milieu().affiche()} / milieu diag 2 {quad.diag2.get_milieu().affiche()}")
    if quad.is_parallelogramme():
        print("C'est un parallelogramme !")
    else:
        print("Ce n'est pas un parallelogramme...")
    if quad.is_rectangle():
        print("C'est un rectangle !")
    else:
        print("Ce n'est pas un rectangle...")


# 1er test
origin_1, origin_2 = Point(2, 2), Point(1, 1)
end_1, end_2 = Point(4, -1), Point(5, 0)
d_1, d_2 = Segment(origin_1, end_1), Segment(origin_2, end_2)
quad = Quadrilatere(d_1, d_2)
infos_quad(quad)


#origin_1.affiche()
#segment_1.affiche()
#rect.affiche()


# 2ème test
origin_1, origin_2 = Point(1, 0), Point(3, 0)
end_1, end_2 = Point(3, 5), Point(1, 5)
seg_1, seg_2 = Segment(origin_1, end_1), Segment(origin_2, end_2)
q = Quadrilatere(seg_1, seg_2)
infos_quad(q)