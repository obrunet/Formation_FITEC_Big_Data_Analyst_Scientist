# from home
sudo chmod -R 777 kafka_2.11-2.0.0

# same as before
./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic jems
