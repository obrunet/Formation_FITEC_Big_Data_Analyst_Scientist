# list files recursively
hdfs dfs -ls -R

# create a dir
hdfs dfs -mkdir test5

# create a subdir
hdfs dfs -mkdir test5/testbis

# remove recursively folder and subdirs
hdfs dfs -rm -r test5

# copy a file
hdfs dfs -cp stocks.csv test/

# see a file
hdfs dfs -cat stocks.csv
hdfs dfs -tail stocks.csv

# retrieve a file locally
sudo hdfs dfs -get stocks.csv test_local.csv

# merge two files 
hdfs dfs -cp stocks.csv stock_bis.csv
# the test_local.csv file must exists before
sudo hdfs dfs -getmerge stocks.csv stocks.csv test_local.csv 

#hdfs dfs -getmerge -nl /src /opt/output.txt
#hdfs dfs -getmerge -nl /src/file1.txt /src/file2.txt /output.txt

# workiing comd
hdfs dfs -getmerge -nl test/ter.csv test/bis.csv /tmp/output.csv