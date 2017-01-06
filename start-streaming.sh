#Script to start the spark streaming to fetch tweets from twitter.

#Set the kafka bin path to PATH variable.
export KAFKA_HOME=/usr/hdp/current/kafka-broker
export PATH=$PATH:$KAFKA_HOME/bin

#Command to create the project related kafka topics.
kafka-topics.sh --create --topic twitterTopic --zookeeper localhost:2181 --replication-factor 1 --partitions 1
kafka-topics.sh --create --topic sentimentTopic --zookeeper localhost:2181 --replication-factor 1 --partitions 1

#command to build the twitter streaming jar file.
sbt assembly

#command to submit the jar file to spark to start the twitter streaming.
export SPARK_HOME=/usr/spark2.0.1
export PATH=$PATH:$SPARK_HOME/bin

spark-submit --class com.manju.twitter.TwitterStreaming --jars jars/stanford-corenlp-3.6.0-models.jar,jars/stanford-corenlp-3.6.0.jar,jars/ejml-0.23.jar target/twitterstreamingproject-assembly-1.0.jar