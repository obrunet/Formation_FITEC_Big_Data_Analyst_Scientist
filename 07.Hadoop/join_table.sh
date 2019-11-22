CREATE TABLE join_table
FROM (

SELECT palissy_parquet.*, cities_parquet.*, department_parquet.*
FROM palissy_parquet
    JOIN cities_parquet
        ON cities_parquet.department_code = palissy_parquet.dpf
    JOIN department_parquet
        ON department_parquet.slug = cities_parquet.slug

)



SELECT * FROM palissy_parquet JOIN cities_parquet
ON palissy_parquet.dpf = cities_parquet.department_code

SELECT * FROM cities_parquet JOIN department_parquet
ON cities_parquet.slug = department_parquet.slug



SELECT TableA.*, TableB.*, TableC.*, TableD.*
FROM TableA
    JOIN TableB
        ON TableB.aID = TableA.aID
    JOIN TableC
        ON TableC.cID = TableB.cID
    JOIN TableD
        ON TableD.dID = TableA.dID








SELECT t1.c1, t2.c2 FROM t1 JOIN t2
  ON t1.id = t2.id and t1.type_flag = t2.type_flag