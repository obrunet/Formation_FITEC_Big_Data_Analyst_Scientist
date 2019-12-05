# --------------- installation ---------------

# Logstash requires Java 8 or Java 11. Use the official Oracle distribution or an open-source distribution such as OpenJDK.
# use the binary .deb file or install from src / ppa


# --------------- delete old index ---------------
 curl -X DELETE "localhost:9200/movies?pretty"


# --------------- loading with logstash ---------------

# find bin & conf
whereis logstash


cd /etc/logstash
sudo vim chargement.conf 
fitec@fitec-ThinkPad-P52s:/etc/logstash$ cat chargement.conf 

_____________________________________________________________________

# Sample Logstash configuration for creating a simple
# Beats -> Logstash -> Elasticsearch pipeline.

input {
  file {
    path  => "/home/fitec/Formation/Formation_FITEC_Big_Data_Analyst_Scientist/13.Elasticsearch/movies_elastic.json"
    start_position => "beginning"
    sincedb_path => "/dev/null"
  }
}

output {
  elasticsearch {
    hosts => ["http://localhost:9200"]
    index => "movies"
    #user => "elastic"
    #password => "changeme"
  }
}
_____________________________________________________________________

# launch the cmd to load file
sudo /usr/share/logstash/bin/logstash -f /etc/logstash/chargement.conf

# check the index
curl -XGET "http://localhost:9200/movies?pretty"
