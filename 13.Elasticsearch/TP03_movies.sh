# copy file in the dir of elasticsearch server bin
cp Formation/Formation_FITEC_Big_Data_Analyst_Scientist/13.Elasticsearch/movies_elastic.json elasticsearch-7.4.2-linux-x86_64/elasticsearch-7.4.2/bin/


# load file
curl -XPUT -H"Content-Type: application/json" localhost:9200/_bulk --data-binary @movies_elastic.json

# 1- let's check its content
curl -XGET "http://localhost:9200/movies?pretty"
# or in the browser
http://localhost:9200/movies/movie/_search?pretty


# 2- show starwars movies (fields.title because title is in the field format)
curl -XGET "http://localhost:9200/movies/movie/_search?pretty"  -H 'Content-Type: application/json' -d'
{
   "query" : {
 		"match_phrase" : { "fields.title" : "Star Wars" }
		}
}'


# 3- with title and plot
curl -XGET "http://localhost:9200/movies/movie/_search?pretty"  -H 'Content-Type: application/json' -d'
{
   "query" : {
 		"match_phrase" : { "fields.title" : "Star Wars" }
		},
    "_source": ["fields.title","fields.plot"]
}'