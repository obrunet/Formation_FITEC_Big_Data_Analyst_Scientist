from kafka import KafkaProducer


file_path = 'survey.csv'
producer = KafkaProducer(bootstrap_servers='localhost:9092')
with open(file_path) as fp:
    line = fp.readline()
    while line:
        producer.send('test', line.encode())
        line = fp.readline()