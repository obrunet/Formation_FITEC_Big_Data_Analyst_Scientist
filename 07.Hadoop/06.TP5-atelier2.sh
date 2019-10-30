[root@quickstart /]# hdfs dfs -ls -R /user/hive/warehouse/
drwxr-xr-x   - root     supergroup          0 2019-10-29 10:16 /user/hive/warehouse/wh_visits
-rw-r--r--   1 root     supergroup    1136008 2019-10-29 10:16 /user/hive/warehouse/wh_visits/visits.txt

# find first 10 visitors of the white house
hive> select * from wh_visits where time_of_arrival != "";

vi whitehouse.hive
hive> select * from wh_visits
	> where time_of_arrival != ""
	> order by unix_timestamp(time_of_arrival, 'MM/dd/yyyy hh:mm')
	> limit 10;

# not in /src/ but above
hive -f ../whitehouse.hive




# find last visit - with desc
select * from wh_visits
where time_of_arrival != ""
order by unix_timestamp(time_of_arrival, 'MM/dd/yyyy hh:mm')
desc
limit 10;





# find most common comments
select count(*) as comment_count, info_comment
from wh_visits
group by info_comment
order by comment_count DESC
limit 10;

hive -f ../comments.hive
# add then where info_comment != "" to ignore blank comment

# the less common comments
ASC




# analyse inconsistencies
select count(*) as comment_count, info_comment
from wh_visits
where info_comment like "%GEN%RECEP%"
group by info_comment
order by comment_coun
t DESC
limit 30;

select
count(*) as comment_count
from wh_visits
where info_comment like "%GEN%RECEP%";

2697
