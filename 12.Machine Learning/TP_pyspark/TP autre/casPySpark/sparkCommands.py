# Databricks notebook source
# MAGIC %python
# MAGIC words = sc.parallelize (
# MAGIC    ["scala", 
# MAGIC    "java", 
# MAGIC    "hadoop",
# MAGIC     "toto",
# MAGIC    "spark", 
# MAGIC    "akka",
# MAGIC    "spark vs hadoop", 
# MAGIC    "pyspark",
# MAGIC    "pyspark and spark"]
# MAGIC )

# COMMAND ----------

counts = words.count()
print("Number of elements in RDD -> %i" % (counts))

# COMMAND ----------

coll = words.collect()
print ("Elements in RDD -> %s" % (coll))

# COMMAND ----------

def f(x):
  print(x)
fore=words.foreach(f) 

# COMMAND ----------

words_filter = words.filter(lambda x: 'spark' in x)
filtered = words_filter.collect()
print ("Fitered RDD -> %s" % (filtered))

# COMMAND ----------

words_map = words.map(lambda x: (x, 1))
print(words_map.count())
print(words.count())
mapping = words_map.collect()
print ("Key value pair -> %s" % (mapping))

# COMMAND ----------

nums = sc.parallelize([1, 2, 3, 4, 5,6])
adding = nums.reduce(lambda a,b:a*b)
print ("Adding all the elements -> %i" % (adding))


# COMMAND ----------

words_filter = words.filter(lambda x: 's' in x)
filtered = words_filter.collect()
print ("Fitered RDD -> %s" % (filtered))

# COMMAND ----------

x = sc.parallelize([("spark", 1), ("hadoop", 4)])
y = sc.parallelize([("spark", 2), ("hadoop", 5)])
joine = x.join(y)
print ("Join RDD -> %s" % (joined))
final = joined.collect()
print ("Join RDD -> %s" % (final))


# COMMAND ----------

joine.cache() 
caching = joine.is_cached 
print ("got chached > %s" % (caching))

# COMMAND ----------

words_new = sc.broadcast(["scala", "java", "hadoop", "spark", "akka"]) 
data = words_new.value 
print("Stored data -> %s" % (data))
elem = words_new.value[1] 
print ("Printing a particular element in RDD -> %s" % (elem))

# COMMAND ----------

num = sc.accumulator(140) 
def f(x): 
   global num 
   num+=x 
rdd = sc.parallelize([20,30,40,50]) 
rdd.foreach(f) 
final = num.value 
print ("Accumulated value is -> %i" % (final))
print(num.is_cached) 

# COMMAND ----------

display(words)
