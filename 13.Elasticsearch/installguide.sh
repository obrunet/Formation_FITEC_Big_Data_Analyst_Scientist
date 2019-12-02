# download Elasticsearch & Kibana images
docker pull docker.elastic.co/elasticsearch/elasticsearch-platinum:6.0.0
docker pull docker.elastic.co/kibana/kibana:6.0.0


# run Basic Auth Elasticsearch(user: 'elastic', pw 'secret') daemon
# in auto-remove mode, start takes 20+ seconds
docker run -d --rm -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "transport.host=127.0.0.1" -e ELASTIC_PASSWORD=secret --name elastic docker.elastic.co/elasticsearch/elasticsearch-platinum:6.0.0 && sleep 20


# run Kibana daemon in auto-remove mode
# start takes 20+ seconds
docker run -d --rm --link elastic:elastic-url -e "ELASTICSEARCH_URL=http://elastic-url:9200" -e ELASTICSEARCH_PASSWORD="secret"  -p 5601:5601 --name kibana docker.elastic.co/kibana/kibana:6.0.0 && sleep 20


# check connection to Elasticsearch (JSON is returned)
curl "http://localhost:9200/_count" -u 'elastic:secret'


# check connection to Kibana (HTML is returned)
curl http://localhost:5601 --location