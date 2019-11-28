# Databricks notebook source
words = sc.parallelize (
   ["scala", 
   "java", 
   "hadoop", 
   "spark", 
   "akka",
   "spark vs hadoop", 
   "pyspark",
   "pyspark and spark"]
)
coll = words.collect()
print "Elements in RDD -> %s" % (coll)


# COMMAND ----------

words = sc.parallelize (
   ["scala", 
   "java", 
   "hadoop", 
   "spark", 
   "akka",
   "spark vs hadoop", 
   "pyspark",
   "pyspark and spark"]
)
words_map = words.map(lambda x: (x, 1))
mapping = words_map.collect()
print "Key value pair -> %s" % (mapping)

# COMMAND ----------

def add(a,b):
  return a+b;

nums = sc.parallelize([1, 2, 3, 4, 5])
adding = nums.reduce(add)
print "Adding all the elements -> %i" % (adding)

# COMMAND ----------

#jointure
x = sc.parallelize([("spark", 1), ("hadoop", 4)])
y = sc.parallelize([("spark", 2), ("hadoop", 5)])
joined = x.join(y)
final = joined.collect()
print "Join RDD -> %s" % (final)

# COMMAND ----------

words.cache() 
caching = words.persist().is_cached 
print "Words got chached > %s" % (caching)

# COMMAND ----------

#Broadcast variables are used to save the copy of data across all nodes. This variable is cached on all the machines and not sent on machines with tasks. 

words_new = sc.broadcast(["scala", "java", "hadoop", "spark", "akka"]) 
data = words_new.value 
print "Stored data -> %s" % (data) 
elem = words_new.value[2] 
print "Printing a particular element in RDD -> %s" % (elem)

# COMMAND ----------

#Accumulator variables are used for aggregating the information through associative and commutative operations. For example, you can use an accumulator for a sum operation or counters (in MapReduce).


num = sc.accumulator(15) 
def f(x): 
   global num 
   num+=x 
rdd = sc.parallelize([20,30,40,50]) 
rdd.foreach(f) 
final = num.value 
print "Accumulated value is -> %i" % (final)

# COMMAND ----------

# StorageLevel(useDisk, useMemory, useOffHeap, deserialized, replication = 1)
#DISK_ONLY = StorageLevel(True, False, False, False, 1)
#DISK_ONLY_2 = StorageLevel(True, False, False, False, 2)
#MEMORY_AND_DISK = StorageLevel(True, True, False, False, 1)
#MEMORY_AND_DISK_2 = StorageLevel(True, True, False, False, 2)
#MEMORY_AND_DISK_SER = StorageLevel(True, True, False, False, 1)
#MEMORY_AND_DISK_SER_2 = StorageLevel(True, True, False, False, 2)
#MEMORY_ONLY = StorageLevel(False, True, False, False, 1)
#MEMORY_ONLY_2 = StorageLevel(False, True, False, False, 2)
#MEMORY_ONLY_SER = StorageLevel(False, True, False, False, 1)
#MEMORY_ONLY_SER_2 = StorageLevel(False, True, False, False, 2)
#OFF_HEAP = StorageLevel(True, True, True, False, 1)
from pyspark import SparkContext
import pyspark
rdd1 = sc.parallelize([1,2])
rdd1.persist( pyspark.StorageLevel.MEMORY_AND_DISK_2 )
rdd1.getStorageLevel()
print(rdd1.getStorageLevel())

# COMMAND ----------

dataPath = "/databricks-datasets/Rdatasets/data-001/csv/ggplot2/diamonds.csv"
diamonds = spark.read.format("csv").option("header","true").option("inferSchema", "true").load(dataPath) # Read diamonds dataset and crate DataFrame
display(diamonds)
toto = diamonds.groupBy("color").avg("price")
display(toto
       )


# COMMAND ----------

words_new = sc.broadcast(["scala", "java", "hadoop", "spark", "akka"]) 
data = words_new.value 
print "Stored data -> %s" % (data) 
elem = words_new.value[1] 
print "Printing a particular element in RDD -> %s" % (elem)
