# final_pipeline

# --------------------------------------------
dataset
	-> palissy, departements, cities
	hdfs
		-> metastore (hive)
		migration impala



	Hbase -> CF (ojbetdart + codepostal + departement)
		mapping d'impala
# --------------------------------------------


# 1) dataset in HDFS
ls src/cloudera-quickstart-vm-5.13.0-0-beta-docker/
hdfs dfs -put src/cloudera-quickstart-vm-5.13.0-0-beta-docker/departments.csv ./
hdfs dfs -put src/cloudera-quickstart-vm-5.13.0-0-beta-docker/palissy-MH-valid.csv ./
hdfs dfs -put src/cloudera-quickstart-vm-5.13.0-0-beta-docker/cities ./
hdfs dfs -put src/cloudera-quickstart-vm-5.13.0-0-beta-docker/cities.csv ./
hdfs dfs -ls
# or in HUE file browser / upload -> put file in root of /warehouse in case of trouble of permissions and chmod


# 2) create table with hive from files with '+''
# 3) with impala : migration = 'update' of table list
metastore invalidate data & recreate index





# 4) on hbase : create table 
create 'monuments', 'columns names according to sql request'
list				# to check




# 5) on hive, beware the two names should match
CREATE EXTERNAL TABLE monuments (id int, name string)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf:nom")
TBLPROPERTIES ("hbase.table.name" = "monuments");

# the monuments table should have appeared in HUE
# a the columns family should match ! 





# 6) join request on hive / HUE
INSERT INTO monuments (id, name)
SELECT p.edif, p.deno, p.matr, p.tico, d.code, d.slug, c.id
FROM palissy_parquet p 
INNER JOIN departments_parquet d on p.dpt = d.code
INNER JOIN cities_parquet c on c.department_code = d.code



