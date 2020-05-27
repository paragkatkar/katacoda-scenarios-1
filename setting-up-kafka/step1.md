To download and install Kafka, do the following tasks.

**Task 1:** Download the code from the mirror site:

`curl -O http://us.mirrors.quenda.co/apache/kafka/2.5.0/kafka_2.12-2.5.0.tgz`{{execute}}

**Task 2:** Unzip the Tar Ball

`tar -xzf kafka_2.12-2.5.0.tgz`{{execute}}

**Task 3:** Go into the Kafka directory

`cd kafka_2.12-2.5.0`{{execute}}

**Task 4:**: Make a change in `bin/kafka-run-class.sh` so that Kafka will run in Katacoda. (**NOTE:** This step is
special for running in the Katacoda interactive learning environment.)

`sed -i 's#$JAVA_HOME/bin/java#$JAVA_HOME/java#' bin/kafka-run-class.sh`{{execute}}

