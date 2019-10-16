class Satellite():
    """Classe modélisant des objets simulant des satellites artificiels lancés dans l'espace, autour de la terre"""

    def __init__(self, name, mass=100000, speed=0):
        self.name, self.mass, self.speed = name, mass, speed    # a string, in kg, in meter/sec.
        self.cinetic_energy = self.energy()

    def impulsion(self, force, time):
        """Update speed considering force & time"""
        self.speed += force * time / self.mass                  # in daN, s, kg

    def display_speed(self):
        """Display name and current speed"""
        print(f"Satellite's name : {self.name}, and speed : {self.speed}")

    def energy(self):
        """Calculate cinetic energy Ec = 1/2 * m * v**2"""
        self.cinetic_energy = self.mass * self.speed **2 / 2
        return self.cinetic_energy


print(Satellite.__doc__)
sat_1 = Satellite('Sat1', 250, 10)
print(sat_1.__dict__)

sat_1.impulsion(500, 15)
sat_1.display_speed()
print(f"Current cinetic energy = {sat_1.energy():.0f}")

sat_1.impulsion(500, 15)
sat_1.display_speed()
print(f"Current cinetic energy = {sat_1.energy():.0f}")

sat_2 = Satellite('Sat2')
sat_2.display_speed()
print(f"Current cinetic energy = {sat_2.energy():.0f}")
sat_2.impulsion(500, 15)
sat_2.display_speed()
print(f"Current cinetic energy = {sat_2.energy():.0f}")


