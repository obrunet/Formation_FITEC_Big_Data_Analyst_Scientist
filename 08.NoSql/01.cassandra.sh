# load images of cassandra
sudo docker pull cassandra
sudo docker images

# run the image in a container
sudo docker run -d --name=CassandraDocker cassandra
docker ps -a

# launch the shell sh of cql (Cassandra Query Language)
docker exec -ti CassandraDocker cqlsh
> cqlsh


# _____________________________________________________


# create a base ie keyspace
cqlsh> CREATE KEYSPACE IF NOT EXISTS ecole
   ... WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor': 3 };



# create a table ie a column family
cqlsh> use ecole;

cqlsh:ecole> CREATE TABLE Cours ( 
	idCours INT, 
	Intitule VARCHAR, 
	Responsable INT, 
	Niveau VARCHAR, 
	nbHeuresMax INT, 
	Coeff INT, 
	PRIMARY KEY (idCours) );

cqlsh:ecole> CREATE INDEX fk_Enseignement_Enseignant_idx
	ON Cours ( Responsable);

cqlsh:ecole> CREATE TABLE Enseignant (  
         ... idEnseignant INT,
         ... Nom VARCHAR,
         ... Prenom VARCHAR,
         ... Status VARCHAR,
         ... PRIMARY KEY ( idEnseignant)
         ... );


# or CREATE TABLE ecole.Enseignant ( ... without "use" and in case cassandra don't recognize the keyspace

# infos on base
cqlsh:ecole> desc ecole


cqlsh:ecole> INSERT INTO Cours (idCours, Intitule, Responsable, Niveau, nbHeuresMax, Coeff)
         ... VALUES (1, 'Introduction aux bases de donnees', 1, 'M1', 30, 3);
cqlsh:ecole> INSERT INTO Cours (idCours, Intitule, Responsable, Niveau, nbHeuresMax, Coeff)
         ... VALUES (2, 'Immeubles de grandes hauteur', 4, 'M1', 30, 2);
cqlsh:ecole> INSERT INTO Cours (idCours, Intitule, Responsable, Niveau, nbHeuresMax, Coeff)
         ... VALUES (3, 'Production et distribution de biens', 5, 'M1', 30, 2);


cqlsh:ecole> INSERT INTO Enseignant (idEnseignant, Nom, Prenom, Status)
         ... VALUES (1, 'Travers', 'Nicolas', 'Vacataire');
cqlsh:ecole> INSERT INTO Enseignant (idEnseignant, Nom, Prenom, Status)
         ... VALUES (2, 'Mourier', 'Pascale', 'Titulaire');


cqlsh:ecole> select * from cours;

 idcours | coeff | intitule                            | nbheuresmax | niveau | responsable
---------+-------+-------------------------------------+-------------+--------+-------------
       1 |     3 |   Introduction aux bases de donnees |          30 |     M1 |           1
       2 |     2 |        Immeubles de grandes hauteur |          30 |     M1 |           4
       3 |     2 | Production et distribution de biens |          30 |     M1 |           5

(3 rows)
cqlsh:ecole> update cours set nbheuresmax=10 where idcours=1;
cqlsh:ecole> select * from cours;

 idcours | coeff | intitule                            | nbheuresmax | niveau | responsable
---------+-------+-------------------------------------+-------------+--------+-------------
       1 |     3 |   Introduction aux bases de donnees |          10 |     M1 |           1
       2 |     2 |        Immeubles de grandes hauteur |          30 |     M1 |           4
       3 |     2 | Production et distribution de biens |          30 |     M1 |           5



cqlsh:ecole> delete from cours where idcours in (1, 2, 3, 4, 5);


cqlsh:ecole> ALTER TABLE enseignant ADD toto text;
cqlsh:ecole> select * from enseignant ;

 idenseignant | nom     | prenom  | status    | toto
--------------+---------+---------+-----------+------
            1 | Travers | Nicolas | Vacataire | null
            2 | Mourier | Pascale | Titulaire | null

(2 rows)
cqlsh:ecole> ALTER TABLE enseignant DROP toto;
cqlsh:ecole> select * from enseignant ;

 idenseignant | nom     | prenom  | status
--------------+---------+---------+-----------
            1 | Travers | Nicolas | Vacataire
            2 | Mourier | Pascale | Titulaire



