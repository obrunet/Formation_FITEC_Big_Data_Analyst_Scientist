# Databricks notebook source
# MAGIC %python
# MAGIC dat_1=sc.parallelize(range(0, 6))
# MAGIC print(dat_1)
# MAGIC coll = dat_1.collect()
# MAGIC print(coll)

# COMMAND ----------

# MAGIC %python
# MAGIC coll = dat_1.collect()
# MAGIC print(coll)

# COMMAND ----------

dat_1=sc.parallelize(["scala", "java", "hadoop", "spark", "akka","spark vs hadoop","pyspark", "pyspark and spark"])
coll = dat_1.collect()
print ("Elements in RDD -> ",coll)


# COMMAND ----------

words = sc.parallelize (["scala", "java", "hadoop", "spark", "akka","spark vs hadoop","pyspark", "pyspark and spark"])
coll = words.collect()
print ("Elements in RDD -> %s" % coll)


# COMMAND ----------

words_map = words.map(lambda x: (x, 1))
coll = words_map.collect()
print ("Elements in RDD -> %s" % coll)

# COMMAND ----------

from random import sample, random

# COMMAND ----------

print(dat_1)
dat_1=dat_1.map(lambda x:(x, sample(["a", "b","c"], 1)[0]))
coll = dat_1.collect()
print ("Elements in RDD -> ",coll)

# COMMAND ----------

dat_2=sc.parallelize(range(1, 5+1))
coll = dat_2.collect()
print ("Elements in RDD -> ",coll)



# COMMAND ----------

data3 = dat_2.map(lambda x:(x, random()))

print ("Elements in RDD -> ",coll)

# COMMAND ----------

print(dat_2.is_cached)
coll = dat_2.map(lambda x:(x, random())).collect()
print ("Elements in RDD -> ",coll)

# COMMAND ----------

words = sc.parallelize (["scala_a", "java_b", "hadoop_c", "spark_d", "akka_e","spark vs hadoop_f","pyspark_g", "pyspark and spark_h"])
wUpperCase = words.map(lambda x:x.split("_")).map(lambda x:[x[0],x[1].upper()]).map(lambda  x:[x,x]).flatMap(lambda x:x).flatMap(lambda x:x).map(lambda x :x.split(" ")).flatMap(lambda x:x)
print ("Elements in RDD -> ",wUpperCase.collect())
print ("Elements in RDD distinct  -> ",wUpperCase.distinct().sortBy(lambda x: x.lower()).collect())

# COMMAND ----------

import numpy as np
tableau =np.random.rand(10,2)

# COMMAND ----------

tRDD = sc.parallelize(tableau)

# COMMAND ----------

print(tRDD.collect())

# COMMAND ----------

from pyspark.sql import Row
def typer(ligne) :
  return Row(mininum=float(ligne[0]),maximum=float(ligne[1]))
datasetMignon =tRDD.map(typer)

# COMMAND ----------


myDF = sqlContext.createDataFrame(datasetMignon)
myDF.printSchema()
display(myDF)

# COMMAND ----------

tfRDD = tRDD.filter(lambda row : row[0]>0.2 and row[0]<0.5 and row[2]>0.2 and row[2]<0.5)

# COMMAND ----------

tfRDD.count()

# COMMAND ----------

tfRDD.persist()

# COMMAND ----------

tRDD.map(lambda row :  row[0]+row[65]).reduce(lambda a,b:a+b)

# COMMAND ----------

def filtreJaune(ligne):
  return ligne[0]>0.2 and ligne[0]<0.5 and ligne[2]>0.2 and ligne[2]<0.5)
tfRDDLight = tRDD.filter(filtreJaune)

# COMMAND ----------

tfRDDLight.count()

# COMMAND ----------

import numpy as np
from numpy import random
import pandas as pd
from pandas import DataFrame
from random import randint
from pyspark.sql import Row

Ref=[x for x in range(1, 1000+1)]
Vente=x = [randint(0, 100) for p in range(0, 1000)]
Achat=[randint(0, 50) for p in range(0, 1000)]
Stock=[randint(100, 300) for p in range(0, 1000)]
data=pd.DataFrame({'Ref':Ref, 'Vente':Vente, 'Achat':Achat, 'Stock':Stock}, index=Ref)

data

data=data.values

RDD=sc.parallelize(data)

RDD.collect()

RDDratio=RDD.map(lambda x: [x[1], x[3], x[0], x[2], x[3]/(x[2]+x[0])])

RDDratio.collect()

def toROW(ligne):
  return Row (Achat=int(ligne[0]),Ref=int(ligne[1]),Stock=int(ligne[2]),Vente=int(ligne[3]))

#manque à gagner
rddmg=RDD.filter(lambda x: (x[3]*3>x[0]*3+x[2])).map(toROW)
print(rddmg.count())

DFmg=sqlContext.createDataFrame(rddmg)
DFmg=DFmg.withColumn("mg",(DFmg.Vente*1*3)-(DFmg.Stock+(DFmg.Achat*3))*0.5)
display(DFmg)

#perte
rddpt=RDD.filter(lambda x: (x[3]*3<x[0]*3+x[2])).map(toROW)

#success deal
rddsd=RDD.filter(lambda x: (x[3]*3==x[0]*3+x[2])).map(toROW)
print(rddsd.count())

DFpt=sqlContext.createDataFrame(rddpt)
DFpt=DFpt.withColumn("pt",(DFpt.Stock+(DFpt.Achat*3)-DFpt.Vente*3)*0.5)
display(DFpt)


# COMMAND ----------

#display(DFmg)
#DFmg.groupBy().sum("mg").show()

#DFpt.groupBy().sum("pt").show()


DFmg.registerTempTable("manque")
DFpt.registerTempTable("perte")

# COMMAND ----------

DFAlexa = sqlContext.sql("select ref, mg from manque order by mg DESC limit 10")
DFAlexa.printSchema()
DFAlexa.show(2)

# COMMAND ----------

# MAGIC %sql
# MAGIC select ref, mg from manque order by mg DESC limit 10

# COMMAND ----------

# MAGIC %sql
# MAGIC select sum(pt) as perte from perte
