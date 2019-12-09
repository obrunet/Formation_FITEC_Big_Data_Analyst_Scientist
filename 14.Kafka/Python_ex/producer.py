from kafka import KafkaProducer

filepath = 'xxxx'
producer = KafkaProducer(bootstrap_servers='localhost:9092')
with open(filepath) as fp:
    line = fp.readline()
    while line:
        producer.send('test', line.encode())
        line = fp.readline()