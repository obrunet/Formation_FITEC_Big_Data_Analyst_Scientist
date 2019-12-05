# create index with settings, you've to create a new index otherwise ELK won't accept
curl -XPUT "http://localhost:9200/biblioteque" -H "Content-Type:application/json" -d'
{
	"settings":{"index":{
	"number_of_shards":8,
	"number_of_replicas":2
}}}'



# ---------- add a new node (clusters are made of several nodes & each machine has a cluster) ---------- 
# change configurationconfig/elasticsearch.yml add the following line
node.max_local_storage_nodes: 2
# restart ELK
./elasticsearch-7.4.2-linux-x86_64/elasticsearch-7.4.2/bin/elasticsearch





