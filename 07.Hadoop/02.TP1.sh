sudo mv stocks.csv ./cloudera/stocks.csv
less stocks.csv
su cloudera

# put the file in HDFS
hdfs dfs -D dfs.blocksize=1048576 -put stocks.csv

# check if file is there
hdfs dfs -ls


# nb of blocks
hdfs fsck /user/cloudera/stocks.csv
# or if with root account 
hdfs fsck /user/root/src/stocks.csv

# get id blocs on datanodes
hdfs fsck /user/cloudera/stocks.csv -files -blocks

# get datanodes' IPs
hdfs fsck /user/cloudera/stocks.csv -files -blocks -locations


# read blocks of data

# (HDP) hortonworks 
cd /hadoop/hdfs/data/current/BP - xxx/current/finalized/
# (CDH) cloudera
cd /var/lib/hadoop-hdfs/cache/hdfs/dfs/data/current/BP-xxx//var/lib/hadoop-hdfs/cache/hdfs/dfs/data/current/BP-87068705-127.0.0.1-1459931051666/current/finalized/subdir0/subdir3

ll
# each block is 1,048,576 bytes.
tail blk_1073741905