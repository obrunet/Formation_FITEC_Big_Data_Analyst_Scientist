# Databricks notebook source
# File location and type
file_location = "/FileStore/tables/palissy_MH_valid_csv-26231.utf"
file_type = "utf"

# CSV options
infer_schema = "true"
first_row_is_header = "true"
delimiter = "|"

# The applied options are for CSV files. For other file types, these will be ignored.
df = spark.read.format("csv") \
  .option("inferSchema", infer_schema) \
  .option("header", first_row_is_header) \
  .option("delimiter", delimiter) \
  .load(file_location)

display(df)

# COMMAND ----------

# Create a view or table

temp_table_name = "monuments"

df.registerTempTable(temp_table_name)

# COMMAND ----------

# MAGIC %sql
# MAGIC 
# MAGIC /* Query the created temp table in a SQL cell */
# MAGIC 
# MAGIC select * from `monuments`

# COMMAND ----------

# With this registered as a temp view, it will only be available to this particular notebook. If you'd like other users to be able to query this table, you can also create a table from the DataFrame.
# Once saved, this table will persist across cluster restarts as well as allow various users across different notebooks to query this data.
# To do so, choose your table name and uncomment the bottom line.

permanent_table_name = "monument"

df.write.format("parquet").saveAsTable(permanent_table_name)
