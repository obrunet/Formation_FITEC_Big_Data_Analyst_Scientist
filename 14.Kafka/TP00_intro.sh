# launch zookeeper
~/kafka_2.11-2.0.0/bin$ ./zookeeper-server-start.sh ../config/zookeeper.properties

# in a new shell : start kafka
~/kafka_2.11-2.0.0/bin$ ./kafka-server-start.sh ../config/server.properties

# in a new shell : create a new kafka topic 
./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic sampleTopic

# create a kafka console producer
./kafka-console-producer.sh --broker-list localhost:9092 --topic sampleTopic

# Create a Kafka Console Consumer
./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic sampleTopic –from-beginning


=>Start typing messages in the producer. Consumer would get the messages via Kafka Topic !