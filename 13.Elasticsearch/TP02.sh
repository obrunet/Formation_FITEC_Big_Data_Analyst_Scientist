# add a new doc
curl -XPUT 'http://localhost:9200/clients/simple/clients4' -H'Content-Type: application/json' -d '
{
    "firstName": "Albert",
    "lastName": "ROUSSEAU",
    "age": 35,
    "address":
        {
            "rue": "18 rue Emile Laplante",
            "ville": "Paris",
            "CodePostal": "75014",
            "Pays": "France"
        },
    "NumeroTelephone": "33 09 00 90 78"
}'


# delete one doc
curl -X DELETE "http://localhost:9200/clients/simple/client1?pretty"


# search for a specific term
curl -XPOST "http://localhost:9200/clients/simple/_search?pretty" -H'Content-Type: application/json' -d'
{
    "query": {
        "match_phrase_prefix": {"ville": "Par"}
    }
}'