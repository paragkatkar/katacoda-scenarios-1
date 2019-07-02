To download and install Kafka, do the following tasks.

**Task 1:** Download the code from the mirror site:

`curl -O http://apache.mirrors.lucidnetworks.net/kafka/2.2.0/kafka_2.12-2.2.0.tgz`{{execute}}

**Task 2:** Unzip the Tar Ball

`tar -xzf kafka_2.12-2.2.0.tgz`{{execute}}

**Task 3:** Go into the Kafka directory

`cd kafka_2.12-2.2.0`{{execute}}

**Task 4:** Become `super user`

`sudo su`{{execute}}


**Task 5:**: Make a change in `bin/kafka-run-class.sh` so that Kafka will run in Katacoda. (**NOTE:** This step is
special for running in the Katacoda interactive learning environment.)

`sed -i 's#$JAVA_HOME/bin/java#$JAVA_HOME/java#' bin/kafka-run-class.sh`{{execute}}

