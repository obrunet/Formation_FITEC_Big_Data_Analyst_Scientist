# Databricks notebook source
# MAGIC %md
# MAGIC 
# MAGIC ## Overview
# MAGIC 
# MAGIC This notebook will show you how to create and query a table or DataFrame that you uploaded to DBFS. [DBFS](https://docs.databricks.com/user-guide/dbfs-databricks-file-system.html) is a Databricks File System that allows you to store data for querying inside of Databricks. This notebook assumes that you have a file already inside of DBFS that you would like to read from.
# MAGIC 
# MAGIC This notebook is written in **Python** so the default cell type is Python. However, you can use different languages by using the `%LANGUAGE` syntax. Python, Scala, SQL, and R are all supported.

# COMMAND ----------

# File location and type
file_location = "FileStore/tables/cities.csv"
file_type = "csv"

# CSV options
infer_schema = "true"
first_row_is_header = "true"
delimiter = ","

# The applied options are for CSV files. For other file types, these will be ignored.
df = spark.read.format(file_type) \
  .option("inferSchema", infer_schema) \
  .option("header", first_row_is_header) \
  .option("sep", delimiter) \
  .load(file_location)

#display(df)

# COMMAND ----------

# Create a view or table

temp_table_name = "cities"

df.createOrReplaceTempView(temp_table_name)

# COMMAND ----------

# MAGIC %sql
# MAGIC 
# MAGIC /* Query the created temp table in a SQL cell */
# MAGIC 
# MAGIC select * from `cities`

# COMMAND ----------

# With this registered as a temp view, it will only be available to this particular notebook. If you'd like other users to be able to query this table, you can also create a table from the DataFrame.
# Once saved, this table will persist across cluster restarts as well as allow various users across different notebooks to query this data.
# To do so, choose your table name and uncomment the bottom line.

permanent_table_name = "cities"

df.write.format("parquet").saveAsTable(permanent_table_name)

# COMMAND ----------

# MAGIC %sql
# MAGIC select  count(insee_code) as count from cities

# COMMAND ----------

# MAGIC %sql
# MAGIC select sum(count) as total from (select  insee_code, count(insee_code) as count from cities group By(insee_code) having count >1 order by count DESC)

# COMMAND ----------

# MAGIC %sql
# MAGIC /*35338*/
# MAGIC select count(insee_code) as total from(select  insee_code, avg(slug), avg(gps_lat) , avg(gps_lng) from cities where (insee_code is not null) group by insee_code  order by insee_code desc)

# COMMAND ----------

dfCitiesAvecDoublon = sqlContext.sql("select insee_code, count(insee_code) as count from cities group By(insee_code) having count >1 order by count DESC")
dfCitiesAvecDoublon.select("insee_code").count()

# COMMAND ----------

dfCitiesClean = sqlContext.sql("select  insee_code, avg(gps_lat) , avg(gps_lng) from cities where (insee_code is not null) group by insee_code")


# COMMAND ----------

from pyspark.sql.functions import *
dfMonument = sqlContext.sql("select REF,REG,COM from monuments")
dfMonument.withColumn("REF", trim(dfMonument.REF)).withColumn("REG", upper(dfMonument.REG)).show(1)
dfMonument.schema

def clean(row):
  return(str.strip(row[0]),str.upper(row[1]),str(row[2]))

def cleanDF (df):
  return spark.createDataFrame(df.rdd.map(clean),df.schema)
  
dfMonumentClean= cleanDF(dfMonument)
dfMonumentClean.collect()

# COMMAND ----------

# MAGIC %sql
# MAGIC select count(*) from monuments where insee like "%75056%" 

# COMMAND ----------

from pyspark.sql.functions import *
df = sqlContext.table("monuments")
df =df.select(*[upper(col(col_name)).name(col_name) for col_name in df.columns])
df.show(1)

# COMMAND ----------

# MAGIC %sql
# MAGIC select count(*) from monuments where insee like "75056%" 

# COMMAND ----------

from pyspark.sql.functions import *

from pyspark.sql.types import StringType
def clear(entree):
  return str.strip("toto_"+entree)
clear_udf = udf(lambda x : clear(x), StringType())
dfMonument = sqlContext.table("monuments").select('REF',clear_udf('REF').alias('NEW_REF'), 'REG','COM')
dfMonument.show(1)


# COMMAND ----------

# MAGIC %sql
# MAGIC select insee, REF from monuments where insee like "%75056" 

# COMMAND ----------

# MAGIC %sql
# MAGIC select distinct(insee) from monuments where insee like "75056%" 
