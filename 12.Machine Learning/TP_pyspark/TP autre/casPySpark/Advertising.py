# Databricks notebook source
df= spark.sql("select * from advertising")
df.show(5,True)

# COMMAND ----------

df.printSchema()

# COMMAND ----------

df.describe().show()

# COMMAND ----------

from pyspark.ml import Pipeline
from pyspark.ml.regression import LinearRegression
from pyspark.ml.feature import VectorIndexer
from pyspark.ml.evaluation import RegressionEvaluator
featureIndexer = VectorIndexer(inputCol="features", \
                               outputCol="indexedFeatures",\
                               maxCategories=4).fit(transformed)
data = featureIndexer.transform(transformed)
data.show(5,True)
display(data)

# COMMAND ----------

(trainingData, testData) = transformed.randomSplit([0.6, 0.4])
trainingData.show(5)
testData.show(5)

# COMMAND ----------

from pyspark.ml.regression import LinearRegression
lr = LinearRegression()
pipeline = Pipeline(stages=[featureIndexer, lr])
model = pipeline.fit(trainingData)

