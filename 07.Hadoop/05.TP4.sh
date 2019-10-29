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
hive> LOAD DATA INPATH '/user/cloudera/demo/Master.csv' OVERWRITE INTO TABLE temp_master;
select * from temp_master
drop table temp_master;
# the file is deleted because it's an local db


# ----------------------------- PARTITIONS -----------------------------
create table names (id int, name string)
partitioned by (state string)
row format delimited fields terminated by '\t';





