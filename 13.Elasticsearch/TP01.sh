# launch the server
fitec@fitec-ThinkPad-P52s:~/elasticsearch-7.4.2-linux-x86_64/elasticsearch-7.4.2/bin$ ./elasticsearch


# connect to localhost:9200 with your web browser
# sudo apt install curl if needed


# create client index
>curl -XPUT 'http://localhost:9200/clients'
>{"acknowledged":true,"shards_acknowledged":true,"index":"cients"}


# default index caracteristics
>curl -XGET 'http://localhost:9200/clients'
>{"cients":{"aliases":{},"mappings":{},"settings":{"index":{"creation_date":"1575294056295","number_of_shards":"1","number_of_replicas":"1","uuid":"m8hxsGxkRqOiKu-XkTVPTQ","version":{"created":"7040299"},"provided_name":"cients"}}}}


# add file client1 of type simple
curl -XPUT 'http://localhost:9200/clients/simple/client1' -H'Content-Type: application/json' -d'
{
	"client1":[
	{
		"firstName": "giovani",
		"lastName": "GHISLAIN",
		"age": "27",
		"NumeroTelephone": "33 00 07 09 46"
	},
	{
		"firstName": "Nicolas",
		"lastName": "LAFONTAINE",
		"age": "32",
		"NumeroTelephone": "33 00 95 47 00"
	}
	]
}'

# the 2nd one 
curl -XPUT 'http://localhost:9200/clients/simple/client2' -H'Content-Type: application/json' -d'
{
  "client2": [
    {
        "firstName": "Jules",
        "lastName": "Dorian",
        "age": "35",
        "NumeroTelephone": "33 06 98 40 50"
    },
    {
        "firstName": "Christine",
        "lastName": "LABOMBE",
        "age": "29",
        "NumeroTelephone": "33 09 77 78 66"
    }
    ]
}'


# the 3rd one 
curl -XPUT 'http://localhost:9200/clients/simple/clients3' -H'Content-Type: application/json' -d '
{
    "firstName": "Juvénal",
    "lastName": "BERTRAND",
    "age": 30,
    "address":
        {
            "rue": "40 Rue ville Epinay",
            "ville": "Paris",
            "CodePostal": "75000",
            "Pays": "France"
        },
    "NumeroTelephone": "33 09 87 90 78"
}'


# the 4th and last one
curl -XPUT 'http://localhost:9200/clients/simple/clients4' -H'Content-Type: application/json' -d '
{
    "firstName": "Julie",
    "lastName": "LABELLE",
    "age": 26,
    "address":
      {
          "rue": "60 Rue des oliviers",
          "ville": "Boissy Saint Leger",
          "CodePostal": "75000",
          "Pays": "France"
      },
    "NumeroTelephone": "33 07 40 70 77"
}'


# let's check with a pretty looks like
# or follow the link : http://localhost:9200/clients?pretty in your browser
curl -XGET 'http://localhost:9200/clients?pretty'
curl -XGET 'http://localhost:9200/clients/simple/clients3?pretty'


# with an error _search without __ underscore
http://localhost:9200/clients/simple/_search?q=ville:paris&pretty
{
  "error" : {
    "root_cause" : [
      {
        "type" : "illegal_argument_exception",
        "reason" : "request [/clients/simple/search] contains unrecognized parameter: [q]"
      }
    ],
    "type" : "illegal_argument_exception",
    "reason" : "request [/clients/simple/search] contains unrecognized parameter: [q]"
  },
  "status" : 400
}


# with the right syntax : found successfullly one occurence !
curl -XGET "http://localhost:9200/clients/simple/_search?q=ville:Paris&pretty"
{
  "took" : 2,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 0,
      "relation" : "eq"
    },
    "max_score" : null,
    "hits" : [ ]
  }
}


# with multiple index
curl -XGET "localhost:9200/index1,index2/..."
curl -XGET "localhost:9200/_all/..."