Now that Kafka is installed, we need to start [ZooKeeper](https://zookeeper.apache.org/), which ships with the Kafka download, and Kafka.

**Task 1:** Start Zookeeper

`bin/zookeeper-server-start.sh config/zookeeper.properties`{{execute}}

**Task 2:** To new terminal and go into the Kafka directory

`cd kafka_2.12-2.2.0/`{{execute T2}}

**Task 3:** Start Kafka

`bin/kafka-server-start.sh config/server.properties`{{execute T2}}