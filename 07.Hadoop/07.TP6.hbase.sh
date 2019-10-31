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