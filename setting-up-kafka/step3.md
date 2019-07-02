Now we'll create a topic into which we'll publish messages. We'll name the topic, `test`.

**Task 1:** Go into a third terminal and then into the Kafka director

`cd kafka_2.12-2.2.0`{{execute T3}}

**Task 2:** Create a Topic names, `test`

`bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test`{{execute T3}}

**Task 3:** Confirm the Topic

`bin/kafka-topics.sh --list --bootstrap-server localhost:9092`{{execute T3}}

**Task 4:** Write to the Topic

`bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test`{{execute T3}}

`Kafka is Cool`{{execute T3}}

`I am not.`{{execute T3}}

**Task 5:** Exiting out of the Topic

`echo "Exiting out of the Producer"`{{execute interrupt T3}}