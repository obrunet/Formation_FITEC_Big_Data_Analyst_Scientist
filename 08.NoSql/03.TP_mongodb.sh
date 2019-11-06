> mongo
MongoDB shell version v3.6.3
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 3.6.3



> show test;
#2019-11-06T11:33:48.761+0100 E QUERY    [thread1] Error: don't know how to show [test] :
#shellHelper.show@src/mongo/shell/utils.js:953:11
#shellHelper@src/mongo/shell/utils.js:706:15
@(shellhelp2):1:1
> show dbs;
admin   0.000GB
config  0.000GB
local   0.000GB



> db.help();
DB methods:


> use test;
# create a collection
> db.personne.insert({nom: "Wick", prenom: "John"});
WriteResult({ "nInserted" : 1 })

> show collections;
personne
> db
test
> db.personne.find()
{ "_id" : ObjectId("5dc2a2c6e4dba17814366ad0"), "nom" : "Wick", "prenom" : "John" }

> db.personne.update({"nom" : "Wick"}, {$set : {"key1": "val1"}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.personne.find()
{ "_id" : ObjectId("5dc2a2c6e4dba17814366ad0"), "nom" : "Wick", "prenom" : "John", "key1" : "val1" }
> db.personne.updateMany({nom: "Wick"}, {$unset: {nom:0}})
{ "acknowledged" : true, "matchedCount" : 3, "modifiedCount" : 3 }
> db.personne.find()
{ "_id" : ObjectId("5dc2a2c6e4dba17814366ad0"), "prenom" : "John", "key1" : "val1" }
{ "_id" : ObjectId("5dc2a5dfe4dba17814366ad3"), "nom" : "YOUYOU", "prenom" : "test" }




> db.personne.find().sort({age: 1})
{ "_id" : ObjectId("5dc2a2c6e4dba17814366ad0"), "prenom" : "John", "key1" : "val1" }
{ "_id" : ObjectId("5dc2a2e3e4dba17814366ad1"), "prenom" : "John" }
{ "_id" : ObjectId("5dc2a30ce4dba17814366ad2"), "prenom" : "John" }
{ "_id" : ObjectId("5dc2c4fae4dba17814366ad4"), "nom" : "YOUYOU", "age" : 1 }
{ "_id" : ObjectId("5dc2a5dfe4dba17814366ad3"), "nom" : "YOUYOU", "prenom" : "test", "age" : 20 }
> db.personne.find().sort({age: -1})
{ "_id" : ObjectId("5dc2a5dfe4dba17814366ad3"), "nom" : "YOUYOU", "prenom" : "test", "age" : 20 }
{ "_id" : ObjectId("5dc2c4fae4dba17814366ad4"), "nom" : "YOUYOU", "age" : 1 }
{ "_id" : ObjectId("5dc2a2c6e4dba17814366ad0"), "prenom" : "John", "key1" : "val1" }
{ "_id" : ObjectId("5dc2a2e3e4dba17814366ad1"), "prenom" : "John" }
{ "_id" : ObjectId("5dc2a30ce4dba17814366ad2"), "prenom" : "John" }
