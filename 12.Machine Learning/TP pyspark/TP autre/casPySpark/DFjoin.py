# Databricks notebook source
#version simple DF
citiesDF=spark.sql("select * from cities c where c.insee_code=67529")
deptsDF=spark.sql("select * from departments d where d.code=67")
monumentsDF=spark.sql("select * from monument m where m.INSEE = 67529")

# COMMAND ----------

#aggregation de DFs...
newDF=monumentsDF.join(citiesDF,monumentsDF.INSEE==citiesDF.insee_code).join(deptsDF,monumentsDF.DPT==deptsDF.code)
display(newDF)
