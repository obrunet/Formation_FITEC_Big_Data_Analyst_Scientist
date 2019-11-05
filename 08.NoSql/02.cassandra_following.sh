cqlsh:ecole> select * from cours ;

 idcours | coeff | intitule                            | nbheuresmax | niveau | responsable
---------+-------+-------------------------------------+-------------+--------+-------------
       1 |     3 |   Introduction aux bases de donnees |          10 |     M1 |           1
       2 |     2 |        Immeubles de grandes hauteur |          30 |     M1 |           4
       3 |     2 | Production et distribution de biens |          30 |     M1 |           5



# --------------------- set --------------------- 

cqlsh:ecole> ALTER TABLE cours ADD (emails set<text>);
cqlsh:ecole> select * from cours ;

 idcours | coeff | emails | intitule                            | nbheuresmax | niveau | responsable
---------+-------+--------+-------------------------------------+-------------+--------+-------------
       1 |     3 |   null |   Introduction aux bases de donnees |          10 |     M1 |           1
       2 |     2 |   null |        Immeubles de grandes hauteur |          30 |     M1 |           4
       3 |     2 |   null | Production et distribution de biens |          30 |     M1 |           5


cqlsh:ecole> INSERT INTO cours (idcours, coeff, emails, intitule, nbheuresmax, niveau, responsable) VALUES (3, 4, {'test@yahoo.fr', 'bla@gmai.com'}, 'blabla', 50, 'M2', 4);
cqlsh:ecole> select * from cours ;

 idcours | coeff | emails                            | intitule                          | nbheuresmax | niveau | responsable
---------+-------+-----------------------------------+-----------------------------------+-------------+--------+-------------
       1 |     3 |                              null | Introduction aux bases de donnees |          10 |     M1 |           1
       2 |     2 |                              null |      Immeubles de grandes hauteur |          30 |     M1 |           4
       3 |     4 | {'bla@gmai.com', 'test@yahoo.fr'} |                            blabla |          50 |     M2 |           4

cqlsh:ecole> UPDATE cours SET emails = emails + {'nomail@gmail.com', 'test@yahoo.fr'} WHERE idcours = 2;
cqlsh:ecole> select * from cours ;

 idcours | coeff | emails                                | intitule                          | nbheuresmax | niveau | responsable
---------+-------+---------------------------------------+-----------------------------------+-------------+--------+-------------
       1 |     3 |                                  null | Introduction aux bases de donnees |          10 |     M1 |           1
       2 |     2 | {'nomail@gmail.com', 'test@yahoo.fr'} |      Immeubles de grandes hauteur |          30 |     M1 |           4
       3 |     4 |     {'bla@gmai.com', 'test@yahoo.fr'} |                            blabla |          50 |     M2 |           4




# --------------------- list --------------------- 

cqlsh:ecole> ALTER TABLE cours ADD places list<text>;
cqlsh:ecole> UPDATE cours SET places = ['Paris', 'Lyon'] WHERE idcours  = 1;
cqlsh:ecole> select * from cours ;

 idcours | coeff | emails                                | intitule                          | nbheuresmax | niveau | places            | responsable
---------+-------+---------------------------------------+-----------------------------------+-------------+--------+-------------------+-------------
       1 |     3 |                                  null | Introduction aux bases de donnees |          10 |     M1 | ['Paris', 'Lyon'] |           1
       2 |     2 | {'nomail@gmail.com', 'test@yahoo.fr'} |      Immeubles de grandes hauteur |          30 |     M1 |              null |           4
       3 |     4 |     {'bla@gmai.com', 'test@yahoo.fr'} |                            blabla |          50 |     M2 |              null |           4

(3 rows)
cqlsh:ecole> UPDATE cours SET places[1] = 'Marseille' WHERE idcours = 1;
cqlsh:ecole> select * from cours ;

 idcours | coeff | emails                                | intitule                          | nbheuresmax | niveau | places                 | responsable
---------+-------+---------------------------------------+-----------------------------------+-------------+--------+------------------------+-------------
       1 |     3 |                                  null | Introduction aux bases de donnees |          10 |     M1 | ['Paris', 'Marseille'] |           1
       2 |     2 | {'nomail@gmail.com', 'test@yahoo.fr'} |      Immeubles de grandes hauteur |          30 |     M1 |                   null |           4
       3 |     4 |     {'bla@gmai.com', 'test@yahoo.fr'} |                            blabla |          50 |     M2 |                   null |           4
cqlsh:ecole> UPDATE cours SET places = places + ['Bordeaux'] WHERE idcours = 1;
cqlsh:ecole> select * from cours ;

 idcours | coeff | emails                                | intitule                          | nbheuresmax | niveau | places                             | responsable
