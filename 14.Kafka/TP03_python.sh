# launch zookeeper
~/kafka_2.11-2.0.0/bin$ ./zookeeper-server-start.sh ../config/zookeeper.properties

# in a new shell : start kafka
~/kafka_2.11-2.0.0/bin$ ./kafka-server-start.sh ../config/server.properties

# pip3 install kafka-python

# run the consumer.py script before the producer.py in order to see data