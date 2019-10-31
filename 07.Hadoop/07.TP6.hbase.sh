hbase shell
status


# if zookeeper is dead relaunch docker
docker rm $(docker ps -a -q) --force
docker run --name=cloudera --hostname=quickstart.cloudera --cpus=4 -m=8g --privileged=true -t -i -v `pwd`:/src --publish-all=true -p 8888:8888 -p 7180:7180 cloudera/quickstart /usr/bin/docker-quickstart

# retry
hbase shell
status
version
whoami


# get help
table_help

# list all tables
list

# creation
create 'tablename','columnfamily'

# status of table
is_enabled 'tablename'
is_disabled 'tablename'
disable 'tablename'
enable 'tablename'
enable_all 'tb.*'
diable_all 'tb.*'
exists 'tb_classe'



# drop a table
disable 'tablename'
drop 'tablename'

# more info
describe 'tablename'
desc 'tablename'


# load data
create 'tablename', 'cf1', 'cf2'
put 'tablename', 'rowkey1', 'cf1:column_name1', 'valueA'
put 'tablename', 'rowkey1', 'cf1:column_name2', 'valueB'
put 'tablename', 'rowkey2', 'cf1:column_name1', 'valueC'
put 'tablename', 'rowkey2', 'cf1:column_name2', 'valueD'

# modify value
put 'tablename', 'rowkey1', 'cf1:column_name1', 'valueZ'

# get the content of one line
get ’<table name>’,’row1’
get 'tablename', 'rowkey1'

# get column family
get 'tablename', ‘rowid’, {COLUMN => ‘column family name’}
get 'emp', '1', {COLUMN => 'personal_data'}



# print table
scan 'tablename'
scan 'tablename' , { VERSIONS => 4}
scan 'test', {FILTER => "PrefixFilter('002')"}
# ou bien
scan 'test', STARTROW => '002', ENDROW => '003'


# nb of lines
count ‘<table name>’

# empty table
truncate ‘<table name>


# change structure
disable 'test'
alter 'test', NAME => 'data', VERSIONS => 4
enable 'test'


# get value with timestamp
get 'test', '002A', {COLUMN => 'data:details', TIMERANGE => [0, timestamp]}
get 'test', '002A', {COLUMN => 'data:details', TIMERANGE => [0, timestamp], VERSIONS => 4}


delete 'test', '002A', 'data:info'
scan 'test'


disable 'test'
alter 'test', 'delete' => 'data'
enable 'test'
scan 'test'


disable 'test'
drop 'test'
list


# ------------------------------------

hive> CREATE EXTERNAL TABLE
	> hbase_table_client (id int, name string)
	> STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
	> WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf:nom")
	> TBLPROPERTIES ("hbase.table.name" = "client");

hdfs dfs -ls /user/hive/warehouse

hive> select * from hbase_table_client