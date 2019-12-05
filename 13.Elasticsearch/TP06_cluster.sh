# node process
curl "localhost:9200/_nodes/process?pretty"

# state of clusters
curl "localhost:9200/_cluster/health?pretty"

# it's yellow so see available shards
curl "localhost:9200/_cat/shards"



# ---------------------- kibana ---------------------- 

# installation
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.5.0-linux-x86_64.tar.gz
tar xvf ...

# launch kibana
cd /kibana-7.5.0-linux-x86_64/bin
./kibana

http://localhost:5601/app/kibana#?_g=()