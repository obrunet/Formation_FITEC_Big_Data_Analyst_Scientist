hdfs dfs -mkdir /user/hive/warehouse/batting
hdfs dfs -put /src/Batting.csv /user/hive/warehouse/batting
hdfs dfs -put /src/Master.csv /user/hive/warehouse/batting
hdfs dfs -ls -R /user/hive/warehouse/

hive>
create external table temp_batting ( playerID STRING, yearID INT, stint STRING,
teamID STRING, lgID STRING, G STRING, G_batting STRING, AB STRING, R INT, H STRING,
second_base STRING, third_base STRING, HR STRING, RBI STRING, SB STRING, CS STRING,
BB STRING, SO STRING, IBB STRING, HBP STRING, SH STRING, SF STRING, GIDP STRING,
G_old STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/hive/warehouse/demo';



insert overwrite table batting
SELECT tb.playerid,
	tb.yearid,
	tb.r
FROM temp_batting tb
JOIN
	(SELECT yearid y,
	max(r) AS runs
	FROM temp_batting
	GROUP BY yearid) my
		ON (tb.yearid=my.y
			AND tb.r=my.runs) ;


or 

hive> insert overwrite table batting
    > select tb.playerid,
    > tb.yearid,
    > tb.r
    > from temp_batting tb
    > join (select yearid y, max(r) as runs from temp_batting group by yearid) my
    > on (tb.yearid=my.y and tb.r=my.runs) ;


hive> select * from batting

dfs dfs -ls -R /user/hive/warehouse/
drwxr-xr-x   - root     supergroup          0 2019-10-29 13:52 /user/hive/warehouse/batting
-rwxr-xr-x   1 cloudera supergroup       2833 2019-10-29 13:52 /user/hive/warehouse/batting/000000_0

hive> select INPUT__FILE__NAME, player_id FROM batting WHERE runs > 150;
hive> drop table batting;
# the file is still there because it's an external db




hive> create table temp_master (col_value STRING);
hive> LOAD DATA INPATH '/user/hive/warehouse/demo/Master.csv' OVERWRITE INTO TABLE temp_master;
select * from temp_master
drop table temp_master;
# the file is deleted because it's an local db


# ----------------------------- PARTITIONS -----------------------------
create table names (id int, name string)
partitioned by (state string)
row format delimited fields terminated by '\t';


hive> load data local inpath '/src/hivedata_ca.txt' into table names partition (state = 'CA'); 
hive> load data local inpath '/src/hivedata_co.txt' into table names partition (state = 'CO'); 
hive> select * from names;

hive> show partitions names;
OK
state=CA
state=CO
state=SD

[root@quickstart /]# hdfs dfs -ls -R /user/hive/warehouse/names/
drwxrwxrwx   - cloudera supergroup          0 2019-10-29 15:05 /user/hive/warehouse/names/state=CA
-rwxrwxrwx   1 cloudera supergroup         22 2019-10-29 15:05 /user/hive/warehouse/names/state=CA/hivedata_ca.txt
drwxrwxrwx   - cloudera supergroup          0 2019-10-29 15:11 /user/hive/warehouse/names/state=CO
-rwxrwxrwx   1 cloudera supergroup         15 2019-10-29 15:11 /user/hive/warehouse/names/state=CO/hivedata_co.txt
drwxrwxrwx   - cloudera supergroup          0 2019-10-29 15:11 /user/hive/warehouse/names/state=SD
-rwxrwxrwx   1 cloudera supergroup          6 2019-10-29 15:11 /user/hive/warehouse/names/state=SD/hivedata_sd.txt


# hive has better performances
hive> select * from names where state = 'CA';
OK
1	Ulf	CA
2	Manish	CA
3	Brian	CA
Time taken: 0.359 seconds, Fetched: 3 row(s)






hive> create table names_bucket (id int, name string, state string)
    > clustered by (id) into 2 buckets;
    > load data local inpath '/src/hivedata_ca.txt' into table names_bucket;
hive> select * from names_bucket;
OK
NULL	NULL	NULL
NULL	NULL	NULL
NULL	NULL	NULL
Time taken: 0.106 seconds, Fetched: 3 row(s)

hive> insert into names_bucket select * from names where state ="CA";
hive> select * from names_bucket;
OK
1	Ulf	CA
2	Manish	CA
3	Brian	CA
NULL	NULL	NULL
NULL	NULL	NULL
NULL	NULL	NULL



[root@quickstart /]# hdfs dfs -ls -R /user/hive/warehouse/
drwxrwxrwx   - cloudera supergroup          0 2019-10-29 15:33 /user/hive/warehouse/names_bucket
-rwxrwxrwx   1 cloudera supergroup         32 2019-10-29 15:33 /user/hive/warehouse/names_bucket/000000_0
-rwxrwxrwx   1 cloudera supergroup         22 2019-10-29 15:31 /user/hive/warehouse/names_bucket/hivedata_ca.txt



hive> set hive.enforce.bucketing=true;
hive> insert overwrite table names_bucket select * from names;
[root@quickstart /]# hdfs dfs -ls -R /user/hive/warehouse/
drwxrwxrwx   - cloudera supergroup          0 2019-10-29 15:43 /user/hive/warehouse/names_bucket
-rwxrwxrwx   1 cloudera supergroup         34 2019-10-29 15:43 /user/hive/warehouse/names_bucket/000000_0
-rwxrwxrwx   1 cloudera supergroup         30 2019-10-29 15:43 /user/hive/warehouse/names_bucket/000001_0




# ----------------------------- Skewed Table -----------------------------

hdfs dfs -put /src/salaries.txt ./
hdfs dfs -mkdir /user/clouderademo


hive> drop table if exists salarydata;
hive> create external table salarydata (gender string, age int, salary double, zip int)
    > ROW FORMAT DELIMITED
    > FIELDS TERMINATED BY ','
    > LOCATION '/user/clouderademo/';



hive> set hive.mapred.supports.subdirectories=true;
hive> set hive.optimize.listbucketing=true;
hive> set mapred.input.dir.recursive=true;
hive> drop table if exists skew_demo;
hive> create table skew_demo (gender string, age int, salary double, zip int) skewed by (zip) on (95102,94040) stored as directories;
hive> insert overwrite table skew_demo select gender,age,salary,zip from salarydata;


[root@quickstart /]# hdfs dfs -ls -R /user/hive/warehouse/
drwxrwxrwx   - cloudera supergroup          0 2019-10-29 16:03 /user/hive/warehouse/skew_demo
drwxrwxrwx   - cloudera supergroup          0 2019-10-29 16:03 /user/hive/warehouse/skew_demo/HIVE_DEFAULT_LIST_BUCKETING_DIR_NAME
-rwxrwxrwx   1 cloudera supergroup        503 2019-10-29 16:03 /user/hive/warehouse/skew_demo/HIVE_DEFAULT_LIST_BUCKETING_DIR_NAME/000000_0
drwxrwxrwx   - cloudera supergroup          0 2019-10-29 16:03 /user/hive/warehouse/skew_demo/zip=94040
-rwxrwxrwx   1 cloudera supergroup        165 2019-10-29 16:03 /user/hive/warehouse/skew_demo/zip=94040/000000_0
drwxrwxrwx   - cloudera supergroup          0 2019-10-29 16:03 /user/hive/warehouse/skew_demo/zip=95102
-rwxrwxrwx   1 cloudera supergroup        214 2019-10-29 16:03 /user/hive/warehouse/skew_demo/zip=95102/000000_0

#select * from table_name [order | sort] by column_name;
select * from skew_demo limit 10
describe skew_demo;
select * from skew_demo order by age;

