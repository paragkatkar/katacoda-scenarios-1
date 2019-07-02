Finally, we'll consume the messages we sent into the `test` topic previously.

**Task 1:** Run the Consumer to get all message from the beginning pf the Kafka stream.

`bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning`{{execute T3}}