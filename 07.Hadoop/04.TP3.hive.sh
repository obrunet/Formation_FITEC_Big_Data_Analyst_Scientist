# in another terminal to connect to the running container 
docker exec -ti cloudera bash

# create folder for the table
hdfs dfs -mkdir /user/hive/warehouse/wh_visits
hdfs dfs -ls -R /user/hive/

# put the file in it
hdfs dfs -put /src/visits.txt /user/hive/warehouse/wh_visits
hdfs dfs -ls -R /user/hive/

# launch editor
vi wh_visits.hive

# script to create the table
CREATE TABLE wh_visits (
        lname string,
        fname string,
        time_of_arrival string,
        appt_scheduled_time string,
        meeting_location string,
        info_comment string )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t' ;

# launch the script
hive -f wh_visits.hive

# check by showing tables
hive> show tables;

# table description
hive> describe wh_visits;

# the table has been created from visits.txt automatically
hive> select * from wh_visits limit 20;

hive> select lname from wh_visits where lname like 'OME%' limit 20;

# nb of lines in db
hive> select count(*) from wh_visits;
21819

# nb of lines in file
hdfs dfs -cat /user/hive/warehouse/wh_visits/visits.txt | wc -l
21819

# 2 virtuals cols
hive> select INPUT__FILE__NAME, lname, fname FROM wh_visits WHERE lname LIKE 'Y%';
# hdfs://quickstart.cloudera:8020/user/hive/warehouse/wh_visits/visits.txt is the link to the information
hive> select BLOCK__OFFSET__INSIDE__FILE, lname, fname FROM wh_visits WHERE lname LIKE 'Y%';


# -------- create another simple table -------- 
hive> create table names (id int, name string)
    > row format delimited fields terminated by '\t';


hdfs dfs -put /src/names.txt /user/hive/warehouse/names
hdfs dfs  -ls /user/hive/warehouse/names
hive> select * from names;
hive> drop table names;
hdfs dfs -ls /user/hive/warehouse/names
#ls: `/user/hive/warehouse/names': No such file or directory


# -------- define an external db -------- 
hdfs dfs -put /src/names.txt /user/root/
hdfs dfs -mkdir /user/hivedemo

hive> create external table names (id int, name string)
    > ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
    > LOCATION '/user/hivedemo';

hive> load data inpath '/user/root/names.txt' into table names;
hive> select * from names;

# the file doesn't exist anymore
hdfs fs –ls /user/roo

# the file has been moved 
hdfs dfs -ls /user/hivedemo/

# warehouse doesn't contain a folder 
hdfs dfs -ls /user/hive/warehouse/

# delete table
hive> drop table names;

# the file is still there
hdfs dfs -ls /user/hivedemo/


--------------------------------------------------

Table interne :

- A la creation de la table interne le fichier est stocké dans le repertoire /user/hive/warehouse/nom_table
- Lors de la suppression de la table, le fichier et le répertoire créés dans warehouse seront aussi supprimés.

Table externe :

- Au moment du chargement de la table externe le fichier sera déplacé dans l’endroit ( localisation ) qu’on a spécifié à la création de la table.
- Lors de la suppression de la table, le fichier restera toujours dans location

--------------------------------------------------