---------+-------+---------------------------------------+-----------------------------------+-------------+--------+------------------------------------+-------------
       1 |     3 |                                  null | Introduction aux bases de donnees |          10 |     M1 | ['Paris', 'Marseille', 'Bordeaux'] |           1
       2 |     2 | {'nomail@gmail.com', 'test@yahoo.fr'} |      Immeubles de grandes hauteur |          30 |     M1 |                               null |           4
       3 |     4 |     {'bla@gmai.com', 'test@yahoo.fr'} |                            blabla |          50 |     M2 |                               null |           4




# --------------------- maps --------------------- 

cqlsh:ecole> UPDATE cours SET todo = {'2012-9-24': 'enter mordor', '2012-10-2': 'throw ring into mound doom'} WHERE idcours = 3;
cqlsh:ecole> select * from cours ;

 idcours | coeff | emails                                | intitule                          | nbheuresmax | niveau | places                             | responsable | todo
---------+-------+---------------------------------------+-----------------------------------+-------------+--------+------------------------------------+-------------+----------------------------------------------------------------------------------------------------------------------
       1 |     3 |                                  null | Introduction aux bases de donnees |          10 |     M1 | ['Paris', 'Marseille', 'Bordeaux'] |           1 |                                                                                                                 null
       2 |     2 | {'nomail@gmail.com', 'test@yahoo.fr'} |      Immeubles de grandes hauteur |          30 |     M1 |                               null |           4 |                                                                                                                 null
       3 |     4 |     {'bla@gmai.com', 'test@yahoo.fr'} |                            blabla |          50 |     M2 |                               null |           4 | {'2012-09-24 00:00:00.000000+0000': 'enter mordor', '2012-10-02 00:00:00.000000+0000': 'throw ring into mound doom'}

(3 rows)
cqlsh:ecole> DELETE todo['2012-9-24'] FROM cours WHERE idcours = 3;
cqlsh:ecole> select * from cours ;

 idcours | coeff | emails                                | intitule                          | nbheuresmax | niveau | places                             | responsable | todo
---------+-------+---------------------------------------+-----------------------------------+-------------+--------+------------------------------------+-------------+-------------------------------------------------------------------
       1 |     3 |                                  null | Introduction aux bases de donnees |          10 |     M1 | ['Paris', 'Marseille', 'Bordeaux'] |           1 |                                                              null
       2 |     2 | {'nomail@gmail.com', 'test@yahoo.fr'} |      Immeubles de grandes hauteur |          30 |     M1 |                               null |           4 |                                                              null
       3 |     4 |     {'bla@gmai.com', 'test@yahoo.fr'} |                            blabla |          50 |     M2 |                               null |           4 | {'2012-10-02 00:00:00.000000+0000': 'throw ring into mound doom'}

(3 rows)
cqlsh:ecole> SELECT coeff, emails, todo FROM cours WHERE idcours = 3;

 coeff | emails                            | todo
-------+-----------------------------------+-------------------------------------------------------------------
     4 | {'bla@gmai.com', 'test@yahoo.fr'} | {'2012-10-02 00:00:00.000000+0000': 'throw ring into mound doom'}




# --------------------- user's types --------------------- 

cqlsh:ecole> select  * from enseignant;

 idenseignant | nom     | prenom  | status
--------------+---------+---------+-----------
            1 | Travers | Nicolas | Vacataire
            2 | Mourier | Pascale | Titulaire

cqlsh:ecole> CREATE TYPE administratif (num_secu int, num_enseign set<int>, salaire float);
cqlsh:ecole> ALTER TABLE enseignant ADD admin adiministratif;
cqlsh:ecole> INSERT INTO enseignant (idenseignant, admin) VALUES (55, {num_secu: 151, num_enseign: {151, 152}, salaire: 150000.2});
cqlsh:ecole> select  * from enseignant;

 idenseignant | admin                                                      | nom     | prenom  | status
--------------+------------------------------------------------------------+---------+---------+-----------
           55 | {num_secu: 151, num_enseign: {151, 152}, salaire: 1.5e+05} |    null |    null |      null
            1 |                                                       null | Travers | Nicolas | Vacataire
            2 |                                                       null | Mourier | Pascale | Titulaire

cqlsh:ecole> UPDATE enseignant SET admin = {num_secu: 1, num_enseign: {800, 900}, salaire: 200000.2} WHERE idenseignant = 2;
cqlsh:ecole> select * from enseignant ;

 idenseignant | admin                                                      | nom     | prenom  | status
--------------+------------------------------------------------------------+---------+---------+-----------
           55 | {num_secu: 151, num_enseign: {151, 152}, salaire: 1.5e+05} |    null |    null |      null
            1 |                                                       null | Travers | Nicolas | Vacataire
            2 |     {num_secu: 1, num_enseign: {800, 900}, salaire: 2e+05} | Mourier | Pascale | Titulaire


INSERT INTO enseignant JSON '{"idenseignant":5,"myinfo":{"numss":1,"numenseignant":2,"salaire":30000.0}, "nom":"Bernard", "prenom": "Albert", "status": "ok"}'; 

